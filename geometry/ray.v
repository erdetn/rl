module geometry

// RayCollision, ray hit information
pub struct C.RayCollision {
	hit      bool      // Did the ray hit something?
	distance f32       // Distance to nearest hit
	point    C.Vector3 // Point of nearest hit
	normal   C.Vector3 // Surface normal of hit
}

pub type RayCollision = C.RayCollision

pub fn ray_collision(hit bool, distance f32, point Vector3, normal Vector3) RayCollision {
    return RayCollision {
        hit: hit,
        distance: distance,
        point: point,
        normal: normal
    }
}

pub fn (rc RayCollision)str() string {
    mut s := 'RayCollision {\n'
    s += '\thit: ${rc.hit}\n'
    s += '\tdistance: ${rc.distance}\n'
    s += '\tpoint: ${rc.point}\n'
    s += '\tnormal: ${rc.normal}\n}'
    return s
}

// Ray, ray for raycasting
pub struct C.Ray {
	position  C.Vector3 // Ray position (origin)
	direction C.Vector3 // Ray direction
}

pub type Ray = C.Ray

pub fn ray(position Vector3, direction Vector3) Ray {
    return Ray {
        position: position,
        direction: direction
    }
}

// TODO
fn C.GetRayCollisionSphere(ray C.Ray, center C.Vector3, radius f32) C.RayCollision
fn C.GetRayCollisionBox(ray C.Ray, box C.BoundingBox) C.RayCollision
fn C.GetRayCollisionTriangle(ray C.Ray, p1 C.Vector3, p2 C.Vector3, p3 C.Vector3) C.RayCollision
fn C.GetRayCollisionQuad(ray C.Ray, p1 C.Vector3, p2 C.Vector3, p3 C.Vector3, p4 C.Vector3) C.RayCollision
fn C.GetRayCollisionModel(ray C.Ray, model C.Model) C.RayCollision
fn C.GetRayCollisionMesh(ray C.Ray, mesh C.Mesh, transform C.Matrix) C.RayCollision

