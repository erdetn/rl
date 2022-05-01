// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module color

import rl.geometry

pub const light_gray = Color{200, 200, 200, 255}

pub const gray = Color{130, 130, 130, 255}

pub const dark_gray = Color{80, 80, 80, 255}

pub const yellow = Color{253, 249, 0, 255}

pub const gold = Color{255, 203, 0, 255}

pub const orange = Color{255, 161, 0, 255}

pub const pink = Color{255, 109, 194, 255}

pub const red = Color{230, 41, 55, 255}

pub const maroon = Color{190, 33, 55, 255}

pub const green = Color{0, 228, 48, 255}

pub const lime = Color{0, 158, 47, 255}

pub const dark_green = Color{0, 117, 44, 255}

pub const skyblue = Color{102, 191, 255, 255}

pub const blue = Color{0, 121, 241, 255}

pub const dark_blue = Color{0, 82, 172, 255}

pub const purple = Color{200, 122, 255, 255}

pub const violet = Color{135, 60, 190, 255}

pub const dark_purple = Color{112, 31, 126, 255}

pub const beige = Color{211, 176, 131, 255}

pub const brown = Color{127, 106, 79, 255}

pub const dark_brown = Color{76, 63, 47, 255}

pub const white = Color{255, 255, 255, 255}

pub const black = Color{0, 0, 0, 255}

pub const blank = Color{0, 0, 0, 0}

pub const magneta = Color{255, 0, 255, 255}

pub const raywhite = Color{245, 245, 245, 255}

pub enum BlendMode {
	alpha = C.BLEND_ALPHA
	additive = C.BLEND_ADDITIVE
	multiple = C.BLEND_MULTIPLIED
	add_colors = C.BLEND_ADD_COLORS
	subtract_colors = C.BLEND_SUBTRACT_COLORS
	custom = C.BLEND_CUSTOM
}

// Color, 4 components, R8G8B8A8 (32bit)
pub struct C.Color {
	r u8 // Color red value
	g u8 // Color green value
	b u8 // Color blue value
	a u8 // Color alpha value
}

pub type Color = C.Color

pub fn new(red u8, green u8, blue u8, alpha u8) Color {
	return Color{
		r: red
		g: green
		b: blue
		a: alpha
	}
}

fn C.Fade(color Color, alpha f32) Color
pub fn (mut this Color) fade(alpha f32) Color {
	return C.Fade(this, alpha)
}

fn C.ColorToInt(color Color) int
pub fn (this Color) to_int() int {
	return C.ColorToInt(this)
}

fn C.ColorNormalize(color Color) C.Vector4
pub fn (this Color) normalize() geometry.Vector4 {
	return C.ColorNormalize(this)
}

fn C.ColorFromNormalized(normalized geometry.Vector4) Color
pub fn new_from_normalized(normalized geometry.Vector4) Color {
	return C.ColorFromNormalized(normalized)
}

pub fn (mut this Color) set_from_normalized(normalized geometry.Vector4) {
	this = new_from_normalized(normalized)
}

fn C.ColorToHSV(color Color) geometry.Vector3
pub fn (this Color) to_hsv() geometry.Vector3 {
	return C.ColorToHSV(this)
}

fn C.ColorFromHSV(hue f32, saturation f32, value f32) Color
pub fn new_from_hsv(hue f32, saturation f32, value f32) Color {
	return C.ColorFromHSV(hue, saturation, value)
}

pub fn (mut this Color) set_from_hsv(hue f32, saturation f32, value f32) {
	this = new_from_hsv(hue, saturation, value)
}

fn C.ColorAlpha(color Color, alpha f32) Color
pub fn (mut this Color) set_alpha(alpha f32) Color {
	this = C.ColorAlpha(this, alpha)
	return this
}

fn C.ColorAlphaBlend(dst Color, src Color, tint Color) Color
pub fn (mut this Color) alpah_blend(tint Color) Color {
	this = C.ColorAlphaBlend(this, this, tint)
	return this
}

pub fn (mut this Color) alpha_blend_with(source Color, tint Color) Color {
	this = C.ColorAlphaBlend(this, source, tint)
	return this
}

fn C.GetColor(hex_value u32) Color
pub fn new_from_hex(hex_value u32) Color {
	return C.GetColor(hex_value)
}

pub fn (mut this Color) set_from_hex(hex_value u32) {
	this = new_from_hex(hex_value)
}

fn C.GetPixelColor(src_ptr voidptr, format int) Color
fn C.SetPixelColor(dst_ptr voidptr, color Color, format int)
fn C.GetPixelDataSize(width int, height int, format int) int

