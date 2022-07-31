// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module camera

import rl
import rl.geometry
import rl.keyboard

pub enum CameraMode {
	custom = C.CAMERA_CUSTOM
	free = C.CAMERA_FREE
	orbital = C.CAMERA_ORBITAL
	first_person = C.CAMERA_FIRST_PERSON
	third_person = C.CAMERA_THIRD_PERSON
}

pub enum CameraProjection {
	perspective = C.CAMERA_PERSPECTIVE
	orthographic = C.CAMERA_ORTHOGRAPHIC
}

pub struct C.Camera3D {
	position   C.Vector3
	target     C.Vector3
	up         C.Vector3
	fovy       f32
	projection int
}

pub type Camera3D = C.Camera3D
pub type Camera = C.Camera3D

pub fn new(position geometry.Vector3, target geometry.Vector3, 
           up geometry.Vector3, fovy f32, 
           projection CameraProjection) Camera {
	return Camera{
		position: position
		target: target
		up: up
		fovy: fovy
		projection: int(projection)
	}
}

pub struct C.Camera2D {
	offset   C.Vector2
	target   C.Vector2
	rotation f32
	zoom     f32
}

pub fn new2d(offset geometry.Vector2, target geometry.Vector2,
             rotation f32, zoom f32) Camera2D {
    return Camera2D {
        offset: offset
        target: target
        rotation: rotation
        zoom: zoom
    }
}

pub type Camera2D = C.Camera2D

fn C.SetCameraMode(camera C.Camera3D, mode int)
pub fn (me Camera)set_mode(mode CameraMode) {
    C.SetCameraMode(me, int(mode))
}

fn C.UpdateCamera(camera &C.Camera3D)
pub fn (c &Camera)update() {
    C.UpdateCamera(c)
}

fn C.SetCameraPanControl(key_pan int)
pub fn (c Camera)set_pan_key(key_pan keyboard.KeyboardKey) {
    C.SetCameraPanControl(int(key_pan))
}

fn C.SetCameraAltControl(key_alt int)
pub fn (c Camera)set_alt_key(key_alt keyboard.KeyboardKey) {
    C.SetCameraAltControl(int(key_alt))
}

fn C.SetCameraSmoothZoomControl(key_smooth_zoom int)
pub fn (c Camera)set_smooth_zoom_key(key_smooth_zoom keyboard.KeyboardKey) {
    C.SetCameraSmoothZoomControl(int(key_smooth_zoom))
}

pub struct CameraMoveControls {
pub mut:
    front keyboard.KeyboardKey
    back  keyboard.KeyboardKey
    right keyboard.KeyboardKey
    left  keyboard.KeyboardKey
    up    keyboard.KeyboardKey
    down  keyboard.KeyboardKey
}

fn C.SetCameraMoveControls(key_front int, key_back int, key_right int, key_left int, key_up int, key_down int)
pub fn (c Camera)set_move_controls(control_keys CameraMoveControls) {
    C.SetCameraMoveControls(
        int(control_keys.front),
        int(control_keys.back),
        int(control_keys.right),
        int(control_keys.left),
        int(control_keys.up),
        int(control_keys.down)
    )
}

fn C.GetMouseRay(mousePosition C.Vector2, camera C.Camera3D) C.Ray
pub fn (c Camera)get_mouse_ray(mouse_position geometry.Vector2) geometry.Ray {
    return C.GetMouseRay(mouse_position, c)
}

fn C.GetCameraMatrix(camera C.Camera3D) C.Matrix
pub fn (c Camera)get_matrix() geometry.Matrix {
    return geometry.Matrix(C.GetCameraMatrix(c))
}

fn C.GetCameraMatrix2D(camera C.Camera2D) C.Matrix
pub fn (c Camera2D)get_matrix_2d() geometry.Matrix {
    return geometry.Matrix(C.GetCameraMatrix2D(c))
}

fn C.GetWorldToScreen(position C.Vector3, camera C.Camera3D) C.Vector2
pub fn (c Camera)get_world_to_screen(position geometry.Vector3)
geometry.Vector2 {
    return geometry.Vector2(C.GetWorldToScreen(position, c))
}

fn C.GetWorldToScreenEx(position C.Vector3, camera C.Camera3D, width int, height int) C.Vector2
pub fn (c Camera)get_world_to_screen_ex(position geometry.Vector3, width int,
height int) geometry.Vector2 {
    return geometry.Vector2(C.GetWorldToScreenEx(position, c, width, height))
}

fn C.GetWorldToScreen2D(position C.Vector2, camera C.Camera2D) C.Vector2
pub fn (me Camera2D)get_world_to_screen2d(position geometry.Vector2)
geometry.Vector2 {
    return geometry.Vector2(C.GetWorldToScreen2D(position, me))
}

fn C.GetScreenToWorld2D(position C.Vector2, camera C.Camera2D) C.Vector2
pub fn (me Camera2D)get_screen_to_world2d(position geometry.Vector2)
geometry.Vector2 {
    return geometry.Vector2(C.GetScreenToWorld2D(position, me))
}


fn C.BeginMode2D(camera C.Camera2D)
pub fn (me Camera2D)begin() {
	C.BeginMode2D(me)
}

fn C.EndMode2D()
pub fn (me Camera2D)end() {
	C.EndMode2D()
}

fn C.BeginMode3D(camera C.Camera3D)
pub fn (me Camera)begin() {
	C.BeginMode3D(me)
}

fn C.EndMode3D()
pub fn (me Camera)end() {
	C.EndMode3D()
}

