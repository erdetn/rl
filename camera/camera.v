// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module camera

import rl
import rl.geometry

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

pub fn new(position geometry.Vector3, target geometry.Vector3, up geometry.Vector3, fovy f32, projection CameraProjection) Camera {
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

pub type Camera2D = C.Camera2D

fn C.SetCameraMode(camera C.Camera3D, mode int)
pub fn (this Camera)set_mode(mode CameraMode) {
    C.SetCameraMode(this, int(mode))
}

fn C.UpdateCamera(camera &C.Camera3D)
pub fn (this &Camera)update() {
    C.UpdateCamera(this)
}

fn C.SetCameraPanControl(key_pan int)
fn C.SetCameraAltControl(key_alt int)
fn C.SetCameraSmoothZoomControl(key_smooth_zoom int)
fn C.SetCameraMoveControls(key_front int, key_back int, key_right int, key_left int, key_up int, key_down int)

fn C.GetMouseRay(mousePosition C.Vector2, camera C.Camera) C.Ray
fn C.GetCameraMatrix(camera C.Camera) C.Matrix
fn C.GetCameraMatrix2D(camera C.Camera2D) C.Matrix
fn C.GetWorldToScreen(position C.Vector3, camera C.Camera) C.Vector2
fn C.GetWorldToScreenEx(position C.Vector3, camera C.Camera, width int, height int) C.Vector2
fn C.GetWorldToScreen2D(position C.Vector2, camera C.Camera2D) C.Vector2
fn C.GetScreenToWorld2D(position C.Vector2, camera C.Camera2D) C.Vector2

fn C.BeginMode2D(camera C.Camera2D)
pub fn (this Camera2D)begin() {
	C.BeginMode2D(this)
}

fn C.EndMode2D()
pub fn (this Camera2D)end() {
	C.EndMode2D()
}

fn C.BeginMode3D(camera C.Camera3D)
pub fn (this Camera)begin() {
	C.BeginMode3D(this)
}

fn C.EndMode3D()
pub fn (this Camera)end() {
	C.EndMode3D()
}

