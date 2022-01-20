// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module window

import rl

[flag]
pub enum ConfigFlags {
	vsync_hint // C.FLAG_VSYNC_HINT
	fullscreen_mode // C.FLAG_FULLSCREEN_MODE
	window_resizable // C.FLAG_WINDOW_RESIZABLE
	window_undecorated // C.FLAG_WINDOW_UNDECORATED
	window_hidden // C.FLAG_WINDOW_HIDDEN
	window_minimized // C.FLAG_WINDOW_MINIMIZED
	window_maximized // C.FLAG_WINDOW_MAXIMIZED
	window_unfocused // C.FLAG_WINDOW_UNFOCUSED
	window_topmost // C.FLAG_WINDOW_TOPMOST
	window_always_run // C.FLAG_WINDOW_ALWAYS_RUN
	window_transparent // C.FLAG_WINDOW_TRANSPARENT
	window_highdpi // C.FLAG_WINDOW_HIGHDPI
	msaa_4x_hint // C.FLAG_MSAA_4X_HINT
	interlaced_hint // C.FLAG_INTERLACED_HINT
}

pub fn (mut this ConfigFlags) parse(value int) ConfigFlags {
	if value & C.FLAG_VSYNC_HINT != 0 {
		this |= ConfigFlags.vsync_hint
	}
	if value & C.FLAG_FULLSCREEN_MODE != 0 {
		this |= ConfigFlags.fullscreen_mode
	}
	if value & C.FLAG_WINDOW_RESIZABLE != 0 {
		this |= ConfigFlags.window_resizable
	}
	if value & C.FLAG_WINDOW_UNDECORATED != 0 {
		this |= ConfigFlags.window_undecorated
	}
	if value & C.FLAG_WINDOW_HIDDEN != 0 {
		this |= ConfigFlags.window_hidden
	}
	if value & C.FLAG_WINDOW_MINIMIZED != 0 {
		this |= ConfigFlags.window_minimized
	}
	if value & C.FLAG_WINDOW_MAXIMIZED != 0 {
		this |= ConfigFlags.window_maximized
	}
	if value & C.FLAG_WINDOW_UNFOCUSED != 0 {
		this |= ConfigFlags.window_unfocused
	}
	if value & C.FLAG_WINDOW_TOPMOST != 0 {
		this |= ConfigFlags.window_topmost
	}
	if value & C.FLAG_WINDOW_ALWAYS_RUN != 0 {
		this |= ConfigFlags.window_always_run
	}
	if value & C.FLAG_WINDOW_TRANSPARENT != 0 {
		this |= ConfigFlags.window_transparent
	}
	if value & C.FLAG_WINDOW_HIGHDPI != 0 {
		this |= ConfigFlags.window_highdpi
	}
	if value & C.FLAG_MSAA_4X_HINT != 0 {
		this |= ConfigFlags.msaa_4x_hint
	}
	if value & C.FLAG_INTERLACED_HINT != 0 {
		this |= ConfigFlags.interlaced_hint
	}

	return this
}

pub fn (this ConfigFlags) value() int {
	mut res := 0

	if this == ConfigFlags.vsync_hint {
		res |= C.FLAG_VSYNC_HINT
	}
	if this == ConfigFlags.fullscreen_mode {
		res |= C.FLAG_FULLSCREEN_MODE
	}
	if this == ConfigFlags.window_resizable {
		res |= C.FLAG_WINDOW_RESIZABLE
	}
	if this == ConfigFlags.window_undecorated {
		res |= C.FLAG_WINDOW_UNDECORATED
	}
	if this == ConfigFlags.window_hidden {
		res |= C.FLAG_WINDOW_HIDDEN
	}
	if this == ConfigFlags.window_minimized {
		res |= C.FLAG_WINDOW_MINIMIZED
	}
	if this == ConfigFlags.window_maximized {
		res |= C.FLAG_WINDOW_MAXIMIZED
	}
	if this == ConfigFlags.window_unfocused {
		res |= C.FLAG_WINDOW_UNFOCUSED
	}
	if this == ConfigFlags.window_topmost {
		res |= C.FLAG_WINDOW_TOPMOST
	}
	if this == ConfigFlags.window_always_run {
		res |= C.FLAG_WINDOW_ALWAYS_RUN
	}
	if this == ConfigFlags.window_transparent {
		res |= C.FLAG_WINDOW_TRANSPARENT
	}
	if this == ConfigFlags.window_highdpi {
		res |= C.FLAG_WINDOW_HIGHDPI
	}
	if this == ConfigFlags.msaa_4x_hint {
		res |= C.FLAG_MSAA_4X_HINT
	}
	if this == ConfigFlags.interlaced_hint {
		res |= C.FLAG_INTERLACED_HINT
	}
	return res
}

fn C.InitWindow(width int, height int, title &char)
pub fn init(width int, height int, title string) {
	unsafe {
		C.InitWindow(width, height, &char(title.str))
	}
}

fn C.WindowShouldClose() bool
pub fn should_close() bool {
	return C.WindowShouldClose()
}

fn C.CloseWindow()
pub fn close() {
	C.CloseWindow()
}

fn C.IsWindowReady() bool
pub fn is_ready() bool {
	return C.IsWindowReady()
}

fn C.IsWindowFullscreen() bool
pub fn is_fullscreen() bool {
	return C.IsWindowFullscreen()
}

fn C.IsWindowHidden() bool
pub fn is_hidden() bool {
	return C.IsWindowHidden()
}

fn C.IsWindowMinimized() bool
pub fn is_minimized() bool {
	return C.IsWindowMinimized()
}

fn C.IsWindowMaximized() bool
pub fn is_maximized() bool {
	return C.IsWindowMaximized()
}

fn C.IsWindowFocused() bool
pub fn is_focused() bool {
	return C.IsWindowFocused()
}

fn C.IsWindowResized() bool
pub fn is_resized() bool {
	return C.IsWindowResized()
}

fn C.IsWindowState(flag u32) bool
pub fn is_state(config_flags ConfigFlags) bool {
	return C.IsWindowState(config_flags.value())
}

fn C.SetWindowState(flags u32)
pub fn set_state(config_flags ConfigFlags) {
	C.SetWindowState(config_flags.value())
}

fn C.ClearWindowState(flags u32)
pub fn clear_state(config_flags ConfigFlags) {
	C.ClearWindowState(config_flags.value())
}

fn C.ToggleFullscreen()
pub fn toggle_fullscreen() {
	C.ToggleFullscreen()
}

fn C.MaximizeWindow()
pub fn maximize() {
	C.MaximizeWindow()
}

fn C.MinimizeWindow()
pub fn minimize() {
	C.MinimizeWindow()
}

fn C.RestoreWindow()
pub fn restore() {
	C.RestoreWindow()
}

// TODO:
fn C.SetWindowIcon(image C.Image)

fn C.SetWindowTitle(title &char)
pub fn set_title(title string) {
	unsafe {
		C.SetWindowTitle(&char(title.str))
	}
}

fn C.SetWindowPosition(x int, y int)
pub fn set_position(x int, y int) {
	C.SetWindowPosition(x, y)
}

fn C.SetWindowMonitor(monitor int)
pub fn set_monitor(monitor int) {
	C.SetWindowMonitor(monitor)
}

fn C.SetWindowMinSize(width int, height int)
pub fn set_minimum_size(width int, height int) {
	C.SetWindowMinSize(width, height)
}

fn C.SetWindowSize(width int, height int)
pub fn set_size(width int, height int) {
	C.SetWindowSize(width, height)
}

fn C.SetWindowOpacity(opacity f32)
pub fn set_opacity(opacity f32) {
	C.SetWindowOpacity(opacity)
}

// TODO
fn C.GetWindowHandle() voidptr

fn C.GetScreenWidth() int
pub fn get_screen_width() int {
	return C.GetScreenWidth()
}

fn C.GetScreenHeight() int
pub fn get_screen_height() int {
	return C.GetScreenHeight()
}

pub fn get_screen_size() (int, int) {
	return C.GetScreenWidth, C.GetScreenHeight()
}

fn C.GetRenderWidth() int
pub fn get_render_width() int {
	return C.GetRenderWidth()
}

fn C.GetRenderHeight() int
pub fn get_render_height() int {
	return C.GetRenderHeight()
}

pub fn get_render_size() (int, int) {
	return C.GetRenderWidth(), C.GetRenderHeight()
}

fn C.GetWindowPosition() rl.Vector2
pub fn get_position() (int, int) {
	wp := C.GetWindowPosition()
	return wp.x, wp.y
}

fn C.GetWindowScaleDPI() rl.Vector2
pub fn get_scale_dpi() (int, int) {
	sdpi := C.GetWindowScaleDPI()
	return sdpi.x, sdpi.y 
}
