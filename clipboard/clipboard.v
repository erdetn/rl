// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module clipboard

import rl

fn C.SetClipboardText(text &char)
pub fn set_text(text string) {
	unsafe {
		C.SetClipboardText(&char(text.str))
	}
}

fn C.GetClipboardText() &char
pub fn get_text() string {
	return unsafe {
		cstring_to_vstring(C.GetClipboardText())
	}
}