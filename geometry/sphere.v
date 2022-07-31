// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

pub struct Sphere {
pub mut:
    center Vector3
    radius f32
}

pub fn sphere(center Vector3, radius f32) Sphere {
    return Sphere {
        center: center
        radius: radius
    }
}

pub fn (s Sphere)is_colliding(rs Sphere) bool {
    return C.CheckCollisionSpheres(s.center, s.radius, rs.center, rs.radius)
}

pub fn (s Sphere)is_colliding_box(b Box) bool {
    return C.CheckCollisionBoxSphere(b, s.center, s.radius)
}

pub fn (s Sphere)str() string {
    return 'Sphere {center: ${s.center}, radius: ${s.radius}}'
}

