open Glescaml

let print_log o =
  let infoLog = String.create 1024 in
  let infologLength = [| String.length infoLog |] in
  let _ =
  if (glIsShader o) then
    glGetShaderInfoLog o 1024 infologLength infoLog
  else
    glGetProgramInfoLog o 1024 infologLength infoLog
  in
  let s = 
    try  let i = String.index infoLog '\x00' in String.sub infoLog 0 i
    with Not_found -> infoLog
  in
  if s <> "" then print_endline s

let fsSource = "
/* Fragment shader */
void main()
{
 gl_FragColor[0] = gl_FragCoord[0] / 400.0;
 gl_FragColor[1] = gl_FragCoord[1] / 400.0;
 gl_FragColor[2] = 1.0;
}
"

let vsSource = "
/* Vertex shader */
attribute vec4 position;
uniform mat4 modelViewProjectionMatrix;
uniform float waveTime;
uniform float waveWidth;
uniform float waveHeight;

void main(void)
{
 vec4 v = position;

 v.z = sin(waveWidth * v.x + waveTime) * cos(waveWidth * v.y + waveTime) * waveHeight;

 gl_Position = v * modelViewProjectionMatrix;
}
"

let vertices =
  let n = 30 in
  let lst = ref [] in
  let add_vert i j =
    let x, y, z = float_of_int i, float_of_int j, 0.0 in
    lst := z :: y :: x :: !lst in
  for i = -n to n do
    for j = -n to n do
      add_vert i j;
      add_vert (i + 1) j;
      add_vert (i + 1) (j + 1);

      add_vert (i + 1) (j + 1);
      add_vert i (j + 1);
      add_vert i j;
    done
  done;
  Bigarray.(Array1.(of_array float32 c_layout (Array.of_list (List.rev !lst))))

let indices = 
  Bigarray.(
    let lst = ref [] in
    for i = 0 to Array1.dim vertices - 1 do lst := i :: !lst done;
    Array1.(of_array int16_unsigned c_layout (Array.of_list (List.rev !lst))))

let byte_size_of_array1 arr = (* TODO: move to glescaml.ml *)
  Bigarray.(Array1.(
    let eltsize = match kind arr with
        float32        -> 4
      | int16_unsigned -> 2
    in
    dim arr * eltsize
  ))

let vertexBuffer = ref 0
let indexBuffer = ref 0

let waveTime = ref 0.0
let waveWidth = ref 0.1
let waveHeight = ref 3.0
let waveFreq = ref 0.1
let waveTimeLoc = ref 0
let waveWidthLoc = ref 0
let waveHeightLoc = ref 0
let fill = ref true

let mvpMatLoc = ref 0

let init () =
  glViewport 0 0 (Graphics.size_x()) (Graphics.size_y());
  let vs = glCreateShader gl_vertex_shader in
  glShaderSource vs 1 [| vsSource |] [| String.length vsSource |];
  glCompileShader vs;
  print_log vs;
  let fs = glCreateShader gl_fragment_shader in
  glShaderSource fs 1 [| fsSource |]  [|  String.length fsSource |];
  glCompileShader fs;
  print_log fs;
  let sp = glCreateProgram () in
  glAttachShader sp vs;
  glAttachShader sp fs;
  glLinkProgram sp;
  print_log sp;
  glUseProgram sp;
  waveTime := 0.0;
  waveWidth := 0.1;
  waveHeight := 3.0;
  waveFreq := 0.1;
  waveTimeLoc := glGetUniformLocation sp "waveTime";
  waveWidthLoc := glGetUniformLocation sp "waveWidth";
  waveHeightLoc := glGetUniformLocation sp "waveHeight";
  print_log sp;
  Printf.printf "wave parameters location: %d %d %d\n" !waveTimeLoc !waveWidthLoc !waveHeightLoc;

  let arr = [| 0 |] in glGenBuffers 1 arr; vertexBuffer := arr.(0);
  glBindBuffer gl_array_buffer !vertexBuffer;
  glBufferData gl_array_buffer (byte_size_of_array1 vertices) vertices gl_static_draw;
  glVertexAttribPointer (glGetAttribLocation sp "position") 3 gl_float false 0 0;
  glEnableVertexAttribArray (glGetAttribLocation sp "position");
  
  let arr = [| 0 |] in glGenBuffers 1 arr; indexBuffer := arr.(0);
  glBindBuffer gl_element_array_buffer !indexBuffer;
  glBufferData gl_element_array_buffer (byte_size_of_array1 indices) indices gl_static_draw;

  Printf.printf "vertexBuffer: %d, indexBuffer: %d\n%!" !vertexBuffer !indexBuffer;

  mvpMatLoc := glGetUniformLocation sp "modelViewProjectionMatrix";

  ()

let draw k =
  match k with
  | '0' -> fill := not !fill
  | '1' -> waveFreq := !waveFreq +. 0.1
  | '2' -> waveFreq := !waveFreq -. 0.1
  | '3' -> waveWidth := !waveWidth +. 0.1
  | '4' -> waveWidth := !waveWidth -. 0.1
  | '5' -> waveHeight := !waveHeight +. 0.1
  | '6' -> waveHeight := !waveHeight -. 0.1
  | _ -> ();
  glClear gl_color_buffer_bit;

  Matrix_gles.(
    let m = 
            rotate (-45.0) 1.0 0.0 0.0
            ->-
            translate 0.0 0.0 (-150.0)
            ->-
            scale 0.01 0.01 0.01
            ->-
            perspective 40.0 1.0 0.0001 1000.0
    in
    (* Printf.printf "mvp = [\n%s]\n" (format m); *)
    glUniformMatrix4fv !mvpMatLoc 1 false m
  );

  (* Change time *)
  glUniform1f !waveTimeLoc !waveTime;
  glUniform1f !waveWidthLoc !waveWidth;
  glUniform1f !waveHeightLoc !waveHeight;

  let nverts = Bigarray.Array1.dim vertices / 3 in
  glDrawElements
    (if !fill then gl_triangles else gl_lines)
    nverts gl_unsigned_short 0;

  waveTime := !waveTime +. !waveFreq;
  ()


(******************************************************************************)
let rec event_loop f = function
  | false -> ()
  | true ->
    let k = if Graphics.key_pressed () then Graphics.read_key () else ' ' in
    let _ = f k in
    let continue =
    match k with
    | 'q' -> false
    | _ -> true in
    Win.swap_buffers ();
    Win.usleep 300;
    event_loop f continue

let main () =
    Graphics.open_graph " 600x600";
    Win.init_opengl ();
    Graphics.set_window_title "";
    glViewport 0 0 (Graphics.size_x ()) (Graphics.size_y ());
    glClearColor 0.0 0.0 0.0 0.0;
    init ();
    event_loop draw true

let () = main ()
