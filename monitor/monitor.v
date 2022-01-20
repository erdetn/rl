// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module monitor

import rl

pub struct Monitor {
mut:
	id int
}

pub fn new(id int) Monitor {
	return Monitor {
		id: id
	}
}

fn C.GetMonitorCount() int
pub fn get_count() int {
	return C.GetMonitorCount()
}

fn C.GetCurrentMonitor() int
pub fn current() Monitor {
	return Monitor {
		id: C.GetCurrentMonitor()
	}
}

fn C.GetMonitorPosition(monitor int) rl.Vector2
pub fn (this Monitor)position() (int, int) {
	vp := C.GetMonitorPosition(this.id)
	return vp.x, vp.Y
}

fn C.GetMonitorWidth(monitor int) int
pub fn (this Monitor)width() int {
	return C.GetMonitorWidth(this.id)
}

fn C.GetMonitorHeight(monitor int) int
pub fn (this Monitor)height() int {
	return C.GetMonitorHeight(this.id)
}

fn C.GetMonitorPhysicalWidth(monitor int) int
pub fn (this Monitor)physical_width() int {
	return C.GetMonitorPhysicalWidth(this.id)
}

fn C.GetMonitorPhysicalHeight(monitor int) int
pub fn (this Monitor)physical_height() int {
	return C.GetMonitorPhysicalHeight(this.id)
}

fn C.GetMonitorRefreshRate(monitor int) int
pub fn (this Monitor)refresh_rate() int {
	return C.GetMonitorRefreshRate(this.id)
}

fn C.GetMonitorName(monitor int) &char
pub fn (this Monitor)name() string {
	return unsafe {
		cstring_to_vstring(C.GetMonitorName(this.id))
	}
}
