// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module cursor

import rl

fn C.ShowCursor()
pub fn show() {
	C.ShowCursor()
}

fn C.HideCursor()
pub fn hide() {
	C.HideCursor()
}

fn C.IsCursorHidden() bool
pub fn is_hidden() bool {
	return C.IsCursorHidden()
}

fn C.EnableCursor()
pub fn enable() {
	C.EnableCursor()
}

fn C.DisableCursor()
pub fn disable() {
	C.DisableCursor()
}

fn C.IsCursorOnScreen() bool
pub fn is_on_screen() bool {
	return C.IsCursorOnScreen()
}
