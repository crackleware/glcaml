(* translated from https://github.com/evanw/lightgl.js/blob/master/src/matrix.js *)

(* // Represents a 4x4 matrix using Float32Arrays when available. Matrix *)
(* // operations can either be done using convenient methods that return a new *)
(* // matrix for the result, or optimized methods that store the result in an *)
(* // existing matrix to avoid generating garbage. *)

type t = float array

(* // This constructor takes 16 arguments, which can be passed individually, as *)
(* // a list, or even as four lists, one for each row. If the arguments are *)
(* // omitted then the identity matrix is constructed instead. *)
let create arr = arr

let null () = create [|
  0.0; 0.0; 0.0; 0.0;
  0.0; 0.0; 0.0; 0.0;
  0.0; 0.0; 0.0; 0.0;
  0.0; 0.0; 0.0; 0.0;
|]

(* // Transforms the vector as a point with a w coordinate of 1. This *)
(* // means translations will have an effect, for example. *)
(* let transformPoint  *)
(*     var m = this.m; *)
(*     return new Vector( *)
(*         m[0] *. v.x +. m[1] *. v.y +. m[2] *. v.z +. m[3], *)
(*         m[4] *. v.x +. m[5] *. v.y +. m[6] *. v.z +. m[7], *)
(*         m[8] *. v.x +. m[9] *. v.y +. m[10] *. v.z +. m[11] *)
(*     ).divide(m[12] *. v.x +. m[13] *. v.y +. m[14] *. v.z +. m[15]); *)
(* }; *)

(* // ### .transformPoint(vector) *)
(* //  *)
(* // Transforms the vector as a vector with a w coordinate of 0. This *)
(* // means translations will have no effect, for example. *)
(* Matrix.prototype.transformVector = function(v) { *)
(*     var m = this.m; *)
(*     return new Vector( *)
(*         m[0] *. v.x +. m[1] *. v.y +. m[2] *. v.z, *)
(*         m[4] *. v.x +. m[5] *. v.y +. m[6] *. v.z, *)
(*         m[8] *. v.x +. m[9] *. v.y +. m[10] *. v.z *)
(*     ); *)
(* }; *)

(* // Returns the matrix that when multiplied with `matrix` results in the *)
(* // identity matrix. You can optionally pass an existing matrix in `result` *)
(* // to avoid allocating a new matrix. This implementation is from the Mesa *)
(* // OpenGL function `__gluInvertMatrixd()` found in `project.c`. *)
let inverse_ m result =
  let r = result in
  r.(0) <- m.(5)*.m.(10)*.m.(15) -. m.(5)*.m.(14)*.m.(11) -. m.(6)*.m.(9)*.m.(15) +. m.(6)*.m.(13)*.m.(11) +. m.(7)*.m.(9)*.m.(14) -. m.(7)*.m.(13)*.m.(10);
  r.(1) <- -.m.(1)*.m.(10)*.m.(15) +. m.(1)*.m.(14)*.m.(11) +. m.(2)*.m.(9)*.m.(15) -. m.(2)*.m.(13)*.m.(11) -. m.(3)*.m.(9)*.m.(14) +. m.(3)*.m.(13)*.m.(10);
  r.(2) <- m.(1)*.m.(6)*.m.(15) -. m.(1)*.m.(14)*.m.(7) -. m.(2)*.m.(5)*.m.(15) +. m.(2)*.m.(13)*.m.(7) +. m.(3)*.m.(5)*.m.(14) -. m.(3)*.m.(13)*.m.(6);
  r.(3) <- -.m.(1)*.m.(6)*.m.(11) +. m.(1)*.m.(10)*.m.(7) +. m.(2)*.m.(5)*.m.(11) -. m.(2)*.m.(9)*.m.(7) -. m.(3)*.m.(5)*.m.(10) +. m.(3)*.m.(9)*.m.(6);

  r.(4) <- -.m.(4)*.m.(10)*.m.(15) +. m.(4)*.m.(14)*.m.(11) +. m.(6)*.m.(8)*.m.(15) -. m.(6)*.m.(12)*.m.(11) -. m.(7)*.m.(8)*.m.(14) +. m.(7)*.m.(12)*.m.(10);
  r.(5) <- m.(0)*.m.(10)*.m.(15) -. m.(0)*.m.(14)*.m.(11) -. m.(2)*.m.(8)*.m.(15) +. m.(2)*.m.(12)*.m.(11) +. m.(3)*.m.(8)*.m.(14) -. m.(3)*.m.(12)*.m.(10);
  r.(6) <- -.m.(0)*.m.(6)*.m.(15) +. m.(0)*.m.(14)*.m.(7) +. m.(2)*.m.(4)*.m.(15) -. m.(2)*.m.(12)*.m.(7) -. m.(3)*.m.(4)*.m.(14) +. m.(3)*.m.(12)*.m.(6);
  r.(7) <- m.(0)*.m.(6)*.m.(11) -. m.(0)*.m.(10)*.m.(7) -. m.(2)*.m.(4)*.m.(11) +. m.(2)*.m.(8)*.m.(7) +. m.(3)*.m.(4)*.m.(10) -. m.(3)*.m.(8)*.m.(6);

  r.(8) <- m.(4)*.m.(9)*.m.(15) -. m.(4)*.m.(13)*.m.(11) -. m.(5)*.m.(8)*.m.(15) +. m.(5)*.m.(12)*.m.(11) +. m.(7)*.m.(8)*.m.(13) -. m.(7)*.m.(12)*.m.(9);
  r.(9) <- -.m.(0)*.m.(9)*.m.(15) +. m.(0)*.m.(13)*.m.(11) +. m.(1)*.m.(8)*.m.(15) -. m.(1)*.m.(12)*.m.(11) -. m.(3)*.m.(8)*.m.(13) +. m.(3)*.m.(12)*.m.(9);
  r.(10) <- m.(0)*.m.(5)*.m.(15) -. m.(0)*.m.(13)*.m.(7) -. m.(1)*.m.(4)*.m.(15) +. m.(1)*.m.(12)*.m.(7) +. m.(3)*.m.(4)*.m.(13) -. m.(3)*.m.(12)*.m.(5);
  r.(11) <- -.m.(0)*.m.(5)*.m.(11) +. m.(0)*.m.(9)*.m.(7) +. m.(1)*.m.(4)*.m.(11) -. m.(1)*.m.(8)*.m.(7) -. m.(3)*.m.(4)*.m.(9) +. m.(3)*.m.(8)*.m.(5);

  r.(12) <- -.m.(4)*.m.(9)*.m.(14) +. m.(4)*.m.(13)*.m.(10) +. m.(5)*.m.(8)*.m.(14) -. m.(5)*.m.(12)*.m.(10) -. m.(6)*.m.(8)*.m.(13) +. m.(6)*.m.(12)*.m.(9);
  r.(13) <- m.(0)*.m.(9)*.m.(14) -. m.(0)*.m.(13)*.m.(10) -. m.(1)*.m.(8)*.m.(14) +. m.(1)*.m.(12)*.m.(10) +. m.(2)*.m.(8)*.m.(13) -. m.(2)*.m.(12)*.m.(9);
  r.(14) <- -.m.(0)*.m.(5)*.m.(14) +. m.(0)*.m.(13)*.m.(6) +. m.(1)*.m.(4)*.m.(14) -. m.(1)*.m.(12)*.m.(6) -. m.(2)*.m.(4)*.m.(13) +. m.(2)*.m.(12)*.m.(5);
  r.(15) <- m.(0)*.m.(5)*.m.(10) -. m.(0)*.m.(9)*.m.(6) -. m.(1)*.m.(4)*.m.(10) +. m.(1)*.m.(8)*.m.(6) +. m.(2)*.m.(4)*.m.(9) -. m.(2)*.m.(8)*.m.(5);

  let det = m.(0)*.r.(0) +. m.(1)*.r.(4) +. m.(2)*.r.(8) +. m.(3)*.r.(12) in
  for i = 0 to 16-1 do r.(i) <- r.(i) /. det done;
  ()

(* // Returns `matrix`, exchanging columns for rows. You can optionally pass an *)
(* // existing matrix in `result` to avoid allocating a new matrix. *)
let transpose_ m result =
  let r = result in
  r.(0) <- m.(0); r.(1) <- m.(4); r.(2) <- m.(8); r.(3) <- m.(12);
  r.(4) <- m.(1); r.(5) <- m.(5); r.(6) <- m.(9); r.(7) <- m.(13);
  r.(8) <- m.(2); r.(9) <- m.(6); r.(10) <- m.(10); r.(11) <- m.(14);
  r.(12) <- m.(3); r.(13) <- m.(7); r.(14) <- m.(11); r.(15) <- m.(15);
  ()

(* // Returns the concatenation of the transforms for `left` and `right`. You can *)
(* // optionally pass an existing matrix in `result` to avoid allocating a new *)
(* // matrix. This emulates the OpenGL function `glMultMatrix()`. *)
let multiply_ a b result =
  let r = result in
  r.(0) <- a.(0) *. b.(0) +. a.(1) *. b.(4) +. a.(2) *. b.(8) +. a.(3) *. b.(12);
  r.(1) <- a.(0) *. b.(1) +. a.(1) *. b.(5) +. a.(2) *. b.(9) +. a.(3) *. b.(13);
  r.(2) <- a.(0) *. b.(2) +. a.(1) *. b.(6) +. a.(2) *. b.(10) +. a.(3) *. b.(14);
  r.(3) <- a.(0) *. b.(3) +. a.(1) *. b.(7) +. a.(2) *. b.(11) +. a.(3) *. b.(15);

  r.(4) <- a.(4) *. b.(0) +. a.(5) *. b.(4) +. a.(6) *. b.(8) +. a.(7) *. b.(12);
  r.(5) <- a.(4) *. b.(1) +. a.(5) *. b.(5) +. a.(6) *. b.(9) +. a.(7) *. b.(13);
  r.(6) <- a.(4) *. b.(2) +. a.(5) *. b.(6) +. a.(6) *. b.(10) +. a.(7) *. b.(14);
  r.(7) <- a.(4) *. b.(3) +. a.(5) *. b.(7) +. a.(6) *. b.(11) +. a.(7) *. b.(15);

  r.(8) <- a.(8) *. b.(0) +. a.(9) *. b.(4) +. a.(10) *. b.(8) +. a.(11) *. b.(12);
  r.(9) <- a.(8) *. b.(1) +. a.(9) *. b.(5) +. a.(10) *. b.(9) +. a.(11) *. b.(13);
  r.(10) <- a.(8) *. b.(2) +. a.(9) *. b.(6) +. a.(10) *. b.(10) +. a.(11) *. b.(14);
  r.(11) <- a.(8) *. b.(3) +. a.(9) *. b.(7) +. a.(10) *. b.(11) +. a.(11) *. b.(15);

  r.(12) <- a.(12) *. b.(0) +. a.(13) *. b.(4) +. a.(14) *. b.(8) +. a.(15) *. b.(12);
  r.(13) <- a.(12) *. b.(1) +. a.(13) *. b.(5) +. a.(14) *. b.(9) +. a.(15) *. b.(13);
  r.(14) <- a.(12) *. b.(2) +. a.(13) *. b.(6) +. a.(14) *. b.(10) +. a.(15) *. b.(14);
  r.(15) <- a.(12) *. b.(3) +. a.(13) *. b.(7) +. a.(14) *. b.(11) +. a.(15) *. b.(15);

  ()

(* // Returns an identity matrix. You can optionally pass an existing matrix in *)
(* // `result` to avoid allocating a new matrix. This emulates the OpenGL function *)
(* // `glLoadIdentity()`. *)
let identity_ result =
  let m = result in
  m.(0) <- 1.0;
  m.(5) <- 1.0;
  m.(10) <- 1.0;
  m.(15) <- 1.0;
  m.(1) <- 0.0;
  m.(2) <- 0.0;
  m.(3) <- 0.0;
  m.(4) <- 0.0;
  m.(6) <- 0.0;
  m.(7) <- 0.0;
  m.(8) <- 0.0;
  m.(9) <- 0.0;
  m.(11) <- 0.0;
  m.(12) <- 0.0;
  m.(13) <- 0.0;
  m.(14) <- 0.0;
  ()

(* // Sets up a viewing frustum, which is shaped like a truncated pyramid with the *)
(* // camera where the point of the pyramid would be. You can optionally pass an *)
(* // existing matrix in `result` to avoid allocating a new matrix. This emulates *)
(* // the OpenGL function `glFrustum()`. *)
let frustum_ l r b t n f result =
  let m = result in

  m.(0) <- 2.0 *. n /. (r -. l);
  m.(1) <- 0.0;
  m.(2) <- (r +. l) /. (r -. l);
  m.(3) <- 0.0;

  m.(4) <- 0.0;
  m.(5) <- 2.0 *. n /. (t -. b);
  m.(6) <- (t +. b) /. (t -. b);
  m.(7) <- 0.0;

  m.(8) <- 0.0;
  m.(9) <- 0.0;
  m.(10) <- -.(f +. n) /. (f -. n);
  m.(11) <- -.2.0 *. f *. n /. (f -. n);

  m.(12) <- 0.0;
  m.(13) <- 0.0;
  m.(14) <- -.1.0;
  m.(15) <- 0.0;

  ()

(* // Returns an orthographic projection, in which objects are the same size no *)
(* // matter how far away or nearby they are. You can optionally pass an existing *)
(* // matrix in `result` to avoid allocating a new matrix. This emulates the OpenGL *)
(* // function `glOrtho()`. *)
let ortho_ l r b t n f result =
  let m = result in

  m.(0) <- 2.0 /. (r -. l);
  m.(1) <- 0.0;
  m.(2) <- 0.0;
  m.(3) <- -.(r +. l) /. (r -. l);

  m.(4) <- 0.0;
  m.(5) <- 2.0 /. (t -. b);
  m.(6) <- 0.0;
  m.(7) <- -.(t +. b) /. (t -. b);

  m.(8) <- 0.0;
  m.(9) <- 0.0;
  m.(10) <- -.2.0 /. (f -. n);
  m.(11) <- -.(f +. n) /. (f -. n);

  m.(12) <- 0.0;
  m.(13) <- 0.0;
  m.(14) <- 0.0;
  m.(15) <- 1.0;

  ()

let pi = acos (-1.0)

(* // Returns a perspective transform matrix, which makes far away objects appear *)
(* // smaller than nearby objects. The `aspect` argument should be the width *)
(* // divided by the height of your viewport and `fov` is the top-.to-.bottom angle *)
(* // of the field of view in degrees. You can optionally pass an existing matrix *)
(* // in `result` to avoid allocating a new matrix. This emulates the OpenGL *)
(* // function `gluPerspective()`. *)
let perspective_ fov aspect near far result =
  let y = tan (fov *. pi /. 360.0) *. near in
  let x = y *. aspect in
  frustum_ (-.x) x (-.y) y near far result

(* // This emulates the OpenGL function `glScale()`. You can optionally pass an *)
(* // existing matrix in `result` to avoid allocating a new matrix.  *)
let scale_ x y z result =
  let m = result in

  m.(0) <- x;
  m.(1) <- 0.0;
  m.(2) <- 0.0;
  m.(3) <- 0.0;

  m.(4) <- 0.0;
  m.(5) <- y;
  m.(6) <- 0.0;
  m.(7) <- 0.0;

  m.(8) <- 0.0;
  m.(9) <- 0.0;
  m.(10) <- z;
  m.(11) <- 0.0;

  m.(12) <- 0.0;
  m.(13) <- 0.0;
  m.(14) <- 0.0;
  m.(15) <- 1.0;

  ()

(* // ### Matrix.translate(x, y, z[, result]) *)
(* //  *)
(* // This emulates the OpenGL function `glTranslate()`. You can optionally pass *)
(* // an existing matrix in `result` to avoid allocating a new matrix.  *)
let translate_ x y z result =
  let m = result in

  m.(0) <- 1.0;
  m.(1) <- 0.0;
  m.(2) <- 0.0;
  m.(3) <- x;

  m.(4) <- 0.0;
  m.(5) <- 1.0;
  m.(6) <- 0.0;
  m.(7) <- y;

  m.(8) <- 0.0;
  m.(9) <- 0.0;
  m.(10) <- 1.0;
  m.(11) <- z;

  m.(12) <- 0.0;
  m.(13) <- 0.0;
  m.(14) <- 0.0;
  m.(15) <- 1.0;

  ()

(* // ### Matrix.rotate(a, x, y, z[, result]) *)
(* //  *)
(* // Returns a matrix that rotates by `a` degrees around the vector `x, y, z`. *)
(* // You can optionally pass an existing matrix in `result` to avoid allocating *)
(* // a new matrix. This emulates the OpenGL function `glRotate()`.  *)
let rotate_ a x y z result =
  if a = 0.0 || (x = 0.0 && y = 0.0 && z = 0.0) then
    identity_ result
  else begin
    let m = result in

    let a = a *. pi /. 180.0
    and d = sqrt (x*.x +. y*.y +. z*.z) in
    let x, y, z = x /. d, y /. d, z /. d
    and c = cos a
    and s = sin a
    in 
    let t = 1.0 -. c in

    m.(0) <- x *. x *. t +. c;
    m.(1) <- x *. y *. t -. z *. s;
    m.(2) <- x *. z *. t +. y *. s;
    m.(3) <- 0.0;

    m.(4) <- y *. x *. t +. z *. s;
    m.(5) <- y *. y *. t +. c;
    m.(6) <- y *. z *. t -. x *. s;
    m.(7) <- 0.0;

    m.(8) <- z *. x *. t -. y *. s;
    m.(9) <- z *. y *. t +. x *. s;
    m.(10) <- z *. z *. t +. c;
    m.(11) <- 0.0;

    m.(12) <- 0.0;
    m.(13) <- 0.0;
    m.(14) <- 0.0;
    m.(15) <- 1.0;

    ()
  end

(* // ### Matrix.lookAt(ex, ey, ez, cx, cy, cz, ux, uy, uz[, result]) *)
(* //  *)
(* // Returns a matrix that puts the camera at the eye point `ex, ey, ez` looking *)
(* // toward the center point `cx, cy, cz` with an up direction of `ux, uy, uz`. *)
(* // You can optionally pass an existing matrix in `result` to avoid allocating *)
(* // a new matrix. This emulates the OpenGL function `gluLookAt()`. *)
(* let lookAt ex ey ez cx cy cz ux uy uz result = *)
(*   let m = result in  *)

(*   let e = new Vector(ex, ey, ez) *)
(*   and c = new Vector(cx, cy, cz) *)
(*   and u = new Vector(ux, uy, uz) *)
(*   in *)
(*   let f = e.subtract(c).unit() in *)
(*   let s = u.cross(f).unit() in *)
(*   let t = f.cross(s).unit() in *)

(*   m.(0) <- s.x; *)
(*   m.(1) <- s.y; *)
(*   m.(2) <- s.z; *)
(*   m.(3) <- -.s.dot(e); *)

(*   m.(4) <- t.x; *)
(*   m.(5) <- t.y; *)
(*   m.(6) <- t.z; *)
(*   m.(7) <- -.t.dot(e); *)

(*   m.(8) <- f.x; *)
(*   m.(9) <- f.y; *)
(*   m.(10) <- f.z; *)
(*   m.(11) <- -.f.dot(e); *)

(*   m.(12) <- 0.0; *)
(*   m.(13) <- 0.0; *)
(*   m.(14) <- 0.0; *)
(*   m.(15) <- 1.0; *)

(*   () *)


(* functional interface *)

let identity () = 
  let r = null () in identity_ r; r

(* // Returns the matrix that when multiplied with this matrix results in the *)
(* // identity matrix. *)
let inverse m = 
  let r = null () in inverse_ m r; r

(* // Returns this matrix, exchanging columns for rows. *)
let transpose m = 
  let r = null () in transpose_ m r; r

(* // Returns the concatenation of the transforms for this matrix and `matrix`. *)
(* // This emulates the OpenGL function `glMultMatrix()`. *)
let multiply a b = 
  let r = null () in multiply_ a b r; r

let ortho l r b t n f = 
  let result = null () in ortho_ l r b t n f result; result

let perspective fov aspect near far =
  let r = null () in perspective_ fov aspect near far r; r

let frustum l r b t n f =
  let result = null () in frustum_ l r b t n f result; result

let scale x y z =
  let r = null () in scale_ x y z r; r

let translate x y z =
  let r = null () in translate_ x y z r; r

let rotate a x y z =
  let r = null () in rotate_ a x y z r; r

(* short names and helpers *)
let id = identity
let inv = inverse
let mul = multiply
let (-*-) = multiply
let (->-) a b = multiply b a

(* let (>>) m f = f m *)

let format m =
  Printf.(
    let s = ref "" in
    for i = 0 to 3 do
      s := !s ^ sprintf "%15.10f %15.10f %15.10f %15.10f\n" m.(i*4+0) m.(i*4+1) m.(i*4+2) m.(i*4+3)
    done;
    !s
  )

