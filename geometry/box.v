// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

// BoundingBox
pub struct C.BoundingBox {
pub mut:
    max  Vector3
    min  Vector3
} 
pub type Box = C.BoundingBox

pub fn box(max Vector3, min Vector3) Box {
    return Box {
        max: max
        min: min
    }
}

fn C.CheckCollisionBoxes(box1 C.BoundingBox, box2 C.BoundingBox) bool
fn C.CheckCollisionSpheres(center1 C.Vector3, radius1 f32, center2 C.Vector3, radius2 f32) bool
fn C.CheckCollisionBoxSphere(box C.BoundingBox, center C.Vector3, radius f32) bool 

pub fn (b Box)is_colliding(rb Box) bool {
    return C.CheckCollisionBoxes(b, rb)
}

pub fn (b Box)is_colliding_sphere(s Sphere) bool {
    return C.CheckCollisionBoxSphere(b, s.center, s.radius)
}

pub fn (b Box)str() string {
    return 'Box {max: ${b.max}, min: ${b.min}}'
}

