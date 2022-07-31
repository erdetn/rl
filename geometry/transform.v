// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

// Transform, vectex transformation data
pub struct C.Transform {
pub mut:
    translation C.Vector3    // Translation
    rotation C.Vector4
    scale C.Vector3          // Scale
} 
pub type Transform = C.Transform

