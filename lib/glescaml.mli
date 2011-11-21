(**
 GLCaml - Objective Caml interface for OpenGL 1.1, 1.2, 1.3, 1.4, 1.5, 2.0 and 2.1
 plus ARB and vendor-specific extensions 
 *) 

(* Copyright (C) 2007, 2008 Elliott OTI
 *
 * Redistribution and use in source and binary forms, with or without modification, are permitted provided 
 * that the following conditions are met:
 *  - Redistributions of source code must retain the above copyright notice, this list of conditions 
 *    and the following disclaimer.
 *  - Redistributions in binary form must reproduce the above copyright notice, this list of conditions 
 *    and the following disclaimer in the documentation and/or other materials provided with the distribution.
 *  - The name Elliott Oti may not be used to endorse or promote products derived from this software 
 *    without specific prior written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *)

(**
The OpenGL reference manuals can be found at http://www.opengl.org/documentation/specs/.

In GLCaml, OpenGL constants have the same names as in C, but are written in lower case.

OpenGL functions have the same names as in C, but the signatures may differ slightly. 
The parameters are translated according to the following table:

- GLboolean  	-> bool
- void    		-> unit
- GLvoid    	-> unit
- GLuint     	-> int
- GLint      	-> int
- GLintptr   	-> int
- GLenum     	-> int
- GLsizei   	-> int
- GLsizeiptr 	-> int
- GLfloat    	-> float
- GLdouble   	-> float
- GLchar     	-> int
- GLclampf   	-> float
- GLclampd   	-> float
- GLshort    	-> int
- GLubyte    	-> int
- GLbitfield 	-> int
- GLushort   	-> int
- GLbyte     	-> int
- GLstring		-> string
- GLbyte*    	-> int array
- GLubyte*    	-> int array
- void*    		-> 'a
- GLvoid*    	-> 'a
- GLvoid**   	-> 'a
- GLuint*    	-> int array
- GLint*    	-> int array
- GLfloat*   	-> float array
- GLdouble*  	-> float array
- GLchar*    	-> string
- GLchar**   	-> string array
- GLclampf*  	-> float array
- GLclampd*  	-> float array
- GLshort*   	-> int array
- GLushort*  	-> int array
- GLboolean*  	-> bool array
- GLboolean** 	-> word_matrix
- GLsizei*   	-> int array
- GLenum*    	-> int array


Void pointers are represented by the polymorphic type ['a], but in the FFI only strings, Bigarrays, or foreign-function interface bindings to C arrays 
are actually processed properly (such as [SDLCaml.surface_pixels] which returns in essence a pointer to an array containing the bitmap contents).
Passing other types will most likely result in a segfault. 

There is one function ([glEdgeFlagPointerListIBM]) which requires an array of arrays of Booleans. The array of array of GLbooleans is in GLCaml
in this single instance represented by a 2-dimensional Bigarray of 32-bit integers, so manual conversion from and to bools need to take place.
All other conversions are handled automatically by GLCaml.

The parameter conversion convention means that a lot of the OpenGL functions are superfluous in GLCaml, since they have the same Ocaml signature
despite having different C signatures. [glVertex2i] and [glVertex2s], for instance, take int and short arguments respectively in C, but both take native 
integers in Ocaml. Likewise [glVertex2f] (single-precision floats) and [glVertex2d] (double precision floats) both translate to having double precision float arguments
in the Ocaml bindings. This also means that precision may be lost or overflow may occur when using integer arguments for an OpenGL function that
uses 8-bit or 16-bit integers; likewise when using Ocaml floats for OpenGL functions using single-precision floats.

Note that most OpenGL implementations use single-precision floating point internally, even if the call is made with an API function using doubles.
OpenGL 3.0, due to be released in 2008, will only support single precision floating point.

*)

type byte_array =
    (int, Bigarray.int8_signed_elt, Bigarray.c_layout) Bigarray.Array1.t
type ubyte_array =
    (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
type short_array =
    (int, Bigarray.int16_signed_elt, Bigarray.c_layout) Bigarray.Array1.t
type ushort_array =
    (int, Bigarray.int16_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
type word_array =
    (int32, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array1.t
type dword_array =
    (int64, Bigarray.int64_elt, Bigarray.c_layout) Bigarray.Array1.t
type int_array = (int, Bigarray.int_elt, Bigarray.c_layout) Bigarray.Array1.t
type float_array =
    (float, Bigarray.float32_elt, Bigarray.c_layout) Bigarray.Array1.t
type double_array =
    (float, Bigarray.float64_elt, Bigarray.c_layout) Bigarray.Array1.t
type byte_matrix =
    (int, Bigarray.int8_signed_elt, Bigarray.c_layout) Bigarray.Array2.t
type ubyte_matrix =
    (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array2.t
type short_matrix =
    (int, Bigarray.int16_signed_elt, Bigarray.c_layout) Bigarray.Array2.t
type ushort_matrix =
    (int, Bigarray.int16_unsigned_elt, Bigarray.c_layout) Bigarray.Array2.t
type word_matrix =
    (int32, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array2.t
type dword_matrix =
    (int64, Bigarray.int64_elt, Bigarray.c_layout) Bigarray.Array2.t
type int_matrix =
    (int, Bigarray.int_elt, Bigarray.c_layout) Bigarray.Array2.t
type float_matrix =
    (float, Bigarray.float32_elt, Bigarray.c_layout) Bigarray.Array2.t
type double_matrix =
    (float, Bigarray.float64_elt, Bigarray.c_layout) Bigarray.Array2.t
val make_byte_array :
  int -> (int, Bigarray.int8_signed_elt, Bigarray.c_layout) Bigarray.Array1.t
val make_ubyte_array :
  int ->
  (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
val make_short_array :
  int ->
  (int, Bigarray.int16_signed_elt, Bigarray.c_layout) Bigarray.Array1.t
val make_ushort_array :
  int ->
  (int, Bigarray.int16_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
val make_word_array :
  int -> (int32, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array1.t
val make_dword_array :
  int -> (int64, Bigarray.int64_elt, Bigarray.c_layout) Bigarray.Array1.t
val make_int_array :
  int -> (int, Bigarray.int_elt, Bigarray.c_layout) Bigarray.Array1.t
val make_float_array :
  int -> (float, Bigarray.float32_elt, Bigarray.c_layout) Bigarray.Array1.t
val make_double_array :
  int -> (float, Bigarray.float64_elt, Bigarray.c_layout) Bigarray.Array1.t
val make_byte_matrix :
  int ->
  int -> (int, Bigarray.int8_signed_elt, Bigarray.c_layout) Bigarray.Array2.t
val make_ubyte_matrix :
  int ->
  int ->
  (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array2.t
val make_short_matrix :
  int ->
  int ->
  (int, Bigarray.int16_signed_elt, Bigarray.c_layout) Bigarray.Array2.t
val make_ushort_matrix :
  int ->
  int ->
  (int, Bigarray.int16_unsigned_elt, Bigarray.c_layout) Bigarray.Array2.t
val make_word_matrix :
  int ->
  int -> (int32, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array2.t
val make_dword_matrix :
  int ->
  int -> (int64, Bigarray.int64_elt, Bigarray.c_layout) Bigarray.Array2.t
val make_int_matrix :
  int -> int -> (int, Bigarray.int_elt, Bigarray.c_layout) Bigarray.Array2.t
val make_float_matrix :
  int ->
  int -> (float, Bigarray.float32_elt, Bigarray.c_layout) Bigarray.Array2.t
val make_double_matrix :
  int ->
  int -> (float, Bigarray.float64_elt, Bigarray.c_layout) Bigarray.Array2.t
val to_byte_array :
  int array ->
  (int, Bigarray.int8_signed_elt, Bigarray.c_layout) Bigarray.Array1.t
val to_ubyte_array :
  int array ->
  (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
val to_short_array :
  int array ->
  (int, Bigarray.int16_signed_elt, Bigarray.c_layout) Bigarray.Array1.t
val to_ushort_array :
  int array ->
  (int, Bigarray.int16_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
val to_word_array :
  int array ->
  (int32, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array1.t
val to_dword_array :
  int array ->
  (int64, Bigarray.int64_elt, Bigarray.c_layout) Bigarray.Array1.t
val to_int_array :
  int array -> (int, Bigarray.int_elt, Bigarray.c_layout) Bigarray.Array1.t
val to_float_array :
  float array ->
  (float, Bigarray.float32_elt, Bigarray.c_layout) Bigarray.Array1.t
val to_double_array :
  float array ->
  (float, Bigarray.float64_elt, Bigarray.c_layout) Bigarray.Array1.t
val copy_byte_array : ('a, 'b, 'c) Bigarray.Array1.t -> 'a array -> unit
val copy_ubyte_array : ('a, 'b, 'c) Bigarray.Array1.t -> 'a array -> unit
val copy_short_array : ('a, 'b, 'c) Bigarray.Array1.t -> 'a array -> unit
val copy_ushort_array : ('a, 'b, 'c) Bigarray.Array1.t -> 'a array -> unit
val copy_word_array : (int32, 'a, 'b) Bigarray.Array1.t -> int array -> unit
val copy_dword_array : (int64, 'a, 'b) Bigarray.Array1.t -> int array -> unit
val copy_float_array :
  'a -> 'b -> ('c, 'd, 'e) Bigarray.Array1.t -> 'c array -> unit
val copy_double_array :
  'a -> 'b -> ('c, 'd, 'e) Bigarray.Array1.t -> 'c array -> unit
val to_string : (char, 'a, 'b) Bigarray.Array1.t -> string
val int_of_bool : bool -> int
val bool_of_int : int -> bool
val bool_to_int_array : bool array -> int array
val int_to_bool_array : int array -> bool array
val copy_to_bool_array : int array -> bool array -> unit array
val gl_es_version_2_0 : int
val gl_depth_buffer_bit : int
val gl_stencil_buffer_bit : int
val gl_color_buffer_bit : int
val gl_false : int
val gl_true : int
val gl_points : int
val gl_lines : int
val gl_line_loop : int
val gl_line_strip : int
val gl_triangles : int
val gl_triangle_strip : int
val gl_triangle_fan : int
val gl_zero : int
val gl_one : int
val gl_src_color : int
val gl_one_minus_src_color : int
val gl_src_alpha : int
val gl_one_minus_src_alpha : int
val gl_dst_alpha : int
val gl_one_minus_dst_alpha : int
val gl_dst_color : int
val gl_one_minus_dst_color : int
val gl_src_alpha_saturate : int
val gl_func_add : int
val gl_blend_equation : int
val gl_blend_equation_rgb : int
val gl_blend_equation_alpha : int
val gl_func_subtract : int
val gl_func_reverse_subtract : int
val gl_blend_dst_rgb : int
val gl_blend_src_rgb : int
val gl_blend_dst_alpha : int
val gl_blend_src_alpha : int
val gl_constant_color : int
val gl_one_minus_constant_color : int
val gl_constant_alpha : int
val gl_one_minus_constant_alpha : int
val gl_blend_color : int
val gl_array_buffer : int
val gl_element_array_buffer : int
val gl_array_buffer_binding : int
val gl_element_array_buffer_binding : int
val gl_stream_draw : int
val gl_static_draw : int
val gl_dynamic_draw : int
val gl_buffer_size : int
val gl_buffer_usage : int
val gl_current_vertex_attrib : int
val gl_front : int
val gl_back : int
val gl_front_and_back : int
val gl_texture_2d : int
val gl_cull_face : int
val gl_blend : int
val gl_dither : int
val gl_stencil_test : int
val gl_depth_test : int
val gl_scissor_test : int
val gl_polygon_offset_fill : int
val gl_sample_alpha_to_coverage : int
val gl_sample_coverage : int
val gl_no_error : int
val gl_invalid_enum : int
val gl_invalid_value : int
val gl_invalid_operation : int
val gl_out_of_memory : int
val gl_cw : int
val gl_ccw : int
val gl_line_width : int
val gl_aliased_point_size_range : int
val gl_aliased_line_width_range : int
val gl_cull_face_mode : int
val gl_front_face : int
val gl_depth_range : int
val gl_depth_writemask : int
val gl_depth_clear_value : int
val gl_depth_func : int
val gl_stencil_clear_value : int
val gl_stencil_func : int
val gl_stencil_fail : int
val gl_stencil_pass_depth_fail : int
val gl_stencil_pass_depth_pass : int
val gl_stencil_ref : int
val gl_stencil_value_mask : int
val gl_stencil_writemask : int
val gl_stencil_back_func : int
val gl_stencil_back_fail : int
val gl_stencil_back_pass_depth_fail : int
val gl_stencil_back_pass_depth_pass : int
val gl_stencil_back_ref : int
val gl_stencil_back_value_mask : int
val gl_stencil_back_writemask : int
val gl_viewport : int
val gl_scissor_box : int
val gl_color_clear_value : int
val gl_color_writemask : int
val gl_unpack_alignment : int
val gl_pack_alignment : int
val gl_max_texture_size : int
val gl_max_viewport_dims : int
val gl_subpixel_bits : int
val gl_red_bits : int
val gl_green_bits : int
val gl_blue_bits : int
val gl_alpha_bits : int
val gl_depth_bits : int
val gl_stencil_bits : int
val gl_polygon_offset_units : int
val gl_polygon_offset_factor : int
val gl_texture_binding_2d : int
val gl_sample_buffers : int
val gl_samples : int
val gl_sample_coverage_value : int
val gl_sample_coverage_invert : int
val gl_num_compressed_texture_formats : int
val gl_compressed_texture_formats : int
val gl_dont_care : int
val gl_fastest : int
val gl_nicest : int
val gl_generate_mipmap_hint : int
val gl_byte : int
val gl_unsigned_byte : int
val gl_short : int
val gl_unsigned_short : int
val gl_int : int
val gl_unsigned_int : int
val gl_float : int
val gl_fixed : int
val gl_depth_component : int
val gl_alpha : int
val gl_rgb : int
val gl_rgba : int
val gl_luminance : int
val gl_luminance_alpha : int
val gl_unsigned_short_4_4_4_4 : int
val gl_unsigned_short_5_5_5_1 : int
val gl_unsigned_short_5_6_5 : int
val gl_fragment_shader : int
val gl_vertex_shader : int
val gl_max_vertex_attribs : int
val gl_max_vertex_uniform_vectors : int
val gl_max_varying_vectors : int
val gl_max_combined_texture_image_units : int
val gl_max_vertex_texture_image_units : int
val gl_max_texture_image_units : int
val gl_max_fragment_uniform_vectors : int
val gl_shader_type : int
val gl_delete_status : int
val gl_link_status : int
val gl_validate_status : int
val gl_attached_shaders : int
val gl_active_uniforms : int
val gl_active_uniform_max_length : int
val gl_active_attributes : int
val gl_active_attribute_max_length : int
val gl_shading_language_version : int
val gl_current_program : int
val gl_never : int
val gl_less : int
val gl_equal : int
val gl_lequal : int
val gl_greater : int
val gl_notequal : int
val gl_gequal : int
val gl_always : int
val gl_keep : int
val gl_replace : int
val gl_incr : int
val gl_decr : int
val gl_invert : int
val gl_incr_wrap : int
val gl_decr_wrap : int
val gl_vendor : int
val gl_renderer : int
val gl_version : int
val gl_extensions : int
val gl_nearest : int
val gl_linear : int
val gl_nearest_mipmap_nearest : int
val gl_linear_mipmap_nearest : int
val gl_nearest_mipmap_linear : int
val gl_linear_mipmap_linear : int
val gl_texture_mag_filter : int
val gl_texture_min_filter : int
val gl_texture_wrap_s : int
val gl_texture_wrap_t : int
val gl_texture : int
val gl_texture_cube_map : int
val gl_texture_binding_cube_map : int
val gl_texture_cube_map_positive_x : int
val gl_texture_cube_map_negative_x : int
val gl_texture_cube_map_positive_y : int
val gl_texture_cube_map_negative_y : int
val gl_texture_cube_map_positive_z : int
val gl_texture_cube_map_negative_z : int
val gl_max_cube_map_texture_size : int
val gl_texture0 : int
val gl_texture1 : int
val gl_texture2 : int
val gl_texture3 : int
val gl_texture4 : int
val gl_texture5 : int
val gl_texture6 : int
val gl_texture7 : int
val gl_texture8 : int
val gl_texture9 : int
val gl_texture10 : int
val gl_texture11 : int
val gl_texture12 : int
val gl_texture13 : int
val gl_texture14 : int
val gl_texture15 : int
val gl_texture16 : int
val gl_texture17 : int
val gl_texture18 : int
val gl_texture19 : int
val gl_texture20 : int
val gl_texture21 : int
val gl_texture22 : int
val gl_texture23 : int
val gl_texture24 : int
val gl_texture25 : int
val gl_texture26 : int
val gl_texture27 : int
val gl_texture28 : int
val gl_texture29 : int
val gl_texture30 : int
val gl_texture31 : int
val gl_active_texture : int
val gl_repeat : int
val gl_clamp_to_edge : int
val gl_mirrored_repeat : int
val gl_float_vec2 : int
val gl_float_vec3 : int
val gl_float_vec4 : int
val gl_int_vec2 : int
val gl_int_vec3 : int
val gl_int_vec4 : int
val gl_bool : int
val gl_bool_vec2 : int
val gl_bool_vec3 : int
val gl_bool_vec4 : int
val gl_float_mat2 : int
val gl_float_mat3 : int
val gl_float_mat4 : int
val gl_sampler_2d : int
val gl_sampler_cube : int
val gl_vertex_attrib_array_enabled : int
val gl_vertex_attrib_array_size : int
val gl_vertex_attrib_array_stride : int
val gl_vertex_attrib_array_type : int
val gl_vertex_attrib_array_normalized : int
val gl_vertex_attrib_array_pointer : int
val gl_vertex_attrib_array_buffer_binding : int
val gl_implementation_color_read_type : int
val gl_implementation_color_read_format : int
val gl_compile_status : int
val gl_info_log_length : int
val gl_shader_source_length : int
val gl_shader_compiler : int
val gl_shader_binary_formats : int
val gl_num_shader_binary_formats : int
val gl_low_float : int
val gl_medium_float : int
val gl_high_float : int
val gl_low_int : int
val gl_medium_int : int
val gl_high_int : int
val gl_framebuffer : int
val gl_renderbuffer : int
val gl_rgba4 : int
val gl_rgb5_a1 : int
val gl_rgb565 : int
val gl_depth_component16 : int
val gl_stencil_index : int
val gl_stencil_index8 : int
val gl_renderbuffer_width : int
val gl_renderbuffer_height : int
val gl_renderbuffer_internal_format : int
val gl_renderbuffer_red_size : int
val gl_renderbuffer_green_size : int
val gl_renderbuffer_blue_size : int
val gl_renderbuffer_alpha_size : int
val gl_renderbuffer_depth_size : int
val gl_renderbuffer_stencil_size : int
val gl_framebuffer_attachment_object_type : int
val gl_framebuffer_attachment_object_name : int
val gl_framebuffer_attachment_texture_level : int
val gl_framebuffer_attachment_texture_cube_map_face : int
val gl_color_attachment0 : int
val gl_depth_attachment : int
val gl_stencil_attachment : int
val gl_none : int
val gl_framebuffer_complete : int
val gl_framebuffer_incomplete_attachment : int
val gl_framebuffer_incomplete_missing_attachment : int
val gl_framebuffer_incomplete_dimensions : int
val gl_framebuffer_unsupported : int
val gl_framebuffer_binding : int
val gl_renderbuffer_binding : int
val gl_max_renderbuffer_size : int
val gl_invalid_framebuffer_operation : int
external glActiveTexture : int -> unit = "glstub_glActiveTexture"
  "glstub_glActiveTexture"
external glAttachShader : int -> int -> unit = "glstub_glAttachShader"
  "glstub_glAttachShader"
external glBindAttribLocation : int -> int -> string -> unit
  = "glstub_glBindAttribLocation" "glstub_glBindAttribLocation"
external glBindBuffer : int -> int -> unit = "glstub_glBindBuffer"
  "glstub_glBindBuffer"
external glBindFramebuffer : int -> int -> unit = "glstub_glBindFramebuffer"
  "glstub_glBindFramebuffer"
external glBindRenderbuffer : int -> int -> unit
  = "glstub_glBindRenderbuffer" "glstub_glBindRenderbuffer"
external glBindTexture : int -> int -> unit = "glstub_glBindTexture"
  "glstub_glBindTexture"
external glBlendColor : float -> float -> float -> float -> unit
  = "glstub_glBlendColor" "glstub_glBlendColor"
external glBlendEquation : int -> unit = "glstub_glBlendEquation"
  "glstub_glBlendEquation"
external glBlendEquationSeparate : int -> int -> unit
  = "glstub_glBlendEquationSeparate" "glstub_glBlendEquationSeparate"
external glBlendFunc : int -> int -> unit = "glstub_glBlendFunc"
  "glstub_glBlendFunc"
external glBlendFuncSeparate : int -> int -> int -> int -> unit
  = "glstub_glBlendFuncSeparate" "glstub_glBlendFuncSeparate"
external glBufferData : int -> int -> 'a -> int -> unit
  = "glstub_glBufferData" "glstub_glBufferData"
external glBufferSubData : int -> int -> int -> 'a -> unit
  = "glstub_glBufferSubData" "glstub_glBufferSubData"
external glCheckFramebufferStatus : int -> int
  = "glstub_glCheckFramebufferStatus" "glstub_glCheckFramebufferStatus"
external glClear : int -> unit = "glstub_glClear" "glstub_glClear"
external glClearColor : float -> float -> float -> float -> unit
  = "glstub_glClearColor" "glstub_glClearColor"
external glClearDepthf : float -> unit = "glstub_glClearDepthf"
  "glstub_glClearDepthf"
external glClearStencil : int -> unit = "glstub_glClearStencil"
  "glstub_glClearStencil"
external glColorMask : bool -> bool -> bool -> bool -> unit
  = "glstub_glColorMask" "glstub_glColorMask"
external glCompileShader : int -> unit = "glstub_glCompileShader"
  "glstub_glCompileShader"
external glCompressedTexImage2D :
  int -> int -> int -> int -> int -> int -> int -> 'a -> unit
  = "glstub_glCompressedTexImage2D_byte" "glstub_glCompressedTexImage2D"
external glCompressedTexSubImage2D :
  int -> int -> int -> int -> int -> int -> int -> int -> 'a -> unit
  = "glstub_glCompressedTexSubImage2D_byte"
  "glstub_glCompressedTexSubImage2D"
external glCopyTexImage2D :
  int -> int -> int -> int -> int -> int -> int -> int -> unit
  = "glstub_glCopyTexImage2D_byte" "glstub_glCopyTexImage2D"
external glCopyTexSubImage2D :
  int -> int -> int -> int -> int -> int -> int -> int -> unit
  = "glstub_glCopyTexSubImage2D_byte" "glstub_glCopyTexSubImage2D"
external glCreateProgram : unit -> int = "glstub_glCreateProgram"
  "glstub_glCreateProgram"
external glCreateShader : int -> int = "glstub_glCreateShader"
  "glstub_glCreateShader"
external glCullFace : int -> unit = "glstub_glCullFace" "glstub_glCullFace"
val glDeleteBuffers : int -> int array -> unit
val glDeleteFramebuffers : int -> int array -> unit
external glDeleteProgram : int -> unit = "glstub_glDeleteProgram"
  "glstub_glDeleteProgram"
val glDeleteRenderbuffers : int -> int array -> unit
external glDeleteShader : int -> unit = "glstub_glDeleteShader"
  "glstub_glDeleteShader"
val glDeleteTextures : int -> int array -> unit
external glDepthFunc : int -> unit = "glstub_glDepthFunc"
  "glstub_glDepthFunc"
external glDepthMask : bool -> unit = "glstub_glDepthMask"
  "glstub_glDepthMask"
external glDepthRangef : float -> float -> unit = "glstub_glDepthRangef"
  "glstub_glDepthRangef"
external glDetachShader : int -> int -> unit = "glstub_glDetachShader"
  "glstub_glDetachShader"
external glDisable : int -> unit = "glstub_glDisable" "glstub_glDisable"
external glDisableVertexAttribArray : int -> unit
  = "glstub_glDisableVertexAttribArray" "glstub_glDisableVertexAttribArray"
external glDrawArrays : int -> int -> int -> unit = "glstub_glDrawArrays"
  "glstub_glDrawArrays"
external glDrawElements : int -> int -> int -> 'a -> unit
  = "glstub_glDrawElements" "glstub_glDrawElements"
external glEnable : int -> unit = "glstub_glEnable" "glstub_glEnable"
external glEnableVertexAttribArray : int -> unit
  = "glstub_glEnableVertexAttribArray" "glstub_glEnableVertexAttribArray"
external glFinish : unit -> unit = "glstub_glFinish" "glstub_glFinish"
external glFlush : unit -> unit = "glstub_glFlush" "glstub_glFlush"
external glFramebufferRenderbuffer : int -> int -> int -> int -> unit
  = "glstub_glFramebufferRenderbuffer" "glstub_glFramebufferRenderbuffer"
external glFramebufferTexture2D : int -> int -> int -> int -> int -> unit
  = "glstub_glFramebufferTexture2D" "glstub_glFramebufferTexture2D"
external glFrontFace : int -> unit = "glstub_glFrontFace"
  "glstub_glFrontFace"
val glGenBuffers : int -> int array -> unit
val glGenFramebuffers : int -> int array -> unit
val glGenRenderbuffers : int -> int array -> unit
val glGenTextures : int -> int array -> unit
external glGenerateMipmap : int -> unit = "glstub_glGenerateMipmap"
  "glstub_glGenerateMipmap"
val glGetActiveAttrib :
  int -> int -> int -> int array -> int array -> int array -> string -> unit
val glGetActiveUniform :
  int -> int -> int -> int array -> int array -> int array -> string -> unit
val glGetAttachedShaders : int -> int -> int array -> int array -> unit
external glGetAttribLocation : int -> string -> int
  = "glstub_glGetAttribLocation" "glstub_glGetAttribLocation"
val glGetBooleanv : int -> bool array -> unit
val glGetBufferParameteriv : int -> int -> int array -> unit
external glGetError : unit -> int = "glstub_glGetError" "glstub_glGetError"
val glGetFloatv : int -> float array -> unit
val glGetFramebufferAttachmentParameteriv :
  int -> int -> int -> int array -> unit
val glGetIntegerv : int -> int array -> unit
val glGetProgramInfoLog : int -> int -> int array -> string -> unit
val glGetProgramiv : int -> int -> int array -> unit
val glGetRenderbufferParameteriv : int -> int -> int array -> unit
val glGetShaderInfoLog : int -> int -> int array -> string -> unit
val glGetShaderPrecisionFormat : int -> int -> int array -> int array -> unit
val glGetShaderSource : int -> int -> int array -> string -> unit
val glGetShaderiv : int -> int -> int array -> unit
val glGetTexParameterfv : int -> int -> float array -> unit
val glGetTexParameteriv : int -> int -> int array -> unit
external glGetUniformLocation : int -> string -> int
  = "glstub_glGetUniformLocation" "glstub_glGetUniformLocation"
val glGetUniformfv : int -> int -> float array -> unit
val glGetUniformiv : int -> int -> int array -> unit
external glGetVertexAttribPointerv : int -> int -> 'a -> unit
  = "glstub_glGetVertexAttribPointerv" "glstub_glGetVertexAttribPointerv"
val glGetVertexAttribfv : int -> int -> float array -> unit
val glGetVertexAttribiv : int -> int -> int array -> unit
external glHint : int -> int -> unit = "glstub_glHint" "glstub_glHint"
external glIsBuffer : int -> bool = "glstub_glIsBuffer" "glstub_glIsBuffer"
external glIsEnabled : int -> bool = "glstub_glIsEnabled"
  "glstub_glIsEnabled"
external glIsFramebuffer : int -> bool = "glstub_glIsFramebuffer"
  "glstub_glIsFramebuffer"
external glIsProgram : int -> bool = "glstub_glIsProgram"
  "glstub_glIsProgram"
external glIsRenderbuffer : int -> bool = "glstub_glIsRenderbuffer"
  "glstub_glIsRenderbuffer"
external glIsShader : int -> bool = "glstub_glIsShader" "glstub_glIsShader"
external glIsTexture : int -> bool = "glstub_glIsTexture"
  "glstub_glIsTexture"
external glLineWidth : float -> unit = "glstub_glLineWidth"
  "glstub_glLineWidth"
external glLinkProgram : int -> unit = "glstub_glLinkProgram"
  "glstub_glLinkProgram"
external glPixelStorei : int -> int -> unit = "glstub_glPixelStorei"
  "glstub_glPixelStorei"
external glPolygonOffset : float -> float -> unit = "glstub_glPolygonOffset"
  "glstub_glPolygonOffset"
external glReadPixels : int -> int -> int -> int -> int -> int -> 'a -> unit
  = "glstub_glReadPixels_byte" "glstub_glReadPixels"
external glReleaseShaderCompiler : unit -> unit
  = "glstub_glReleaseShaderCompiler" "glstub_glReleaseShaderCompiler"
external glRenderbufferStorage : int -> int -> int -> int -> unit
  = "glstub_glRenderbufferStorage" "glstub_glRenderbufferStorage"
external glSampleCoverage : float -> bool -> unit = "glstub_glSampleCoverage"
  "glstub_glSampleCoverage"
external glScissor : int -> int -> int -> int -> unit = "glstub_glScissor"
  "glstub_glScissor"
val glShaderBinary : int -> int array -> int -> 'a -> int -> unit
val glShaderSource : int -> int -> string array -> int array -> unit
external glStencilFunc : int -> int -> int -> unit = "glstub_glStencilFunc"
  "glstub_glStencilFunc"
external glStencilFuncSeparate : int -> int -> int -> int -> unit
  = "glstub_glStencilFuncSeparate" "glstub_glStencilFuncSeparate"
external glStencilMask : int -> unit = "glstub_glStencilMask"
  "glstub_glStencilMask"
external glStencilMaskSeparate : int -> int -> unit
  = "glstub_glStencilMaskSeparate" "glstub_glStencilMaskSeparate"
external glStencilOp : int -> int -> int -> unit = "glstub_glStencilOp"
  "glstub_glStencilOp"
external glStencilOpSeparate : int -> int -> int -> int -> unit
  = "glstub_glStencilOpSeparate" "glstub_glStencilOpSeparate"
external glTexImage2D :
  int -> int -> int -> int -> int -> int -> int -> int -> 'a -> unit
  = "glstub_glTexImage2D_byte" "glstub_glTexImage2D"
external glTexParameterf : int -> int -> float -> unit
  = "glstub_glTexParameterf" "glstub_glTexParameterf"
val glTexParameterfv : int -> int -> float array -> unit
external glTexParameteri : int -> int -> int -> unit
  = "glstub_glTexParameteri" "glstub_glTexParameteri"
val glTexParameteriv : int -> int -> int array -> unit
external glTexSubImage2D :
  int -> int -> int -> int -> int -> int -> int -> int -> 'a -> unit
  = "glstub_glTexSubImage2D_byte" "glstub_glTexSubImage2D"
external glUniform1f : int -> float -> unit = "glstub_glUniform1f"
  "glstub_glUniform1f"
val glUniform1fv : int -> int -> float array -> unit
external glUniform1i : int -> int -> unit = "glstub_glUniform1i"
  "glstub_glUniform1i"
val glUniform1iv : int -> int -> int array -> unit
external glUniform2f : int -> float -> float -> unit = "glstub_glUniform2f"
  "glstub_glUniform2f"
val glUniform2fv : int -> int -> float array -> unit
external glUniform2i : int -> int -> int -> unit = "glstub_glUniform2i"
  "glstub_glUniform2i"
val glUniform2iv : int -> int -> int array -> unit
external glUniform3f : int -> float -> float -> float -> unit
  = "glstub_glUniform3f" "glstub_glUniform3f"
val glUniform3fv : int -> int -> float array -> unit
external glUniform3i : int -> int -> int -> int -> unit
  = "glstub_glUniform3i" "glstub_glUniform3i"
val glUniform3iv : int -> int -> int array -> unit
external glUniform4f : int -> float -> float -> float -> float -> unit
  = "glstub_glUniform4f" "glstub_glUniform4f"
val glUniform4fv : int -> int -> float array -> unit
external glUniform4i : int -> int -> int -> int -> int -> unit
  = "glstub_glUniform4i" "glstub_glUniform4i"
val glUniform4iv : int -> int -> int array -> unit
val glUniformMatrix2fv : int -> int -> bool -> float array -> unit
val glUniformMatrix3fv : int -> int -> bool -> float array -> unit
val glUniformMatrix4fv : int -> int -> bool -> float array -> unit
external glUseProgram : int -> unit = "glstub_glUseProgram"
  "glstub_glUseProgram"
external glValidateProgram : int -> unit = "glstub_glValidateProgram"
  "glstub_glValidateProgram"
external glVertexAttrib1f : int -> float -> unit = "glstub_glVertexAttrib1f"
  "glstub_glVertexAttrib1f"
val glVertexAttrib1fv : int -> float array -> unit
external glVertexAttrib2f : int -> float -> float -> unit
  = "glstub_glVertexAttrib2f" "glstub_glVertexAttrib2f"
val glVertexAttrib2fv : int -> float array -> unit
external glVertexAttrib3f : int -> float -> float -> float -> unit
  = "glstub_glVertexAttrib3f" "glstub_glVertexAttrib3f"
val glVertexAttrib3fv : int -> float array -> unit
external glVertexAttrib4f : int -> float -> float -> float -> float -> unit
  = "glstub_glVertexAttrib4f" "glstub_glVertexAttrib4f"
val glVertexAttrib4fv : int -> float array -> unit
external glVertexAttribPointer :
  int -> int -> int -> bool -> int -> 'a -> unit
  = "glstub_glVertexAttribPointer_byte" "glstub_glVertexAttribPointer"
external glViewport : int -> int -> int -> int -> unit = "glstub_glViewport"
  "glstub_glViewport"
