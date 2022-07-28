// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module rl

import rl.color
import rl.geometry
import rl.image
import rl.vr

#flag linux -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

#flag -I .
#flag -I /usr/include
#flag -l raylib 
#flag -l GL 
#flag -l m 
#flag -l pthread 
#flag -l dl 
#flag -l rt 
#flag -l X11

#include <raylib.h>

pub const version = C.RAYLIB_VERSION

// "4.1-dev"

fn C.SwapScreenBuffer()
pub fn swap_screen_buffer() {
	C.SwapScreenBuffer()
}

fn C.PollInputEvents()
pub fn poll_input_events() {
	C.PollInputEvents()
}

fn C.WaitTime(ms f32)
pub fn wait_time(ms f32) {
	C.WaitTime(ms)
}

fn C.ClearBackground(color C.Color)
pub fn clear_background(color color.Color) {
	C.ClearBackground(color)
}

fn C.BeginDrawing()
pub fn begin_drawing() {
	C.BeginDrawing()
}

fn C.EndDrawing()
pub fn end_drawing() {
	C.EndDrawing()
}

fn C.BeginBlendMode(mode int)
pub fn begin_blend_mode(mode color.BlendMode) {
	C.BeginBlendMode(int(mode))
}

fn C.EndBlendMode()
pub fn end_blend_mode() {
	C.EndBlendMode()
}

fn C.BeginScissorMode(x int, y int, width int, height int)
pub fn begin_scissor_mode(scissor_area geometry.Rectangle) {
	C.BeginScissorMode(scissor_area.x, scissor_area.y, scissor_area.width, scissor_area.height)
}

fn C.EndScissorMode()
pub fn end_scissor_mode() {
	C.EndScissorMode()
}

fn C.BeginTextureMode(target image.RenderTexture2D)
pub fn begin_texture_mode(target image.RenderTexture2D) {
	C.BeginTextureMode(target)
}

fn C.EndTextureMode()
pub fn end_texture_mode() {
	C.EndTextureMode()
}

fn C.BeginVrStereoMode(config vr.VrStereoConfig)
pub fn begin_vr_stereo_mode(config vr.VrStereoConfig) {
	C.BeginVrStereoMode(config)
}

fn C.EndVrStereoMode()
pub fn end_vr_stereo_mode() {
	C.EndVrStereoMode()
}

fn C.SetTargetFPS(fps int)
pub fn set_target_fps(fps int) {
	C.SetTargetFPS(fps)
}

fn C.GetFPS() int
pub fn get_fps() int {
	return C.GetFPS()
}

fn C.GetFrameTime() f32
pub fn get_frame_time() f32 {
	return C.GetFrameTime()
}

fn C.GetTime() f64
pub fn get_time() f64 {
	return C.GetTime()
}

fn C.GetRandomValue(min int, max int) int
pub fn random_value(min int, max int) int {
	return C.GetRandomValue(min, max)
}

fn C.SetRandomSeed(seed u32)
pub fn set_randeom_seed(seed u32) {
    C.SetRandomSeed(seed)
}

fn C.TakeScreenshot(filename &char)
pub fn take_screenshot(filename string) {
	unsafe {
		C.TakeScreenshot(&char(filename.str))
	}
}

fn C.OpenURL(url &char)
pub fn open_url(url string) {
	unsafe {
		C.OpenURL(&char(url.str))
	}
}

