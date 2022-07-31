// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module model

import rl
import rl.color
import rl.geometry

// Model, meshes, materials and animation data
struct C.Model {
	transform C.Matrix // Local transform matrix

	meshCount     int         // Number of meshes
	materialCount int         // Number of materials
	meshes        &C.Mesh     // Meshes array
	materials     &C.Material // Materials array
	meshMaterial  &int        // Mesh material number
	// Animation data
	boneCount int // Number of bones
	bones     &C.BoneInfo  // Bones information (skeleton)
	bindPose  &C.Transform // Bones base transformation (pose)
}

// ModelAnimation
struct C.ModelAnimation {
	boneCount  int // Number of bones
	frameCount int // Number of animation frames
	bones      &C.BoneInfo   // Bones information (skeleton)
	framePoses &&C.Transform // Poses array by frame
}

pub type ModelAnimation = C.ModelAnimation

// MaterialMap
struct C.MaterialMap {
	texture C.Texture2D // Material map texture
	color   C.Color     // Material map color
	value   f32 // Material map value
}

pub type MaterialMap = C.MaterialMap

// Material, includes shader and maps
struct C.Material {
	shader C.Shader       // Material shader
	maps   &C.MaterialMap // Material maps array (MAX_MATERIAL_MAPS)
	params [4]f32 // Material generic parameters (if required)
}

pub type Material = C.Material

// Bone, skeletal animation bone
struct C.BoneInfo {
	name   [32]C.char // Bone name
	parent int        // Bone parent
}

pub type BoneInfo = C.BoneInfo

pub enum MaterialMapIndex {
	albedo = C.MATERIAL_MAP_ALBEDO
	metalness = C.MATERIAL_MAP_METALNESS
	normal = C.MATERIAL_MAP_NORMAL
	roughness = C.MATERIAL_MAP_ROUGHNESS
	occlusion = C.MATERIAL_MAP_OCCLUSION
	emission = C.MATERIAL_MAP_EMISSION
	height = C.MATERIAL_MAP_HEIGHT
	cubemap = C.MATERIAL_MAP_CUBEMAP
	irradiance = C.MATERIAL_MAP_IRRADIANCE
	prefilter = C.MATERIAL_MAP_PREFILTER
	brdf = C.MATERIAL_MAP_BRDF
	diffuse = C.MATERIAL_MAP_DIFFUSE
	specular = C.MATERIAL_MAP_SPECULAR
}

pub struct Model {
pub mut:
	model    C.Model
	position geometry.Vector3 = geometry.Vector3{0.0, 0.0, 0.0}

	scale_axis geometry.Vector3 = geometry.Vector3{0.0, 0.0, 0.0}

	rotation_angle f32 = 0.0
	rotation_axis  geometry.Vector3 = geometry.Vector3{0.0, 0.0, 0.0}

	tint      color.Color = color.Color{u8(0xC4), u8(0xA0), u8(0x00), u8(0xff)}
	is_wire   bool
	is_loaded bool
}

// Model management functions
fn C.LoadModel(filename &char) C.Model
fn C.LoadModelFromMesh(mesh C.Mesh) C.Model
fn C.UnloadModel(model C.Model)
fn C.UnloadModelKeepMeshes(model C.Model)
fn C.GetModelBoundingBox(model C.Model) C.BoundingBox

pub fn new(filename string) Model {
	mut this := Model{}
	unsafe {
		this.model = C.LoadModel(&char(filename.str))
	}
	this.is_loaded = true

	return this
}

pub fn (mut m Model) unload() {
    unsafe {
        C.UnloadModel(&m.model)
    }
	m.is_loaded = false
}

fn C.DrawModel(model C.Model, position C.Vector3, scale f32, tint C.Color)
pub fn (m Model) draw() {
	if !m.is_loaded {
		return
	}
	if m.is_wire {
		C.DrawModelWiresEx(m.model, m.position, m.rotation_axis, m.rotation_angle, m.scale_axis,
			m.tint)
	} else {
		C.DrawModelEx(m.model, m.position, m.rotation_axis, m.rotation_angle, m.scale_axis,
			m.tint)
	}
}

pub fn (mut m Model) move_to(position geometry.Vector3) {
	m.position = position
	m.draw()
}

pub fn (mut m Model) move_for(shift_position geometry.Vector3) {
	m.position.x += shift_position.x
	m.position.y += shift_position.y
	m.position.z += shift_position.z
	m.draw()
}

pub fn (mut m Model) rotate_to(rotation_axis geometry.Vector3, rotation_angle f32) {
	m.rotation_axis = rotation_axis
	m.rotation_angle = rotation_angle

	m.draw()
}

pub fn (mut m Model) rotate_for(rotation_axis geometry.Vector3, rotation_angle f32) {
	m.rotation_axis.x += rotation_axis.x
	m.rotation_axis.y += rotation_axis.y
	m.rotation_axis.z += rotation_axis.z
	m.rotation_angle += rotation_angle
	m.rotate_to(m.rotation_axis, m.rotation_angle)
}

pub fn (mut m Model) scale_to(scale_axis geometry.Vector3) {
	m.scale_axis = scale_axis
	m.draw()
}

pub fn (mut m Model) scale(scale f32) {
	m.scale_axis = geometry.Vector3{scale, scale, scale}
	m.draw()
}

pub fn (mut m Model) scale_for(scale_axis geometry.Vector3) {
	m.scale_axis.x += scale_axis.x
	m.scale_axis.y += scale_axis.y
	m.scale_axis.z += scale_axis.z
	m.draw()
}

pub fn (mut m Model) solid() {
	m.is_wire = false
	m.draw()
}

pub fn (mut m Model) wire() {
	m.is_wire = true
	m.draw()
}

pub fn (m Model) bounding_box() geometry.Box {
	return C.GetModelBoundingBox(m.model)
}

fn C.DrawModelEx(model C.Model, position C.Vector3, rotation_axis C.Vector3, rotation_angle f32, scale C.Vector3, tint C.Color)
fn C.DrawModelWires(model C.Model, posiotion C.Vector3, scale f32, tint C.Color)
fn C.DrawModelWiresEx(model C.Model, position C.Vector3, rotation_axis C.Vector3, rotation_angle f32, scale C.Vector3, tint C.Color)
fn C.DrawBoundingBox(box C.BoundingBox, color C.Color)

fn C.DrawBillboard(camera C.Camera, texture C.Texture2D, position C.Vector3, size f32, tint C.Color)
fn C.DrawBillboardRec(camera C.Camera, texture C.Texture2D, source C.Rectangle, position C.Vector3, size C.Vector2, tint C.Color)
fn C.DrawBillboardPro(camera C.Camera, texture C.Texture2D, source C.Rectangle, position C.Vector3, up C.Vector3, size C.Vector2, origin C.Vector2, rotation f32, tint C.Color)

// Model animations loading/unloading functions
fn C.LoadModelAnimations(filename &char, anim_coutn &u32) &C.ModelAnimation
fn C.UpdateModelAnimation(model C.Model, anim C.ModelAnimation, frame int)
fn C.UnloadModelAnimation(anim C.ModelAnimation)
fn C.UnloadModelAnimations(animations &C.ModelAnimation, count u32)
fn C.IsModelAnimationValid(C.Model, anim C.ModelAnimation) bool

// Material loading/unloading functions
fn C.LoadMaterials(filename &char, material_count &int) &C.Material
fn C.LoadMaterialDefault() C.Material
fn C.UnloadMaterial(material C.Material)
fn C.SetMaterialTexture(material C.Material, map_type int, texture C.Texture2D)
fn C.SetModelMeshMaterial(model &C.Model, mesh_id int, material_id int)
