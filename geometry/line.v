// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module geometry

pub struct Line2D {
pub mut:
    from Vector2
    to Vector2
}

pub fn line2d(from Vector2, to Vector2) Line2D {
    return Line2D {
        from: from,
        to: to
    }
}

pub fn (l Line2D)str() string {
    return 'Line {from: ${l.from}, to: ${l.to}}'
}


fn C.CheckCollisionLines(start_pos1 C.Vector2, end_pos1 C.Vector2, start_pos2 C.Vector2, end_pos2 C.Vector2, collision_point &C.Vector2) bool
pub fn (l Line2D)collides(r Line2D) (bool, Vector2) {
    cp := Vector2{0, 0}
    mut is_colliding := false
    
    unsafe {
        is_colliding = C.CheckCollisionLines(l.from, l.to, r.from, r.to, &cp)
    }
    if is_colliding {
        return false, Vector2{0, 0}
    }
    return true, cp
}

fn C.CheckCollisionPointLine(point C.Vector2, from C.Vector2, to C.Vector2, threshold int) bool
pub fn (l Line2D)is_colliding_point(p Vector2, threshold int) bool {
    return C.CheckCollisionPointLine(p, l.from, l.to, threshold)
}

