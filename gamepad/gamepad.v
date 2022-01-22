// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module gamepad

import rl

pub enum GamepadButton {
	unknown = C.GAMEPAD_BUTTON_UNKNOWN
	left_face_up = C.GAMEPAD_BUTTON_LEFT_FACE_UP
	left_face_right = C.GAMEPAD_BUTTON_LEFT_FACE_RIGHT
	left_face_down = C.GAMEPAD_BUTTON_LEFT_FACE_DOWN
	left_face_left = C.GAMEPAD_BUTTON_LEFT_FACE_LEFT
	right_face_up = C.GAMEPAD_BUTTON_RIGHT_FACE_UP
	right_face_right = C.GAMEPAD_BUTTON_RIGHT_FACE_RIGHT
	right_face_down = C.GAMEPAD_BUTTON_RIGHT_FACE_DOWN
	right_face_left = C.GAMEPAD_BUTTON_RIGHT_FACE_LEFT
	left_trigger_1 = C.GAMEPAD_BUTTON_LEFT_TRIGGER_1
	left_trigger_2 = C.GAMEPAD_BUTTON_LEFT_TRIGGER_2
	right_trigger_1 = C.GAMEPAD_BUTTON_RIGHT_TRIGGER_1
	right_trigger_2 = C.GAMEPAD_BUTTON_RIGHT_TRIGGER_2
	middle_left = C.GAMEPAD_BUTTON_MIDDLE_LEFT
	middle = C.GAMEPAD_BUTTON_MIDDLE
	middle_right = C.GAMEPAD_BUTTON_MIDDLE_RIGHT
	left_thumb = C.GAMEPAD_BUTTON_LEFT_THUMB
	right_thumb = C.GAMEPAD_BUTTON_RIGHT_THUMB
}

pub enum GamepadAxis {
	left_x = C.GAMEPAD_AXIS_LEFT_X
	left_y = C.GAMEPAD_AXIS_LEFT_Y
	right_x = C.GAMEPAD_AXIS_RIGHT_X
	right_y = C.GAMEPAD_AXIS_RIGHT_Y
	left_trigger = C.GAMEPAD_AXIS_LEFT_TRIGGER
	right_trigger = C.GAMEPAD_AXIS_RIGHT_TRIGGER
}

pub struct Gamepad {
	id int
}

pub fn new(id int) Gamepad {
	return Gamepad{
		id: id
	}
}

fn C.IsGamepadAvailable(gamepad int) bool
pub fn (this Gamepad) is_available() bool {
	return C.IsGamepadAvailable(this.id)
}

fn C.GetGamepadName(gamepad int) &char
pub fn (this Gamepad) name() string {
	return unsafe {
		cstring_to_vstring(C.GetGamepadName(this.id))
	}
}

pub fn (this Gamepad) id() int {
	return this.id
}

fn C.IsGamepadButtonPressed(gamepad int, button int) bool
pub fn (this Gamepad) is_button_pressed(button GamepadButton) bool {
	return C.IsGamepadButtonPressed(this.id, int(button))
}

fn C.IsGamepadButtonDown(gamepad int, button int) bool
pub fn (this Gamepad) is_button_down(button GamepadButton) bool {
	return C.IsGamepadButtonDown(this.id, int(button))
}

fn C.IsGamepadButtonReleased(gamepad int, button int) bool
pub fn (this Gamepad) is_button_released(button GamepadButton) bool {
	return C.IsGamepadButtonReleased(this.id, int(button))
}

fn C.IsGamepadButtonUp(gamepad int, button int) bool
pub fn (this Gamepad) is_button_up(button GamepadButton) bool {
	return C.IsGamepadButtonUp(this.id, int(button))
}

fn C.GetGamepadAxisCount(gamepad int) int
pub fn (this Gamepad) get_axis_count() int {
	return C.GetGamepadAxisCount(this.id)
}

fn C.GetGamepadAxisMovement(gamepad int, axis int) f32
pub fn (this Gamepad) get_axis_movement(axis GamepadAxis) f32 {
	return C.GetGamepadAxisMovement(this.id, int(axis))
}

fn C.GetGamepadButtonPressed() int
pub fn get_button_pressed() int {
	return C.GetGamepadButtonPressed()
}

fn C.SetGamepadMappings(mappings &char) int
pub fn set_mappings(mappings string) int {
	return unsafe {
		C.SetGamepadMappings(&char(mappings.str))
	}
}
