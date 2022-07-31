// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

pub struct C.Vector4 {
pub mut:
    x f32
    y f32
    z f32
    w f32
}
pub type Vector4 = C.Vector4
pub type Quaternion = C.Vector4

pub fn vector4(x f32, y f32, z f32, w f32) Vector4 {
    return Vector4 {
        x: x,
        y: y,
        z: z,
        w: w
    }
}

pub fn (v Vector4)str() string {
    return 'Vector4 {x: ${v.x}, y: ${v.y}, z: ${v.z}, w: ${v.w}}'
}

pub fn (v Vector4)+(r Vector4) Vector4 {
    return Vector4 {
        x: v.x + r.x,
        y: v.y + r.y,
        z: v.z + r.z,
        w: v.w + r.w
    }
}

pub fn (v Vector4)-(r Vector4) Vector4 {
    return Vector4 {
        x: v.x - r.x,
        y: v.y - r.y,
        z: v.z - r.z,
        w: v.w - r.w
    }
}

