// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

pub struct Circle {
pub mut:
    radius f32 
    center Vector2
}

pub fn circle(radius f32, center Vector2) Circle {
    return Circle {
        radius: radius,
        center: center
    }
}

pub fn (c Circle)str() string {
    return 'Circle: {radius: ${c.radius}, center: ${c.center}}'
}

fn C.CheckCollisionCircles(center1 C.Vector2, radius1 f32, center2 C.Vector2, radius2 f32) bool
pub fn (c Circle)is_colliding(r Circle) bool {
    return C.CheckCollisionCircles(c.center, c.radius, r.center, r.radius)
}

fn C.CheckCollisionCircleRec(center C.Vector2, radius f32, rec C.Rectangle) bool
pub fn (c Circle)is_colliding_rectangle(r Rectangle) bool {
    return C.CheckCollisionCircleRec(c.center, c.radius, r)
}

fn C.CheckCollisionPointCircle(point C.Vector2, center C.Vector2, radius f32) bool
pub fn (c Circle)is_colliding_point(p Vector2) bool {
    return C.CheckCollisionPointCircle(p, c.center, c.radius)
}

