// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

// Rectangle, 4 components
pub struct C.Rectangle {
pub mut:
    x      f32          // Rectangle top-left corner position x
    y      f32          // Rectangle top-left corner position y
    width  f32          // Rectangle width
    height f32          // Rectangle height
}
pub type Rectangle = C.Rectangle

pub fn rectangle(x f32, y f32, w f32, h f32) Rectangle {
    return Rectangle {
        x: x,
        y: y
        width: w,
        height: h
    }
}

fn C.CheckCollisionRecs(rec1 C.Rectangle, rec2 C.Rectangle) bool
pub fn (r Rectangle)is_colliding(rr Rectangle) bool {
    return C.CheckCollisionRecs(r, rr)
}

fn C.GetCollisionRec(rec1 C.Rectangle, rec2 C.Rectangle) C.Rectangle
pub fn (r Rectangle)collides(rr Rectangle) Rectangle {
    return C.GetCollisionRec(r, rr)
}

