// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module keyboard

import rl

pub enum KeyboardKey {
	null = C.KEY_NULL
	apostrophe = C.KEY_APOSTROPHE
	comma = C.KEY_COMMA
	minus = C.KEY_MINUS
	period = C.KEY_PERIOD
	slash = C.KEY_SLASH
	zero = C.KEY_ZERO
	one = C.KEY_ONE
	two = C.KEY_TWO
	three = C.KEY_THREE
	four = C.KEY_FOUR
	five = C.KEY_FIVE
	six = C.KEY_SIX
	seven = C.KEY_SEVEN
	eight = C.KEY_EIGHT
	nine = C.KEY_NINE
	semicolon = C.KEY_SEMICOLON
	equal = C.KEY_EQUAL
	a = C.KEY_A
	b = C.KEY_B
	c = C.KEY_C
	d = C.KEY_D
	e = C.KEY_E
	f = C.KEY_F
	g = C.KEY_G
	h = C.KEY_H
	i = C.KEY_I
	j = C.KEY_J
	k = C.KEY_K
	l = C.KEY_L
	m = C.KEY_M
	n = C.KEY_N
	o = C.KEY_O
	p = C.KEY_P
	q = C.KEY_Q
	r = C.KEY_R
	s = C.KEY_S
	t = C.KEY_T
	u = C.KEY_U
	v = C.KEY_V
	w = C.KEY_W
	x = C.KEY_X
	y = C.KEY_Y
	z = C.KEY_Z
	left_bracket = C.KEY_LEFT_BRACKET
	backslash = C.KEY_BACKSLASH
	right_bracket = C.KEY_RIGHT_BRACKET
	grave = C.KEY_GRAVE
	space = C.KEY_SPACE
	escape = C.KEY_ESCAPE
	enter = C.KEY_ENTER
	tab = C.KEY_TAB
	backspace = C.KEY_BACKSPACE
	insert = C.KEY_INSERT
	delete = C.KEY_DELETE
	right = C.KEY_RIGHT
	left = C.KEY_LEFT
	down = C.KEY_DOWN
	up = C.KEY_UP
	page_up = C.KEY_PAGE_UP
	page_down = C.KEY_PAGE_DOWN
	home = C.KEY_HOME
	end = C.KEY_END
	caps_lock = C.KEY_CAPS_LOCK
	scroll_lock = C.KEY_SCROLL_LOCK
	num_clock = C.KEY_NUM_LOCK
	print_screen = C.KEY_PRINT_SCREEN
	pause = C.KEY_PAUSE
	f1 = C.KEY_F1
	f2 = C.KEY_F2
	f3 = C.KEY_F3
	f4 = C.KEY_F4
	f5 = C.KEY_F5
	f6 = C.KEY_F6
	f7 = C.KEY_F7
	f8 = C.KEY_F8
	f9 = C.KEY_F9
	f10 = C.KEY_F10
	f11 = C.KEY_F11
	f12 = C.KEY_F12
	left_shift = C.KEY_LEFT_SHIFT
	left_control = C.KEY_LEFT_CONTROL
	left_alt = C.KEY_LEFT_ALT
	left_super = C.KEY_LEFT_SUPER
	right_shift = C.KEY_RIGHT_SHIFT
	right_control = C.KEY_RIGHT_CONTROL
	right_alt = C.KEY_RIGHT_ALT
	right_super = C.KEY_RIGHT_SUPER
	kb_menu = C.KEY_KB_MENU
	kp_0 = C.KEY_KP_0
	kp_1 = C.KEY_KP_1
	kp_2 = C.KEY_KP_2
	kp_3 = C.KEY_KP_3
	kp_4 = C.KEY_KP_4
	kp_5 = C.KEY_KP_5
	kp_6 = C.KEY_KP_6
	kp_7 = C.KEY_KP_7
	kp_8 = C.KEY_KP_8
	kp_9 = C.KEY_KP_9
	kp_decimal = C.KEY_KP_DECIMAL
	kp_divide = C.KEY_KP_DIVIDE
	kp_multiply = C.KEY_KP_MULTIPLY
	kp_subtract = C.KEY_KP_SUBTRACT
	kp_add = C.KEY_KP_ADD
	kp_enter = C.KEY_KP_ENTER
	kp_equal = C.KEY_KP_EQUAL
	// Android key buttons //
	back = C.KEY_BACK
	menu = C.KEY_MENU
	volume_up = C.KEY_VOLUME_UP
	volume_down = C.KEY_VOLUME_DOWN
}

fn C.IsKeyPressed(key int) bool
pub fn is_pressed(key KeyboardKey) bool {
	return C.IsKeyPressed(int(key))
}

fn C.IsKeyDown(key int) bool
pub fn is_down(key KeyboardKey) bool {
	return C.IsKeyDown(int(key))
}

fn C.IsKeyReleased(key int) bool
pub fn is_released(key KeyboardKey) bool {
	return C.IsKeyReleased(int(key))
}

fn C.IsKeyUp(key int) bool
pub fn is_up(key KeyboardKey) bool {
	return C.IsKeyUp(int(key))
}

fn C.SetExitKey(key int)
pub fn set_exit_key(key KeyboardKey) {
	C.SetExitKey(int(key))
}

fn C.GetKeyPressed() int
pub fn get_key_pressed() KeyboardKey {
	return KeyboardKey(C.GetKeyPressed())
}

fn C.GetCharPressed() int
pub fn get_chat_pressed() KeyboardKey {
	return KeyboardKey(C.GetCharPressed())
}
