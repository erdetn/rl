// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module gesture

import rl

[flag]
pub enum Gesture {
	@none // C.GESTURE_NONE
	tap // C.GESTURE_TAP
	double_tap // C.GESTURE_DOUBLETAP
	hold // C.GESTURE_HOLD
	drag // C.GESTURE_DRAG
	swipe_right // C.GESTURE_SWIPE_RIGHT
	swipe_left // C.GESTURE_SWIPE_LEFT
	swipe_up // C.GESTURE_SWIPE_UP
	swipe_down // C.GESTURE_SWIPE_DOWN
	pinch_in // C.GESTURE_PINCH_IN
	pinch_out // C.GESTURE_PINCH_OUT
}

pub fn (mut this Gesture) parse(flags u32) Gesture {
	this = Gesture.@none

	if flags & C.GESTURE_TAP == C.GESTURE_TAP {
		this |= Gesture.tap
	}
	if flags & C.GESTURE_DOUBLETAP == C.GESTURE_DOUBLETAP {
		this |= Gesture.double_tap
	}
	if flags & C.GESTURE_HOLD == C.GESTURE_HOLD {
		this |= Gesture.hold
	}
	if flags & C.GESTURE_DRAG == C.GESTURE_DRAG {
		this |= Gesture.drag
	}
	if flags & C.GESTURE_SWIPE_RIGHT == C.GESTURE_SWIPE_RIGHT {
		this |= Gesture.swipe_right
	}
	if flags & C.GESTURE_SWIPE_LEFT == C.GESTURE_SWIPE_LEFT {
		this |= Gesture.swipe_left
	}
	if flags & C.GESTURE_SWIPE_UP == C.GESTURE_SWIPE_UP {
		this |= Gesture.swipe_up
	}
	if flags & C.GESTURE_SWIPE_DOWN == C.GESTURE_SWIPE_DOWN {
		this |= Gesture.swipe_down
	}
	if flags & C.GESTURE_PINCH_IN == C.GESTURE_PINCH_IN {
		this |= Gesture.pinch_in
	}
	if flags & C.GESTURE_PINCH_OUT == C.GESTURE_PINCH_OUT {
		this |= Gesture.pinch_out
	}
	return this
}

pub fn (this Gesture) value() u32 {
	mut rc := 0

	if this.has(.@none) {
		rc |= C.GESTURE_NONE
	}
	if this.has(.tap) {
		rc |= C.GESTURE_TAP
	}
	if this.has(.double_tap) {
		rc |= C.GESTURE_DOUBLETAP
	}
	if this.has(.hold) {
		rc |= C.GESTURE_HOLD
	}
	if this.has(.drag) {
		rc |= C.GESTURE_DRAG
	}
	if this.has(.swipe_right) {
		rc |= C.GESTURE_SWIPE_RIGHT
	}
	if this.has(.swipe_left) {
		rc |= C.GESTURE_SWIPE_LEFT
	}
	if this.has(.swipe_up) {
		rc |= C.GESTURE_SWIPE_UP
	}
	if this.has(.swipe_down) {
		rc |= C.GESTURE_SWIPE_DOWN
	}
	if this.has(.pinch_in) {
		rc |= C.GESTURE_PINCH_IN
	}
	if this.has(.pinch_out) {
		rc |= C.GESTURE_PINCH_OUT
	}
	return rc
}

fn C.SetGesturesEnabled(flags u32)
pub fn enable(gesture Gesture) {
	C.SetGesturesEnabled(gesture.value())
}

fn C.IsGestureDetected(gesture int) bool
pub fn is_detected(gesture Gesture) bool {
	return C.IsGestureDetected(int(gesture.value()))
}

fn C.GetGestureDetected() int
pub fn get_detected() Gesture {
	mut rc := Gesture.@none
	return rc.parse(u32(C.GetGestureDetected()))
}

fn C.GetGestureHoldDuration() f32
pub fn get_hold_duration() f32 {
	return C.GetGestureHoldDuration()
}

fn C.GetGestureDragVector() C.Vector2
pub fn get_drag_point() rl.Vector2 {
	return rl.Vector2(C.GetGestureDragVector())
}

fn C.GetGestureDragAngle() f32
pub fn get_drag_angle() f32 {
	return C.GetGestureDragAngle()
}

fn C.GetGesturePinchVector() C.Vector2
pub fn get_pinch_vector() rl.Vector2 {
	return rl.Vector2(C.GetGesturePinchVector())
}

fn C.GetGesturePinchAngle() f32
pub fn get_pinch_angle() f32 {
	return C.GetGesturePinchAngle()
}
