// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module draw

import rl
import rl.color
import rl.geometry

fn C.DrawPixelV(position C.Vector2, color C.Color)
fn C.DrawPixel(pos_x int, pos_y int, color C.Color)

pub struct Pixel {
pub mut:
	x     int
	y     int
	color color.Color
}

pub fn new_pixel(x int, y int, color color.Color) Pixel {
	return Pixel{
		x: x
		y: y
		color: color
	}
}

pub fn (this Pixel) draw() {
	C.DrawPixel(this.x, this.y, this.color)
}

fn C.DrawLine(start_pos_x int, start_pos_y int, end_pos_x int, end_pos_y int, color C.Color)
fn C.DrawLineV(start_pos C.Vector2, end_pos C.Vector2, color C.Color)
fn C.DrawLineEx(start_pos C.Vector2, end_pos C.Vector2, thick f32, color C.Color)

pub struct Line {
pub mut:
	start_point geometry.Vector2
	stop_point  geometry.Vector2
	thickness   f32
	color       color.Color
}

pub fn new_line(p1 geometry.Vector2, p2 geometry.Vector2, thick f32, color color.Color) Line {
	return Line{
		start_point: p1
		stop_point: p2
		thickness: thick
		color: color
	}
}

pub fn (this Line) draw() {
	C.DrawLineEx(this.start_point, this.stop_point, this.thickness, this.color)
}

fn C.DrawLineBezier(start_pos C.Vector2, end_pos C.Vector2, thick f32, color C.Color)
fn C.DrawLineBezierQuad(start_pos C.Vector2, end_pos C.Vector2, control_pos C.Vector2, thick f32, color C.Color)
fn C.DrawLineBezierCubic(start_pos C.Vector2, end_pos C.Vector2, start_control_pos C.Vector2, end_control_pos C.Vector2, thick f32, color C.Color)
fn C.DrawLineStrip(points &C.Vector2, point_count int, color C.Color)
fn C.DrawCircle(center_x int, center_y int, radius f32, color C.Color)
fn C.DrawCircleSector(center C.Vector2, radius f32, start_angle f32, end_angle f32, segments int, color C.Color)
fn C.DrawCircleSectorLines(center C.Vector2, radius f32, start_angle f32, end_angle f32, segments int, color C.Color)
fn C.DrawCircleGradient(center_x int, center_y int, radius f32, color1 C.Color, color2 C.Color)
fn C.DrawCircleV(center C.Vector2, radius f32, color C.Color)
fn C.DrawCircleLines(center_x int, center_y int, radius f32, color C.Color)
fn C.DrawEllipse(center_x int, center_y int, radius_h f32, radius_v f32, color C.Color)
fn C.DrawEllipseLines(center_x int, center_y int, radius_h f32, radius_v C.Color, color C.Color)
fn C.DrawRing(center C.Vector2, innter_radius f32, outer_radius f32, start_angle f32, end_angle f32, segments int, color C.Color)
fn C.DrawRingLines(center C.Vector2, innter_radius f32, outer_radius f32, start_angle f32, end_angle f32, segments int, color C.Color)
fn C.DrawRectangle(pos_x int, pos_y int, width int, height int, color C.Color)
fn C.DrawRectangleV(position C.Vector2, size C.Vector2, color C.Color)
fn C.DrawRectangleRec(rec C.Rectangle, color C.Color)
fn C.DrawRectanglePro(rec C.Rectangle, origin C.Vector2, rotation f32, color C.Color)
fn C.DrawRectangleGradientV(pos_x int, pos_y int, width int, height int, color1 C.Color, color2 C.Color)
fn C.DrawRectangleGradientH(pos_x int, pos_y int, width int, height int, color1 C.Color, color2 C.Color)
fn C.DrawRectangleGradientEx(rec C.Rectangle, col1 C.Color, col2 C.Color, col3 C.Color, col4 C.Color)
fn C.DrawRectangleLines(pos_x int, pos_y int, width int, height int, color C.Color)
fn C.DrawRectangleLinesEx(rec C.Rectangle, line_thick f32, color C.Color)
fn C.DrawRectangleRounded(rec C.Rectangle, roundness f32, segments int, color C.Color)
fn C.DrawRectangleRoundedLines(rec C.Rectangle, roundness f32, segments int, line_thick f32, color C.Color)
fn C.DrawTriangle(v1 C.Vecor2, v2 C.Vector2, v3 C.Vector2, color C.Color)
fn C.DrawTriangleLines(v1 C.Vecor2, v2 C.Vector2, v3 C.Vector2, color C.Color)
fn C.DrawTriangleFan(points &C.Vector2, point_count int, color C.Color)
fn C.DrawTriangleStrip(points &C.Vector2, point_count int, color C.Color)
fn C.DrawPoly(center C.Vector2, sides int, radius f32, rotation f32, color C.Color)
fn C.DrawPolyLines(center C.Vector2, sides int, radius f32, rotation f32, color C.Color)
fn C.DrawPolyLinesEx(center C.Vector2, sides int, radius f32, rotation f32, line_thick f32, color C.Color)

fn C.DrawLine3D(start_pos C.Vector3, end_pos C.Vector3, color C.Color)
fn C.DrawPoint3D(position C.Vector3, color C.Color)
fn C.DrawCircle3D(center C.Vector3, radius f32, rotation_axis C.Vector3, rotation_angle f32, color C.Color)
fn C.DrawTriangle3D(v1 C.Vector3, v2 C.Vector3, v3 C.Vector3, color C.Color)
fn C.DrawTriangleStrip3D(points &C.Vector3, point_count int, color C.Color)
fn C.DrawCube(position C.Vector3, width f32, height f32, length f32, color C.Color)
fn C.DrawCubeV(position C.Vector3, size C.Vector3, color C.Color)
fn C.DrawCubeWires(position C.Vector3, width f32, height f32, length f32, color C.Color)
fn C.DrawCubeWiresV(position C.Vector3, size C.Vector3, color C.Color)
fn C.DrawCubeTexture(texture C.Texture2D, position C.Vector3, width f32, height f32, length f32, color C.Color)
fn C.DrawCubeTextureRec(texture C.Texture2D, source C.Rectangle, position C.Vector3, width f32, height f32, length f32, color C.Color)
fn C.DrawSphere(center_pos C.Vector3, radius f32, color C.Color)
fn C.DrawSphereEx(center_pos C.Vector3, radius f32, rings int, slices int, color C.Color)
fn C.DrawSphereWires(center_pos C.Vector3, radius f32, rings int, slices int, color C.Color)
fn C.DrawCylinder(position C.Vector3, radius_top f32, radius_bottom f32, height f32, slices int, color C.Color)
fn C.DrawCylinderEx(start_pos C.Vector3, end_pos C.Vector3, start_radius f32, float endRadius, sides int, color C.Color)
fn C.DrawCylinderWires(position C.Vector3, radius_top f32, radius_bottom f32, height f32, slices int, color C.Color)
fn C.DrawCylinderWiresEx(start_pos C.Vector3, end_pos C.Vector3, start_radius f32, end_radius f32, sides int, color C.Color)
fn C.DrawPlane(center_pos C.Vector3, size C.Vector2, color C.Color)
fn C.DrawRay(ray C.Ray, color C.Color)
fn C.DrawGrid(slices int, spacing f32)
