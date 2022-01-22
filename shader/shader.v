// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module shader

import rl

pub struct C.Shader {
	id   u32
	locs &int
}

pub type Shader = C.Shader

pub enum ShaderLocationIndex {
	vertex_position = C.SHADER_LOC_VERTEX_POSITION
	vertex_texcoord01 = C.SHADER_LOC_VERTEX_TEXCOORD01
	vertex_texcoord02 = C.SHADER_LOC_VERTEX_TEXCOORD02
	vertex_normal = C.SHADER_LOC_VERTEX_NORMAL
	vertex_tangent = C.SHADER_LOC_VERTEX_TANGENT
	vertex_color = C.SHADER_LOC_VERTEX_COLOR
	matrix_mvp = C.SHADER_LOC_MATRIX_MVP
	matrix_view = C.SHADER_LOC_MATRIX_VIEW
	matrix_projection = C.SHADER_LOC_MATRIX_PROJECTION
	matrix_model = C.SHADER_LOC_MATRIX_MODEL
	matrix_normal = C.SHADER_LOC_MATRIX_NORMAL
	vector_view = C.SHADER_LOC_VECTOR_VIEW
	color_diffuse = C.SHADER_LOC_COLOR_DIFFUSE
	color_specular = C.SHADER_LOC_COLOR_SPECULAR
	color_ambient = C.SHADER_LOC_COLOR_AMBIENT
	map_albedo = C.SHADER_LOC_MAP_ALBEDO
	map_metalness = C.SHADER_LOC_MAP_METALNESS
	map_normal = C.SHADER_LOC_MAP_NORMAL
	map_roughness = C.SHADER_LOC_MAP_ROUGHNESS
	map_occlusion = C.SHADER_LOC_MAP_OCCLUSION
	map_emission = C.SHADER_LOC_MAP_EMISSION
	map_height = C.SHADER_LOC_MAP_HEIGHT
	map_cubemap = C.SHADER_LOC_MAP_CUBEMAP
	map_irradiance = C.SHADER_LOC_MAP_IRRADIANCE
	map_prefilter = C.SHADER_LOC_MAP_PREFILTER
	map_brdf = C.SHADER_LOC_MAP_BRDF
	map_diffuse = C.SHADER_LOC_MAP_DIFFUSE
	map_specular = C.SHADER_LOC_MAP_SPECULAR
}

// NOTE from RayLib library:
// Shader functionality is not available on OpenGL 1.1

fn C.LoadShader(vs_filename &char, fs_filename &char) C.Shader
pub fn load(vs_filename string, fs_filename string) Shader {
	return unsafe {
		C.LoadShader(&char(vs_filename.str), &char(fs_filename.str))
	}
}

fn C.LoadShaderFromMemory(vs_code &char, fs_code &char) C.Shader
pub fn load_from_memory(vs_code string, fs_code string) Shader {
	return unsafe {
		C.LoadShaderFromMemory(&char(vs_code.str), &char(fs_code.str))
	}
}

fn C.GetShaderLocation(shader C.Shader, uniform_name &char) int
pub fn (this Shader) get_location(uniform_name string) int {
	return unsafe {
		C.GetShaderLocation(this, &char(uniform_name.str))
	}
}

fn C.GetShaderLocationAttrib(shader C.Shader, attrib_name &char) int
pub fn (this Shader) get_location_attribute(attribute_name string) int {
	return unsafe {
		C.GetShaderLocationAttrib(this, &char(attribute_name.str))
	}
}

fn C.SetShaderValue(shader C.Shader, loc_index int, value voidptr, uniform_type int)
pub fn (this Shader) set_value(loc_index int, value voidptr, uniform_type int) {
	C.SetShaderValue(this, loc_index, value, uniform_type)
}

fn C.SetShaderValueV(shader C.Shader, loc_index int, value voidptr, uniform_type int, count int)
pub fn (this Shader) set_value_v(loc_index int, value voidptr, uniform_type int, count int) {
	C.SetShaderValueV(this, loc_index, value, uniform_type, count)
}

fn C.SetShaderValueMatrix(Shader shader, loc_index int, mat C.Matrix)
pub fn (this Shader) set_value_matrix(loc_index int, matrix rl.Matrix) {
	C.SetShaderValueMatrix(this, loc_index, matrix)
}

fn C.SetShaderValueTexture(shader C.Shader, loc_index int, texture C.Texture2D)
pub fn (this Shader) set_value_texture(loc_index int, texture rl.Texture2D) {
	C.SetShaderValueTexture(this, loc_index, texture)
}

fn C.UnloadShader(shader C.Shader)
pub fn (this Shader) unload() {
	C.UnloadShader(this)
}

fn C.BeginShaderMode(shader C.Shader)
pub fn begin(shader Shader) {
	C.BeginShaderMode(shader)
}

fn C.EndShaderMode()
pub fn end() {
	C.EndShaderMode()
}
