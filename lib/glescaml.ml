(*
 * GLCaml - Objective Caml interface for OpenGL 1.1, 1.2, 1.3, 1.4, 1.5, 2.0 and 2.1
 * plus extensions: 
 * 
 * Copyright (C) 2007, 2008 Elliott OTI
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


(** 1-dimensional array definitions for 
	- 8-bit signed bytes
	- 8-bit unsigned bytes
	- 16 bits signed words
	- 16 bits unsigned words
	- 32 bit signed words
	- 64 bit signed words
	- native word size
	- 32 bit IEEE floats 
	- 64 bit IEEE floats *)
type byte_array = (int, Bigarray.int8_signed_elt, Bigarray.c_layout) Bigarray.Array1.t
type ubyte_array = (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
type short_array = (int, Bigarray.int16_signed_elt, Bigarray.c_layout) Bigarray.Array1.t
type ushort_array = (int, Bigarray.int16_unsigned_elt, Bigarray.c_layout) Bigarray.Array1.t
type word_array = (int32, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array1.t
type dword_array = (int64, Bigarray.int64_elt, Bigarray.c_layout) Bigarray.Array1.t
type int_array = (int, Bigarray.int_elt, Bigarray.c_layout) Bigarray.Array1.t
type float_array = (float, Bigarray.float32_elt, Bigarray.c_layout) Bigarray.Array1.t
type double_array = (float, Bigarray.float64_elt, Bigarray.c_layout) Bigarray.Array1.t

(** 2-dimensional array definitions for 
	- 8-bit signed bytes
	- 8-bit unsigned bytes
	- 16 bits signed words
	- 16 bits unsigned words
	- 32 bit signed words
	- 64 bit signed words
	- native word size
	- 32 bit IEEE floats 
	- 64 bit IEEE floats *)
type byte_matrix = (int, Bigarray.int8_signed_elt, Bigarray.c_layout) Bigarray.Array2.t
type ubyte_matrix = (int, Bigarray.int8_unsigned_elt, Bigarray.c_layout) Bigarray.Array2.t
type short_matrix = (int, Bigarray.int16_signed_elt, Bigarray.c_layout) Bigarray.Array2.t
type ushort_matrix = (int, Bigarray.int16_unsigned_elt, Bigarray.c_layout) Bigarray.Array2.t
type word_matrix = (int32, Bigarray.int32_elt, Bigarray.c_layout) Bigarray.Array2.t
type dword_matrix = (int64, Bigarray.int64_elt, Bigarray.c_layout) Bigarray.Array2.t
type int_matrix = (int, Bigarray.int_elt, Bigarray.c_layout) Bigarray.Array2.t
type float_matrix = (float, Bigarray.float32_elt, Bigarray.c_layout) Bigarray.Array2.t
type double_matrix = (float, Bigarray.float64_elt, Bigarray.c_layout) Bigarray.Array2.t

(** Create 1-dimensional arrays of the following types:
	- 8-bit signed bytes
	- 8-bit unsigned bytes
	- 16 bits signed words
	- 16 bits unsigned words
	- 32 bit signed words
	- 64 bit signed words
	- native word size
	- 32 bit IEEE floats 
	- 64 bit IEEE floats *)
let make_byte_array len = Bigarray.Array1.create Bigarray.int8_signed Bigarray.c_layout len
let make_ubyte_array len = Bigarray.Array1.create Bigarray.int8_unsigned Bigarray.c_layout len
let make_short_array len = Bigarray.Array1.create Bigarray.int16_signed Bigarray.c_layout len
let make_ushort_array len = Bigarray.Array1.create Bigarray.int16_unsigned Bigarray.c_layout len
let make_word_array len = Bigarray.Array1.create Bigarray.int32 Bigarray.c_layout len
let make_dword_array len = Bigarray.Array1.create Bigarray.int64 Bigarray.c_layout len
let make_int_array len = Bigarray.Array1.create Bigarray.int Bigarray.c_layout len
let make_float_array len = Bigarray.Array1.create Bigarray.float32 Bigarray.c_layout len
let make_double_array len = Bigarray.Array1.create Bigarray.float64 Bigarray.c_layout len

(** Create 2-dimensional arrays of the following types:
	- 8-bit signed bytes
	- 8-bit unsigned bytes
	- 16 bits signed words
	- 16 bits unsigned words
	- 32 bit signed words
	- 64 bit signed words
	- native word size
	- 32 bit IEEE floats 
	- 64 bit IEEE floats *)
let make_byte_matrix dim1 dim2 = Bigarray.Array2.create Bigarray.int8_signed Bigarray.c_layout  dim1 dim2
let make_ubyte_matrix dim1 dim2 = Bigarray.Array2.create Bigarray.int8_unsigned Bigarray.c_layout  dim1 dim2
let make_short_matrix dim1 dim2 = Bigarray.Array2.create Bigarray.int16_signed Bigarray.c_layout  dim1 dim2
let make_ushort_matrix dim1 dim2 = Bigarray.Array2.create Bigarray.int16_unsigned Bigarray.c_layout  dim1 dim2
let make_word_matrix dim1 dim2 = Bigarray.Array2.create Bigarray.int32 Bigarray.c_layout  dim1 dim2
let make_dword_matrix dim1 dim2 = Bigarray.Array2.create Bigarray.int64 Bigarray.c_layout  dim1 dim2
let make_int_matrix dim1 dim2 = Bigarray.Array2.create Bigarray.int Bigarray.c_layout  dim1 dim2
let make_float_matrix dim1 dim2 = Bigarray.Array2.create Bigarray.float32 Bigarray.c_layout  dim1 dim2
let make_double_matrix dim1 dim2 = Bigarray.Array2.create Bigarray.float64 Bigarray.c_layout  dim1 dim2

(** Conversions between native Ocaml arrays and bigarrays for
	- int arrays to byte_arrays
	- int arrays to ubyte_arrays
	- int arrays to short_arrays
	- int arrays to ushort_arrays
	- int arrays to int_arrays
	- float arrays to float_arrays
	- float arrays to double_arrays
*)
let to_byte_array a = Bigarray.Array1.of_array Bigarray.int8_signed Bigarray.c_layout a
let to_ubyte_array a = Bigarray.Array1.of_array Bigarray.int8_unsigned Bigarray.c_layout a
let to_short_array a = Bigarray.Array1.of_array Bigarray.int16_signed Bigarray.c_layout a
let to_ushort_array a = Bigarray.Array1.of_array Bigarray.int16_unsigned Bigarray.c_layout a
let to_word_array a = 
	let r = make_word_array (Array.length a) in
	let _ = Array.iteri (fun i a -> r.{i} <- Int32.of_int a ) a in r
let to_dword_array a = 
	let r = make_dword_array (Array.length a) in
	let _ = Array.iteri (fun i a -> r.{i} <- Int64.of_int a ) a in r
let to_int_array a = 
	let r = make_int_array (Array.length a) in
	let _ = Array.iteri (fun i a -> r.{i} <- a ) a in r
let to_float_array a = 
	let r = make_float_array (Array.length a) in
	let _ = Array.iteri (fun i a -> r.{i} <- a ) a in r
let to_double_array a = 
	let r = make_double_array (Array.length a) in
	let _ = Array.iteri (fun i a -> r.{i} <- a ) a in r

(**	Copy data between bigarrays and preallocated Ocaml arrays of 
	suitable length:
	- byte_array to int array
	- ubyte_array to int array
	- short_array to int array
	- ushort_array to int array
	- word_array to int array
	- dword_array to int array
	- float_array to float array
	- double_array to float array
*)
let copy_byte_array src dst =
	Array.iteri (fun i c -> dst.(i) <- src.{i} ) dst
let copy_ubyte_array = copy_byte_array
let copy_short_array = copy_byte_array
let copy_ushort_array = copy_byte_array
let copy_word_array src dst =
	Array.iteri (fun i c -> dst.(i) <- Int32.to_int src.{i} ) dst
let copy_dword_array src dst =
	Array.iteri (fun i c -> dst.(i) <- Int64.to_int src.{i} ) dst
let copy_float_array src dst = copy_byte_array	
let copy_double_array src dst = copy_byte_array	

(** Convert a byte_array or ubyte_array to a string *)
let to_string a =
	let l = Bigarray.Array1.dim a in
	let s = String.create l in
	for i = 0 to (l - 1) do
		s.[i] <- a.{i}
	done;
	s

(** Convert between booleans and ints *)
let int_of_bool b = if b then 1 else 0
let bool_of_int i = not (i = 0)
let bool_to_int_array b = Array.map int_of_bool b
let int_to_bool_array i = Array.map bool_of_int i
let copy_to_bool_array src dst = 
	Array.mapi (fun i c -> dst.(i) <-  bool_of_int src.(i)) dst



let gl_es_version_2_0 = 0x00000001
let gl_depth_buffer_bit = 0x00000100
let gl_stencil_buffer_bit = 0x00000400
let gl_color_buffer_bit = 0x00004000
let gl_false = 0x00000000
let gl_true = 0x00000001
let gl_points = 0x00000000
let gl_lines = 0x00000001
let gl_line_loop = 0x00000002
let gl_line_strip = 0x00000003
let gl_triangles = 0x00000004
let gl_triangle_strip = 0x00000005
let gl_triangle_fan = 0x00000006
let gl_zero = 0x00000000
let gl_one = 0x00000001
let gl_src_color = 0x00000300
let gl_one_minus_src_color = 0x00000301
let gl_src_alpha = 0x00000302
let gl_one_minus_src_alpha = 0x00000303
let gl_dst_alpha = 0x00000304
let gl_one_minus_dst_alpha = 0x00000305
let gl_dst_color = 0x00000306
let gl_one_minus_dst_color = 0x00000307
let gl_src_alpha_saturate = 0x00000308
let gl_func_add = 0x00008006
let gl_blend_equation = 0x00008009
let gl_blend_equation_rgb = 0x00008009
let gl_blend_equation_alpha = 0x0000883d
let gl_func_subtract = 0x0000800a
let gl_func_reverse_subtract = 0x0000800b
let gl_blend_dst_rgb = 0x000080c8
let gl_blend_src_rgb = 0x000080c9
let gl_blend_dst_alpha = 0x000080ca
let gl_blend_src_alpha = 0x000080cb
let gl_constant_color = 0x00008001
let gl_one_minus_constant_color = 0x00008002
let gl_constant_alpha = 0x00008003
let gl_one_minus_constant_alpha = 0x00008004
let gl_blend_color = 0x00008005
let gl_array_buffer = 0x00008892
let gl_element_array_buffer = 0x00008893
let gl_array_buffer_binding = 0x00008894
let gl_element_array_buffer_binding = 0x00008895
let gl_stream_draw = 0x000088e0
let gl_static_draw = 0x000088e4
let gl_dynamic_draw = 0x000088e8
let gl_buffer_size = 0x00008764
let gl_buffer_usage = 0x00008765
let gl_current_vertex_attrib = 0x00008626
let gl_front = 0x00000404
let gl_back = 0x00000405
let gl_front_and_back = 0x00000408
let gl_texture_2d = 0x00000de1
let gl_cull_face = 0x00000b44
let gl_blend = 0x00000be2
let gl_dither = 0x00000bd0
let gl_stencil_test = 0x00000b90
let gl_depth_test = 0x00000b71
let gl_scissor_test = 0x00000c11
let gl_polygon_offset_fill = 0x00008037
let gl_sample_alpha_to_coverage = 0x0000809e
let gl_sample_coverage = 0x000080a0
let gl_no_error = 0x00000000
let gl_invalid_enum = 0x00000500
let gl_invalid_value = 0x00000501
let gl_invalid_operation = 0x00000502
let gl_out_of_memory = 0x00000505
let gl_cw = 0x00000900
let gl_ccw = 0x00000901
let gl_line_width = 0x00000b21
let gl_aliased_point_size_range = 0x0000846d
let gl_aliased_line_width_range = 0x0000846e
let gl_cull_face_mode = 0x00000b45
let gl_front_face = 0x00000b46
let gl_depth_range = 0x00000b70
let gl_depth_writemask = 0x00000b72
let gl_depth_clear_value = 0x00000b73
let gl_depth_func = 0x00000b74
let gl_stencil_clear_value = 0x00000b91
let gl_stencil_func = 0x00000b92
let gl_stencil_fail = 0x00000b94
let gl_stencil_pass_depth_fail = 0x00000b95
let gl_stencil_pass_depth_pass = 0x00000b96
let gl_stencil_ref = 0x00000b97
let gl_stencil_value_mask = 0x00000b93
let gl_stencil_writemask = 0x00000b98
let gl_stencil_back_func = 0x00008800
let gl_stencil_back_fail = 0x00008801
let gl_stencil_back_pass_depth_fail = 0x00008802
let gl_stencil_back_pass_depth_pass = 0x00008803
let gl_stencil_back_ref = 0x00008ca3
let gl_stencil_back_value_mask = 0x00008ca4
let gl_stencil_back_writemask = 0x00008ca5
let gl_viewport = 0x00000ba2
let gl_scissor_box = 0x00000c10
let gl_color_clear_value = 0x00000c22
let gl_color_writemask = 0x00000c23
let gl_unpack_alignment = 0x00000cf5
let gl_pack_alignment = 0x00000d05
let gl_max_texture_size = 0x00000d33
let gl_max_viewport_dims = 0x00000d3a
let gl_subpixel_bits = 0x00000d50
let gl_red_bits = 0x00000d52
let gl_green_bits = 0x00000d53
let gl_blue_bits = 0x00000d54
let gl_alpha_bits = 0x00000d55
let gl_depth_bits = 0x00000d56
let gl_stencil_bits = 0x00000d57
let gl_polygon_offset_units = 0x00002a00
let gl_polygon_offset_factor = 0x00008038
let gl_texture_binding_2d = 0x00008069
let gl_sample_buffers = 0x000080a8
let gl_samples = 0x000080a9
let gl_sample_coverage_value = 0x000080aa
let gl_sample_coverage_invert = 0x000080ab
let gl_num_compressed_texture_formats = 0x000086a2
let gl_compressed_texture_formats = 0x000086a3
let gl_dont_care = 0x00001100
let gl_fastest = 0x00001101
let gl_nicest = 0x00001102
let gl_generate_mipmap_hint = 0x00008192
let gl_byte = 0x00001400
let gl_unsigned_byte = 0x00001401
let gl_short = 0x00001402
let gl_unsigned_short = 0x00001403
let gl_int = 0x00001404
let gl_unsigned_int = 0x00001405
let gl_float = 0x00001406
let gl_fixed = 0x0000140c
let gl_depth_component = 0x00001902
let gl_alpha = 0x00001906
let gl_rgb = 0x00001907
let gl_rgba = 0x00001908
let gl_luminance = 0x00001909
let gl_luminance_alpha = 0x0000190a
let gl_unsigned_short_4_4_4_4 = 0x00008033
let gl_unsigned_short_5_5_5_1 = 0x00008034
let gl_unsigned_short_5_6_5 = 0x00008363
let gl_fragment_shader = 0x00008b30
let gl_vertex_shader = 0x00008b31
let gl_max_vertex_attribs = 0x00008869
let gl_max_vertex_uniform_vectors = 0x00008dfb
let gl_max_varying_vectors = 0x00008dfc
let gl_max_combined_texture_image_units = 0x00008b4d
let gl_max_vertex_texture_image_units = 0x00008b4c
let gl_max_texture_image_units = 0x00008872
let gl_max_fragment_uniform_vectors = 0x00008dfd
let gl_shader_type = 0x00008b4f
let gl_delete_status = 0x00008b80
let gl_link_status = 0x00008b82
let gl_validate_status = 0x00008b83
let gl_attached_shaders = 0x00008b85
let gl_active_uniforms = 0x00008b86
let gl_active_uniform_max_length = 0x00008b87
let gl_active_attributes = 0x00008b89
let gl_active_attribute_max_length = 0x00008b8a
let gl_shading_language_version = 0x00008b8c
let gl_current_program = 0x00008b8d
let gl_never = 0x00000200
let gl_less = 0x00000201
let gl_equal = 0x00000202
let gl_lequal = 0x00000203
let gl_greater = 0x00000204
let gl_notequal = 0x00000205
let gl_gequal = 0x00000206
let gl_always = 0x00000207
let gl_keep = 0x00001e00
let gl_replace = 0x00001e01
let gl_incr = 0x00001e02
let gl_decr = 0x00001e03
let gl_invert = 0x0000150a
let gl_incr_wrap = 0x00008507
let gl_decr_wrap = 0x00008508
let gl_vendor = 0x00001f00
let gl_renderer = 0x00001f01
let gl_version = 0x00001f02
let gl_extensions = 0x00001f03
let gl_nearest = 0x00002600
let gl_linear = 0x00002601
let gl_nearest_mipmap_nearest = 0x00002700
let gl_linear_mipmap_nearest = 0x00002701
let gl_nearest_mipmap_linear = 0x00002702
let gl_linear_mipmap_linear = 0x00002703
let gl_texture_mag_filter = 0x00002800
let gl_texture_min_filter = 0x00002801
let gl_texture_wrap_s = 0x00002802
let gl_texture_wrap_t = 0x00002803
let gl_texture = 0x00001702
let gl_texture_cube_map = 0x00008513
let gl_texture_binding_cube_map = 0x00008514
let gl_texture_cube_map_positive_x = 0x00008515
let gl_texture_cube_map_negative_x = 0x00008516
let gl_texture_cube_map_positive_y = 0x00008517
let gl_texture_cube_map_negative_y = 0x00008518
let gl_texture_cube_map_positive_z = 0x00008519
let gl_texture_cube_map_negative_z = 0x0000851a
let gl_max_cube_map_texture_size = 0x0000851c
let gl_texture0 = 0x000084c0
let gl_texture1 = 0x000084c1
let gl_texture2 = 0x000084c2
let gl_texture3 = 0x000084c3
let gl_texture4 = 0x000084c4
let gl_texture5 = 0x000084c5
let gl_texture6 = 0x000084c6
let gl_texture7 = 0x000084c7
let gl_texture8 = 0x000084c8
let gl_texture9 = 0x000084c9
let gl_texture10 = 0x000084ca
let gl_texture11 = 0x000084cb
let gl_texture12 = 0x000084cc
let gl_texture13 = 0x000084cd
let gl_texture14 = 0x000084ce
let gl_texture15 = 0x000084cf
let gl_texture16 = 0x000084d0
let gl_texture17 = 0x000084d1
let gl_texture18 = 0x000084d2
let gl_texture19 = 0x000084d3
let gl_texture20 = 0x000084d4
let gl_texture21 = 0x000084d5
let gl_texture22 = 0x000084d6
let gl_texture23 = 0x000084d7
let gl_texture24 = 0x000084d8
let gl_texture25 = 0x000084d9
let gl_texture26 = 0x000084da
let gl_texture27 = 0x000084db
let gl_texture28 = 0x000084dc
let gl_texture29 = 0x000084dd
let gl_texture30 = 0x000084de
let gl_texture31 = 0x000084df
let gl_active_texture = 0x000084e0
let gl_repeat = 0x00002901
let gl_clamp_to_edge = 0x0000812f
let gl_mirrored_repeat = 0x00008370
let gl_float_vec2 = 0x00008b50
let gl_float_vec3 = 0x00008b51
let gl_float_vec4 = 0x00008b52
let gl_int_vec2 = 0x00008b53
let gl_int_vec3 = 0x00008b54
let gl_int_vec4 = 0x00008b55
let gl_bool = 0x00008b56
let gl_bool_vec2 = 0x00008b57
let gl_bool_vec3 = 0x00008b58
let gl_bool_vec4 = 0x00008b59
let gl_float_mat2 = 0x00008b5a
let gl_float_mat3 = 0x00008b5b
let gl_float_mat4 = 0x00008b5c
let gl_sampler_2d = 0x00008b5e
let gl_sampler_cube = 0x00008b60
let gl_vertex_attrib_array_enabled = 0x00008622
let gl_vertex_attrib_array_size = 0x00008623
let gl_vertex_attrib_array_stride = 0x00008624
let gl_vertex_attrib_array_type = 0x00008625
let gl_vertex_attrib_array_normalized = 0x0000886a
let gl_vertex_attrib_array_pointer = 0x00008645
let gl_vertex_attrib_array_buffer_binding = 0x0000889f
let gl_implementation_color_read_type = 0x00008b9a
let gl_implementation_color_read_format = 0x00008b9b
let gl_compile_status = 0x00008b81
let gl_info_log_length = 0x00008b84
let gl_shader_source_length = 0x00008b88
let gl_shader_compiler = 0x00008dfa
let gl_shader_binary_formats = 0x00008df8
let gl_num_shader_binary_formats = 0x00008df9
let gl_low_float = 0x00008df0
let gl_medium_float = 0x00008df1
let gl_high_float = 0x00008df2
let gl_low_int = 0x00008df3
let gl_medium_int = 0x00008df4
let gl_high_int = 0x00008df5
let gl_framebuffer = 0x00008d40
let gl_renderbuffer = 0x00008d41
let gl_rgba4 = 0x00008056
let gl_rgb5_a1 = 0x00008057
let gl_rgb565 = 0x00008d62
let gl_depth_component16 = 0x000081a5
let gl_stencil_index = 0x00001901
let gl_stencil_index8 = 0x00008d48
let gl_renderbuffer_width = 0x00008d42
let gl_renderbuffer_height = 0x00008d43
let gl_renderbuffer_internal_format = 0x00008d44
let gl_renderbuffer_red_size = 0x00008d50
let gl_renderbuffer_green_size = 0x00008d51
let gl_renderbuffer_blue_size = 0x00008d52
let gl_renderbuffer_alpha_size = 0x00008d53
let gl_renderbuffer_depth_size = 0x00008d54
let gl_renderbuffer_stencil_size = 0x00008d55
let gl_framebuffer_attachment_object_type = 0x00008cd0
let gl_framebuffer_attachment_object_name = 0x00008cd1
let gl_framebuffer_attachment_texture_level = 0x00008cd2
let gl_framebuffer_attachment_texture_cube_map_face = 0x00008cd3
let gl_color_attachment0 = 0x00008ce0
let gl_depth_attachment = 0x00008d00
let gl_stencil_attachment = 0x00008d20
let gl_none = 0x00000000
let gl_framebuffer_complete = 0x00008cd5
let gl_framebuffer_incomplete_attachment = 0x00008cd6
let gl_framebuffer_incomplete_missing_attachment = 0x00008cd7
let gl_framebuffer_incomplete_dimensions = 0x00008cd9
let gl_framebuffer_unsupported = 0x00008cdd
let gl_framebuffer_binding = 0x00008ca6
let gl_renderbuffer_binding = 0x00008ca7
let gl_max_renderbuffer_size = 0x000084e8
let gl_invalid_framebuffer_operation = 0x00000506
external glActiveTexture: int -> unit = "glstub_glActiveTexture" "glstub_glActiveTexture"
external glAttachShader: int -> int -> unit = "glstub_glAttachShader" "glstub_glAttachShader"
external glBindAttribLocation: int -> int -> string -> unit = "glstub_glBindAttribLocation" "glstub_glBindAttribLocation"
external glBindBuffer: int -> int -> unit = "glstub_glBindBuffer" "glstub_glBindBuffer"
external glBindFramebuffer: int -> int -> unit = "glstub_glBindFramebuffer" "glstub_glBindFramebuffer"
external glBindRenderbuffer: int -> int -> unit = "glstub_glBindRenderbuffer" "glstub_glBindRenderbuffer"
external glBindTexture: int -> int -> unit = "glstub_glBindTexture" "glstub_glBindTexture"
external glBlendColor: float -> float -> float -> float -> unit = "glstub_glBlendColor" "glstub_glBlendColor"
external glBlendEquation: int -> unit = "glstub_glBlendEquation" "glstub_glBlendEquation"
external glBlendEquationSeparate: int -> int -> unit = "glstub_glBlendEquationSeparate" "glstub_glBlendEquationSeparate"
external glBlendFunc: int -> int -> unit = "glstub_glBlendFunc" "glstub_glBlendFunc"
external glBlendFuncSeparate: int -> int -> int -> int -> unit = "glstub_glBlendFuncSeparate" "glstub_glBlendFuncSeparate"
external glBufferData: int -> int -> 'a -> int -> unit = "glstub_glBufferData" "glstub_glBufferData"
external glBufferSubData: int -> int -> int -> 'a -> unit = "glstub_glBufferSubData" "glstub_glBufferSubData"
external glCheckFramebufferStatus: int -> int = "glstub_glCheckFramebufferStatus" "glstub_glCheckFramebufferStatus"
external glClear: int -> unit = "glstub_glClear" "glstub_glClear"
external glClearColor: float -> float -> float -> float -> unit = "glstub_glClearColor" "glstub_glClearColor"
external glClearDepthf: float -> unit = "glstub_glClearDepthf" "glstub_glClearDepthf"
external glClearStencil: int -> unit = "glstub_glClearStencil" "glstub_glClearStencil"
external glColorMask: bool -> bool -> bool -> bool -> unit = "glstub_glColorMask" "glstub_glColorMask"
external glCompileShader: int -> unit = "glstub_glCompileShader" "glstub_glCompileShader"
external glCompressedTexImage2D: int -> int -> int -> int -> int -> int -> int -> 'a -> unit = "glstub_glCompressedTexImage2D_byte" "glstub_glCompressedTexImage2D"
external glCompressedTexSubImage2D: int -> int -> int -> int -> int -> int -> int -> int -> 'a -> unit = "glstub_glCompressedTexSubImage2D_byte" "glstub_glCompressedTexSubImage2D"
external glCopyTexImage2D: int -> int -> int -> int -> int -> int -> int -> int -> unit = "glstub_glCopyTexImage2D_byte" "glstub_glCopyTexImage2D"
external glCopyTexSubImage2D: int -> int -> int -> int -> int -> int -> int -> int -> unit = "glstub_glCopyTexSubImage2D_byte" "glstub_glCopyTexSubImage2D"
external glCreateProgram: unit -> int = "glstub_glCreateProgram" "glstub_glCreateProgram"
external glCreateShader: int -> int = "glstub_glCreateShader" "glstub_glCreateShader"
external glCullFace: int -> unit = "glstub_glCullFace" "glstub_glCullFace"

external glDeleteBuffers: int -> word_array -> unit = "glstub_glDeleteBuffers" "glstub_glDeleteBuffers"
let glDeleteBuffers p0 p1 =
let np1 = to_word_array p1 in
let r = glDeleteBuffers p0 np1 in
r


external glDeleteFramebuffers: int -> word_array -> unit = "glstub_glDeleteFramebuffers" "glstub_glDeleteFramebuffers"
let glDeleteFramebuffers p0 p1 =
let np1 = to_word_array p1 in
let r = glDeleteFramebuffers p0 np1 in
r

external glDeleteProgram: int -> unit = "glstub_glDeleteProgram" "glstub_glDeleteProgram"

external glDeleteRenderbuffers: int -> word_array -> unit = "glstub_glDeleteRenderbuffers" "glstub_glDeleteRenderbuffers"
let glDeleteRenderbuffers p0 p1 =
let np1 = to_word_array p1 in
let r = glDeleteRenderbuffers p0 np1 in
r

external glDeleteShader: int -> unit = "glstub_glDeleteShader" "glstub_glDeleteShader"

external glDeleteTextures: int -> word_array -> unit = "glstub_glDeleteTextures" "glstub_glDeleteTextures"
let glDeleteTextures p0 p1 =
let np1 = to_word_array p1 in
let r = glDeleteTextures p0 np1 in
r

external glDepthFunc: int -> unit = "glstub_glDepthFunc" "glstub_glDepthFunc"
external glDepthMask: bool -> unit = "glstub_glDepthMask" "glstub_glDepthMask"
external glDepthRangef: float -> float -> unit = "glstub_glDepthRangef" "glstub_glDepthRangef"
external glDetachShader: int -> int -> unit = "glstub_glDetachShader" "glstub_glDetachShader"
external glDisable: int -> unit = "glstub_glDisable" "glstub_glDisable"
external glDisableVertexAttribArray: int -> unit = "glstub_glDisableVertexAttribArray" "glstub_glDisableVertexAttribArray"
external glDrawArrays: int -> int -> int -> unit = "glstub_glDrawArrays" "glstub_glDrawArrays"
external glDrawElements: int -> int -> int -> 'a -> unit = "glstub_glDrawElements" "glstub_glDrawElements"
external glEnable: int -> unit = "glstub_glEnable" "glstub_glEnable"
external glEnableVertexAttribArray: int -> unit = "glstub_glEnableVertexAttribArray" "glstub_glEnableVertexAttribArray"
external glFinish: unit -> unit = "glstub_glFinish" "glstub_glFinish"
external glFlush: unit -> unit = "glstub_glFlush" "glstub_glFlush"
external glFramebufferRenderbuffer: int -> int -> int -> int -> unit = "glstub_glFramebufferRenderbuffer" "glstub_glFramebufferRenderbuffer"
external glFramebufferTexture2D: int -> int -> int -> int -> int -> unit = "glstub_glFramebufferTexture2D" "glstub_glFramebufferTexture2D"
external glFrontFace: int -> unit = "glstub_glFrontFace" "glstub_glFrontFace"

external glGenBuffers: int -> word_array -> unit = "glstub_glGenBuffers" "glstub_glGenBuffers"
let glGenBuffers p0 p1 =
let np1 = to_word_array p1 in
let r = glGenBuffers p0 np1 in
let _ = copy_word_array np1 p1 in
r


external glGenFramebuffers: int -> word_array -> unit = "glstub_glGenFramebuffers" "glstub_glGenFramebuffers"
let glGenFramebuffers p0 p1 =
let np1 = to_word_array p1 in
let r = glGenFramebuffers p0 np1 in
let _ = copy_word_array np1 p1 in
r


external glGenRenderbuffers: int -> word_array -> unit = "glstub_glGenRenderbuffers" "glstub_glGenRenderbuffers"
let glGenRenderbuffers p0 p1 =
let np1 = to_word_array p1 in
let r = glGenRenderbuffers p0 np1 in
let _ = copy_word_array np1 p1 in
r


external glGenTextures: int -> word_array -> unit = "glstub_glGenTextures" "glstub_glGenTextures"
let glGenTextures p0 p1 =
let np1 = to_word_array p1 in
let r = glGenTextures p0 np1 in
let _ = copy_word_array np1 p1 in
r

external glGenerateMipmap: int -> unit = "glstub_glGenerateMipmap" "glstub_glGenerateMipmap"

external glGetActiveAttrib: int -> int -> int -> word_array -> word_array -> word_array -> string -> unit = "glstub_glGetActiveAttrib_byte" "glstub_glGetActiveAttrib"
let glGetActiveAttrib p0 p1 p2 p3 p4 p5 p6 =
let np3 = to_word_array p3 in
let np4 = to_word_array p4 in
let np5 = to_word_array p5 in
let r = glGetActiveAttrib p0 p1 p2 np3 np4 np5 p6 in
let _ = copy_word_array np3 p3 in
let _ = copy_word_array np4 p4 in
let _ = copy_word_array np5 p5 in
r


external glGetActiveUniform: int -> int -> int -> word_array -> word_array -> word_array -> string -> unit = "glstub_glGetActiveUniform_byte" "glstub_glGetActiveUniform"
let glGetActiveUniform p0 p1 p2 p3 p4 p5 p6 =
let np3 = to_word_array p3 in
let np4 = to_word_array p4 in
let np5 = to_word_array p5 in
let r = glGetActiveUniform p0 p1 p2 np3 np4 np5 p6 in
let _ = copy_word_array np3 p3 in
let _ = copy_word_array np4 p4 in
let _ = copy_word_array np5 p5 in
r


external glGetAttachedShaders: int -> int -> word_array -> word_array -> unit = "glstub_glGetAttachedShaders" "glstub_glGetAttachedShaders"
let glGetAttachedShaders p0 p1 p2 p3 =
let np2 = to_word_array p2 in
let np3 = to_word_array p3 in
let r = glGetAttachedShaders p0 p1 np2 np3 in
let _ = copy_word_array np2 p2 in
let _ = copy_word_array np3 p3 in
r

external glGetAttribLocation: int -> string -> int = "glstub_glGetAttribLocation" "glstub_glGetAttribLocation"

external glGetBooleanv: int -> word_array -> unit = "glstub_glGetBooleanv" "glstub_glGetBooleanv"
let glGetBooleanv p0 p1 =
let np1 = to_word_array (bool_to_int_array p1) in
let r = glGetBooleanv p0 np1 in
let bp1 =  Array.create (Bigarray.Array1.dim np1) 0 in
let _ = copy_word_array np1 bp1 in
let _ = copy_to_bool_array bp1 p1 in
r


external glGetBufferParameteriv: int -> int -> word_array -> unit = "glstub_glGetBufferParameteriv" "glstub_glGetBufferParameteriv"
let glGetBufferParameteriv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glGetBufferParameteriv p0 p1 np2 in
let _ = copy_word_array np2 p2 in
r

external glGetError: unit -> int = "glstub_glGetError" "glstub_glGetError"

external glGetFloatv: int -> float_array -> unit = "glstub_glGetFloatv" "glstub_glGetFloatv"
let glGetFloatv p0 p1 =
let np1 = to_float_array p1 in
let r = glGetFloatv p0 np1 in
let _ = copy_float_array np1 p1 in
r


external glGetFramebufferAttachmentParameteriv: int -> int -> int -> word_array -> unit = "glstub_glGetFramebufferAttachmentParameteriv" "glstub_glGetFramebufferAttachmentParameteriv"
let glGetFramebufferAttachmentParameteriv p0 p1 p2 p3 =
let np3 = to_word_array p3 in
let r = glGetFramebufferAttachmentParameteriv p0 p1 p2 np3 in
let _ = copy_word_array np3 p3 in
r


external glGetIntegerv: int -> word_array -> unit = "glstub_glGetIntegerv" "glstub_glGetIntegerv"
let glGetIntegerv p0 p1 =
let np1 = to_word_array p1 in
let r = glGetIntegerv p0 np1 in
let _ = copy_word_array np1 p1 in
r


external glGetProgramInfoLog: int -> int -> word_array -> string -> unit = "glstub_glGetProgramInfoLog" "glstub_glGetProgramInfoLog"
let glGetProgramInfoLog p0 p1 p2 p3 =
let np2 = to_word_array p2 in
let r = glGetProgramInfoLog p0 p1 np2 p3 in
let _ = copy_word_array np2 p2 in
r


external glGetProgramiv: int -> int -> word_array -> unit = "glstub_glGetProgramiv" "glstub_glGetProgramiv"
let glGetProgramiv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glGetProgramiv p0 p1 np2 in
let _ = copy_word_array np2 p2 in
r


external glGetRenderbufferParameteriv: int -> int -> word_array -> unit = "glstub_glGetRenderbufferParameteriv" "glstub_glGetRenderbufferParameteriv"
let glGetRenderbufferParameteriv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glGetRenderbufferParameteriv p0 p1 np2 in
let _ = copy_word_array np2 p2 in
r


external glGetShaderInfoLog: int -> int -> word_array -> string -> unit = "glstub_glGetShaderInfoLog" "glstub_glGetShaderInfoLog"
let glGetShaderInfoLog p0 p1 p2 p3 =
let np2 = to_word_array p2 in
let r = glGetShaderInfoLog p0 p1 np2 p3 in
let _ = copy_word_array np2 p2 in
r


external glGetShaderPrecisionFormat: int -> int -> word_array -> word_array -> unit = "glstub_glGetShaderPrecisionFormat" "glstub_glGetShaderPrecisionFormat"
let glGetShaderPrecisionFormat p0 p1 p2 p3 =
let np2 = to_word_array p2 in
let np3 = to_word_array p3 in
let r = glGetShaderPrecisionFormat p0 p1 np2 np3 in
let _ = copy_word_array np2 p2 in
let _ = copy_word_array np3 p3 in
r


external glGetShaderSource: int -> int -> word_array -> string -> unit = "glstub_glGetShaderSource" "glstub_glGetShaderSource"
let glGetShaderSource p0 p1 p2 p3 =
let np2 = to_word_array p2 in
let r = glGetShaderSource p0 p1 np2 p3 in
let _ = copy_word_array np2 p2 in
r


external glGetShaderiv: int -> int -> word_array -> unit = "glstub_glGetShaderiv" "glstub_glGetShaderiv"
let glGetShaderiv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glGetShaderiv p0 p1 np2 in
let _ = copy_word_array np2 p2 in
r


external glGetTexParameterfv: int -> int -> float_array -> unit = "glstub_glGetTexParameterfv" "glstub_glGetTexParameterfv"
let glGetTexParameterfv p0 p1 p2 =
let np2 = to_float_array p2 in
let r = glGetTexParameterfv p0 p1 np2 in
let _ = copy_float_array np2 p2 in
r


external glGetTexParameteriv: int -> int -> word_array -> unit = "glstub_glGetTexParameteriv" "glstub_glGetTexParameteriv"
let glGetTexParameteriv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glGetTexParameteriv p0 p1 np2 in
let _ = copy_word_array np2 p2 in
r

external glGetUniformLocation: int -> string -> int = "glstub_glGetUniformLocation" "glstub_glGetUniformLocation"

external glGetUniformfv: int -> int -> float_array -> unit = "glstub_glGetUniformfv" "glstub_glGetUniformfv"
let glGetUniformfv p0 p1 p2 =
let np2 = to_float_array p2 in
let r = glGetUniformfv p0 p1 np2 in
let _ = copy_float_array np2 p2 in
r


external glGetUniformiv: int -> int -> word_array -> unit = "glstub_glGetUniformiv" "glstub_glGetUniformiv"
let glGetUniformiv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glGetUniformiv p0 p1 np2 in
let _ = copy_word_array np2 p2 in
r

external glGetVertexAttribPointerv: int -> int -> 'a -> unit = "glstub_glGetVertexAttribPointerv" "glstub_glGetVertexAttribPointerv"

external glGetVertexAttribfv: int -> int -> float_array -> unit = "glstub_glGetVertexAttribfv" "glstub_glGetVertexAttribfv"
let glGetVertexAttribfv p0 p1 p2 =
let np2 = to_float_array p2 in
let r = glGetVertexAttribfv p0 p1 np2 in
let _ = copy_float_array np2 p2 in
r


external glGetVertexAttribiv: int -> int -> word_array -> unit = "glstub_glGetVertexAttribiv" "glstub_glGetVertexAttribiv"
let glGetVertexAttribiv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glGetVertexAttribiv p0 p1 np2 in
let _ = copy_word_array np2 p2 in
r

external glHint: int -> int -> unit = "glstub_glHint" "glstub_glHint"
external glIsBuffer: int -> bool = "glstub_glIsBuffer" "glstub_glIsBuffer"
external glIsEnabled: int -> bool = "glstub_glIsEnabled" "glstub_glIsEnabled"
external glIsFramebuffer: int -> bool = "glstub_glIsFramebuffer" "glstub_glIsFramebuffer"
external glIsProgram: int -> bool = "glstub_glIsProgram" "glstub_glIsProgram"
external glIsRenderbuffer: int -> bool = "glstub_glIsRenderbuffer" "glstub_glIsRenderbuffer"
external glIsShader: int -> bool = "glstub_glIsShader" "glstub_glIsShader"
external glIsTexture: int -> bool = "glstub_glIsTexture" "glstub_glIsTexture"
external glLineWidth: float -> unit = "glstub_glLineWidth" "glstub_glLineWidth"
external glLinkProgram: int -> unit = "glstub_glLinkProgram" "glstub_glLinkProgram"
external glPixelStorei: int -> int -> unit = "glstub_glPixelStorei" "glstub_glPixelStorei"
external glPolygonOffset: float -> float -> unit = "glstub_glPolygonOffset" "glstub_glPolygonOffset"
external glReadPixels: int -> int -> int -> int -> int -> int -> 'a -> unit = "glstub_glReadPixels_byte" "glstub_glReadPixels"
external glReleaseShaderCompiler: unit -> unit = "glstub_glReleaseShaderCompiler" "glstub_glReleaseShaderCompiler"
external glRenderbufferStorage: int -> int -> int -> int -> unit = "glstub_glRenderbufferStorage" "glstub_glRenderbufferStorage"
external glSampleCoverage: float -> bool -> unit = "glstub_glSampleCoverage" "glstub_glSampleCoverage"
external glScissor: int -> int -> int -> int -> unit = "glstub_glScissor" "glstub_glScissor"

external glShaderBinary: int -> word_array -> int -> 'a -> int -> unit = "glstub_glShaderBinary" "glstub_glShaderBinary"
let glShaderBinary p0 p1 p2 p3 p4 =
let np1 = to_word_array p1 in
let r = glShaderBinary p0 np1 p2 p3 p4 in
r


external glShaderSource: int -> int -> string array -> word_array -> unit = "glstub_glShaderSource" "glstub_glShaderSource"
let glShaderSource p0 p1 p2 p3 =
let np3 = to_word_array p3 in
let r = glShaderSource p0 p1 p2 np3 in
r

external glStencilFunc: int -> int -> int -> unit = "glstub_glStencilFunc" "glstub_glStencilFunc"
external glStencilFuncSeparate: int -> int -> int -> int -> unit = "glstub_glStencilFuncSeparate" "glstub_glStencilFuncSeparate"
external glStencilMask: int -> unit = "glstub_glStencilMask" "glstub_glStencilMask"
external glStencilMaskSeparate: int -> int -> unit = "glstub_glStencilMaskSeparate" "glstub_glStencilMaskSeparate"
external glStencilOp: int -> int -> int -> unit = "glstub_glStencilOp" "glstub_glStencilOp"
external glStencilOpSeparate: int -> int -> int -> int -> unit = "glstub_glStencilOpSeparate" "glstub_glStencilOpSeparate"
external glTexImage2D: int -> int -> int -> int -> int -> int -> int -> int -> 'a -> unit = "glstub_glTexImage2D_byte" "glstub_glTexImage2D"
external glTexParameterf: int -> int -> float -> unit = "glstub_glTexParameterf" "glstub_glTexParameterf"

external glTexParameterfv: int -> int -> float_array -> unit = "glstub_glTexParameterfv" "glstub_glTexParameterfv"
let glTexParameterfv p0 p1 p2 =
let np2 = to_float_array p2 in
let r = glTexParameterfv p0 p1 np2 in
r

external glTexParameteri: int -> int -> int -> unit = "glstub_glTexParameteri" "glstub_glTexParameteri"

external glTexParameteriv: int -> int -> word_array -> unit = "glstub_glTexParameteriv" "glstub_glTexParameteriv"
let glTexParameteriv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glTexParameteriv p0 p1 np2 in
r

external glTexSubImage2D: int -> int -> int -> int -> int -> int -> int -> int -> 'a -> unit = "glstub_glTexSubImage2D_byte" "glstub_glTexSubImage2D"
external glUniform1f: int -> float -> unit = "glstub_glUniform1f" "glstub_glUniform1f"

external glUniform1fv: int -> int -> float_array -> unit = "glstub_glUniform1fv" "glstub_glUniform1fv"
let glUniform1fv p0 p1 p2 =
let np2 = to_float_array p2 in
let r = glUniform1fv p0 p1 np2 in
r

external glUniform1i: int -> int -> unit = "glstub_glUniform1i" "glstub_glUniform1i"

external glUniform1iv: int -> int -> word_array -> unit = "glstub_glUniform1iv" "glstub_glUniform1iv"
let glUniform1iv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glUniform1iv p0 p1 np2 in
r

external glUniform2f: int -> float -> float -> unit = "glstub_glUniform2f" "glstub_glUniform2f"

external glUniform2fv: int -> int -> float_array -> unit = "glstub_glUniform2fv" "glstub_glUniform2fv"
let glUniform2fv p0 p1 p2 =
let np2 = to_float_array p2 in
let r = glUniform2fv p0 p1 np2 in
r

external glUniform2i: int -> int -> int -> unit = "glstub_glUniform2i" "glstub_glUniform2i"

external glUniform2iv: int -> int -> word_array -> unit = "glstub_glUniform2iv" "glstub_glUniform2iv"
let glUniform2iv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glUniform2iv p0 p1 np2 in
r

external glUniform3f: int -> float -> float -> float -> unit = "glstub_glUniform3f" "glstub_glUniform3f"

external glUniform3fv: int -> int -> float_array -> unit = "glstub_glUniform3fv" "glstub_glUniform3fv"
let glUniform3fv p0 p1 p2 =
let np2 = to_float_array p2 in
let r = glUniform3fv p0 p1 np2 in
r

external glUniform3i: int -> int -> int -> int -> unit = "glstub_glUniform3i" "glstub_glUniform3i"

external glUniform3iv: int -> int -> word_array -> unit = "glstub_glUniform3iv" "glstub_glUniform3iv"
let glUniform3iv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glUniform3iv p0 p1 np2 in
r

external glUniform4f: int -> float -> float -> float -> float -> unit = "glstub_glUniform4f" "glstub_glUniform4f"

external glUniform4fv: int -> int -> float_array -> unit = "glstub_glUniform4fv" "glstub_glUniform4fv"
let glUniform4fv p0 p1 p2 =
let np2 = to_float_array p2 in
let r = glUniform4fv p0 p1 np2 in
r

external glUniform4i: int -> int -> int -> int -> int -> unit = "glstub_glUniform4i" "glstub_glUniform4i"

external glUniform4iv: int -> int -> word_array -> unit = "glstub_glUniform4iv" "glstub_glUniform4iv"
let glUniform4iv p0 p1 p2 =
let np2 = to_word_array p2 in
let r = glUniform4iv p0 p1 np2 in
r


external glUniformMatrix2fv: int -> int -> bool -> float_array -> unit = "glstub_glUniformMatrix2fv" "glstub_glUniformMatrix2fv"
let glUniformMatrix2fv p0 p1 p2 p3 =
let np3 = to_float_array p3 in
let r = glUniformMatrix2fv p0 p1 p2 np3 in
r


external glUniformMatrix3fv: int -> int -> bool -> float_array -> unit = "glstub_glUniformMatrix3fv" "glstub_glUniformMatrix3fv"
let glUniformMatrix3fv p0 p1 p2 p3 =
let np3 = to_float_array p3 in
let r = glUniformMatrix3fv p0 p1 p2 np3 in
r


external glUniformMatrix4fv: int -> int -> bool -> float_array -> unit = "glstub_glUniformMatrix4fv" "glstub_glUniformMatrix4fv"
let glUniformMatrix4fv p0 p1 p2 p3 =
let np3 = to_float_array p3 in
let r = glUniformMatrix4fv p0 p1 p2 np3 in
r

external glUseProgram: int -> unit = "glstub_glUseProgram" "glstub_glUseProgram"
external glValidateProgram: int -> unit = "glstub_glValidateProgram" "glstub_glValidateProgram"
external glVertexAttrib1f: int -> float -> unit = "glstub_glVertexAttrib1f" "glstub_glVertexAttrib1f"

external glVertexAttrib1fv: int -> float_array -> unit = "glstub_glVertexAttrib1fv" "glstub_glVertexAttrib1fv"
let glVertexAttrib1fv p0 p1 =
let np1 = to_float_array p1 in
let r = glVertexAttrib1fv p0 np1 in
r

external glVertexAttrib2f: int -> float -> float -> unit = "glstub_glVertexAttrib2f" "glstub_glVertexAttrib2f"

external glVertexAttrib2fv: int -> float_array -> unit = "glstub_glVertexAttrib2fv" "glstub_glVertexAttrib2fv"
let glVertexAttrib2fv p0 p1 =
let np1 = to_float_array p1 in
let r = glVertexAttrib2fv p0 np1 in
r

external glVertexAttrib3f: int -> float -> float -> float -> unit = "glstub_glVertexAttrib3f" "glstub_glVertexAttrib3f"

external glVertexAttrib3fv: int -> float_array -> unit = "glstub_glVertexAttrib3fv" "glstub_glVertexAttrib3fv"
let glVertexAttrib3fv p0 p1 =
let np1 = to_float_array p1 in
let r = glVertexAttrib3fv p0 np1 in
r

external glVertexAttrib4f: int -> float -> float -> float -> float -> unit = "glstub_glVertexAttrib4f" "glstub_glVertexAttrib4f"

external glVertexAttrib4fv: int -> float_array -> unit = "glstub_glVertexAttrib4fv" "glstub_glVertexAttrib4fv"
let glVertexAttrib4fv p0 p1 =
let np1 = to_float_array p1 in
let r = glVertexAttrib4fv p0 np1 in
r

external glVertexAttribPointer: int -> int -> int -> bool -> int -> 'a -> unit = "glstub_glVertexAttribPointer_byte" "glstub_glVertexAttribPointer"
external glViewport: int -> int -> int -> int -> unit = "glstub_glViewport" "glstub_glViewport"
