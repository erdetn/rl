// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module touch

import rl

fn C.GetTouchX() int
pub fn get_x() int {
	return C.GetTouchX()
}

fn C.GetTouchY() int
pub fn get_y() int {
	return C.GetTouchY()
}

fn C.GetTouchPosition(index int) C.Vector2
pub fn get_position(index int) rl.Vector2 {
	return C.GetTouchPosition(index)
}

fn C.GetTouchPointId(index int) int
pub fn get_point_id(index int) int {
	return C.GetTouchPointId(index)
}

fn C.GetTouchPointCount() int
pub fn get_point_count() int {
	return C.GetTouchPointCount()
}
