// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

pub struct C.Vector3 {
pub mut:
    x f32
    y f32
    z f32
}
pub type Vector3 = C.Vector3

pub fn new_vector3(x f32, y f32, z f32) Vector3 {
    return Vector3 {
        x: x,
        y: y,
        z: z
    }
}

pub fn (v Vector3)str() string {
    return 'Vector3 {x: ${v.x}, y: ${v.y}, z: ${v.z}}'
}

pub fn (v Vector3)+(r Vector3) Vector3 {
    return Vector3 {
        x: v.x + r.x,
        y: v.y + r.y,
        z: v.z + r.z
    }
}

pub fn (v Vector3)-(r Vector3) Vector3 {
    return Vector3 {
        x: v.x - r.x,
        y: v.y - r.y,
        z: v.z - r.z
    }
}

