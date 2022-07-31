// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module mesh

import rl
import rl.geometry

// Mesh, vertex data and vao/vbo
struct C.Mesh {
	vertexCount   int // Number of vertices stored in arrays
	triangleCount int // Number of triangles stored (indexed or not)
	// Vertex attributes data
	vertices   &f32 // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
	texcoords  &f32 // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
	texcoords2 &f32 // Vertex second texture coordinates (useful for lightmaps) (shader-location = 5)
	normals    &f32 // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
	tangents   &f32 // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
	colors     &u8  // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
	indices    &u16 // Vertex indices (in case vertex data comes indexed)
	// Animation vertex data
	animVertices &f32 // Animated vertex positions (after bones transformations)
	animNormals  &f32 // Animated normals (after bones transformations)
	boneIds      &u8  // Vertex bone ids, max 255 bone ids, up to 4 bones influence by vertex (skinning)
	boneWeights  &f32 // Vertex bone weight, up to 4 bones influence by vertex (skinning)
	// OpenGL identifiers
	vaoId u32  // OpenGL Vertex Array Object id
	vboId &u32 // OpenGL Vertex Buffer Objects id (default vertex data)
}

pub type Mesh = C.Mesh

// Mesh management functions
fn C.UploadMesh(mesh &C.Mesh, dynamic bool) // Upload mesh vertex data in GPU and provide VAO/VBO ids
fn C.UpdateMeshBuffer(mesh C.Mesh, index int, data voidptr, data_size int, offset int) // Update mesh vertex data in GPU for a specific buffer index
fn C.UnloadMesh(mesh C.Mesh) // Unload mesh data from CPU and GPU
fn C.DrawMesh(mesh C.Mesh, material C.Material, transform C.Matrix) // Draw a 3d mesh with material and transform
fn C.DrawMeshInstanced(mesh C.Mesh, material C.Material, transforms &C.Matrix, instances int) // Draw multiple mesh instances with material and different transforms
fn C.ExportMesh(mesh C.Mesh, filename &char) bool // Export mesh data to file, returns true on success
fn C.GetMeshBoundingBox(mesh C.Mesh) C.BoundingBox // Compute mesh bounding box limits
fn C.GenMeshTangents(mesh &C.Mesh) // Compute mesh tangents
fn C.GenMeshBinormals(mesh &C.Mesh) // Compute mesh binormals

// Mesh generation functions
fn C.GenMeshPoly(sides int, radius f32) C.Mesh // Generate polygonal mesh
fn C.GenMeshPlane(width f32, length f32, resx int, resz int) C.Mesh // Generate plane mesh (with subdivisions)
fn C.GenMeshCube(width f32, height f32, length f32) C.Mesh // Generate cuboid mesh
fn C.GenMeshSphere(radius f32, rings int, slices int) C.Mesh // Generate sphere mesh (standard sphere)
fn C.GenMeshHemiSphere(radius f32, rings int, slices int) C.Mesh // Generate half-sphere mesh (no bottom cap)
fn C.GenMeshCylinder(radius f32, height f32, slices int) C.Mesh // Generate cylinder mesh
fn C.GenMeshCone(radius f32, height f32, slices int) C.Mesh // Generate cone/pyramid mesh
fn C.GenMeshTorus(radius f32, size f32, rad_seg int, sides int) C.Mesh // Generate torus mesh
fn C.GenMeshKnot(radius f32, size f32, rad_seg int, sides int) C.Mesh // Generate trefoil knot mesh
fn C.GenMeshHeightmap(heightmap C.Image, size C.Vector3) C.Mesh // Generate heightmap mesh from image data
fn C.GenMeshCubicmap(cubicmap C.Image, cube_size C.Vector3) C.Mesh // Generate cubes-based map mesh from image data
