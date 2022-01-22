// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module mouse

import rl

pub enum MouseButton {
	left = C.MOUSE_BUTTON_LEFT
	right = C.MOUSE_BUTTON_RIGHT
	middle = C.MOUSE_BUTTON_MIDDLE
	side = C.MOUSE_BUTTON_SIDE
	extra = C.MOUSE_BUTTON_EXTRA
	forward = C.MOUSE_BUTTON_FORWARD
	back = C.MOUSE_BUTTON_BACK
}

pub enum MouseCursor {
	@default = C.MOUSE_CURSOR_DEFAULT
	arrow = C.MOUSE_CURSOR_ARROW
	ibeam = C.MOUSE_CURSOR_IBEAM
	cross_hair = C.MOUSE_CURSOR_CROSSHAIR
	pointing_hand = C.MOUSE_CURSOR_POINTING_HAND
	resize_ew = C.MOUSE_CURSOR_RESIZE_EW
	resize_ns = C.MOUSE_CURSOR_RESIZE_NS
	resize_nwse = C.MOUSE_CURSOR_RESIZE_NWSE
	resize_nesw = C.MOUSE_CURSOR_RESIZE_NESW
	resize_all = C.MOUSE_CURSOR_RESIZE_ALL
	not_allowed = C.MOUSE_CURSOR_NOT_ALLOWED
}

fn C.IsMouseButtonPressed(button int) bool
pub fn is_button_pressed(mouse_button MouseButton) bool {
	return C.IsMouseButtonPressed(int(mouse_button))
}

fn C.IsMouseButtonDown(button int) bool
pub fn is_button_down(mouse_button MouseButton) bool {
	return C.IsMouseButtonDown(int(mouse_button))
}

fn C.IsMouseButtonReleased(button int) bool
pub fn is_button_released(mouse_button MouseButton) bool {
	return C.IsMouseButtonReleased(int(mouse_button))
}

fn C.IsMouseButtonUp(button int) bool
pub fn is_button_up(mouse_button MouseButton) bool {
	return C.IsMouseButtonUp(int(MouseButton))
}

fn C.GetMouseX() int
pub fn get_x() int {
	return C.GetMouseX()
}

fn C.GetMouseY() int
pub fn get_y() int {
	return C.GetMouseY()
}

fn C.GetMousePosition() C.Vector2
pub fn get_position() (int, int) {
	mp := C.GetMousePosition()
	return mp.x, mp.y
}

fn C.GetMouseDelta() C.Vector2
pub fn get_delta() (int, int) {
	delta := C.GetMouseDelta()
	return delta.x, delta.Y
}

fn C.SetMousePosition(x int, y int)
pub fn set_position(x int, y int) {
	C.SetMousePosition(x, y)
}

fn C.SetMouseOffset(offset_x int, offset_y int)
pub fn set_offset(offset_x int, offset_y int) {
	C.SetMouseOffset(offset_x, offset_y)
}

fn C.SetMouseScale(scale_x f32, scale_y f32)
pub fn set_scale(scale_x f32, scale_y f32) {
	C.SetMouseScale(scale_x, scale_y)
}

fn C.GetMouseWheelMove() f32
pub fn get_wheel_move() f32 {
	return C.GetMouseWheelMove()
}

fn C.SetMouseCursor(cursor int)
pub fn set_cursor(cursor MouseCursor) {
	C.SetMouseCursor(int(cursor))
}
