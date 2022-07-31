// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

// Matrix, 4x4 components, column major, OpenGL style, right handed
pub struct C.Matrix {
pub mut:
    m0  f32 
    m4  f32 
    m8  f32
    m12 f32  // Matrix first row (4 components)
    
    m1  f32 
    m5  f32 
    m9  f32 
    m13 f32  // Matrix second row (4 components)
    
    m2  f32 
    m6  f32 
    m10 f32 
    m14 f32  // Matrix third row (4 components)
    
    m3  f32 
    m7  f32 
    m11 f32 
    m15 f32  // Matrix fourth row (4 components)
}
pub type Matrix = C.Matrix

pub fn matrix(m [4][4]f32) Matrix {
    return Matrix {
        m0: m[0][0]
        m4: m[0][1]
        m8: m[0][2]
        m12: m[0][3]

        m1: m[1][0]
        m5: m[1][1]
        m9: m[1][2]
        m13: m[1][3]

        m2: m[2][0]
        m6: m[2][1]
        m10: m[2][2]
        m14: m[2][3]

        m3: m[3][0]
        m7: m[3][1]
        m11: m[3][2]
        m15: m[3][3]
    }
}

