// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

pub struct C.Vector2 {
pub mut:
    x f32
    y f32
}
pub type Vector2 = C.Vector2

pub fn vector2(x f32, y f32) Vector2 {
    return Vector2 {
        x: x,
        y: y
    }
}

pub fn (v Vector2)str() string {
    return 'Vector2 {x: ${v.x}, y: ${v.y}}'
}

pub fn (v Vector2)+(r Vector2) Vector2 {
    return Vector2{v.x + r.x, v.y + r.y}
}

pub fn (v Vector2)-(r Vector2) Vector2 {
    return Vector2{v.x - r.x, v.y - r.y}
}

fn C.CheckCollisionPointRec(point C.Vector2, rec C.Rectangle) bool 
pub fn (v Vector2)is_colliding_rectangle(r Rectangle) bool {
    return C.CheckCollisionPointRec(v, r)
}

fn C.CheckCollisionPointTriangle(point C.Vector2, p1 C.Vector2, p2 C.Vector2, p3 C.Vector2) bool
pub fn (p Vector2)is_colliding_triangle(p1 Vector2, p2 Vector2, p3 Vector2) bool {
    return C.CheckCollisionPointTriangle(p, p1, p2, p3)
}

