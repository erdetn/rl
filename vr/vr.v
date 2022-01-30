// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module image

import rl

pub struct C.VrDeviceInfo {
	hResolution            int
	vResolution            int
	hScreenSize            f32
	vScreenSize            f32
	vScreenCenter          f32
	eyeToScreenDistance    f32
	lensSeparationDistance f32
	interpupillaryDistance f32
	lensDistortionValues   [4]f32
	chromaAbCorrection     [4]f32
}

pub type VrDeviceInfo = C.VrDeviceInfo

pub struct C.VrStereoConfig {
	projection        [2]C.Matrix
	viewOffset        [2]C.Matrix
	leftLensCenter    [2]f32
	rightLensCenter   [2]f32
	leftScreenCenter  [2]f32
	rightScreenCenter [2]f32
	scale             [2]f32
	scaleIn           [2]f32
}

pub type VrStereoConfig = C.VrStereoConfig

fn C.LoadVrStereoConfig(device VrDeviceInfo) VrStereoConfig
pub fn load_stereo_config(device VrDeviceInfo) VrStereoConfig {
	return C.LoadVrStereoConfig(device)
}

fn C.UnloadVrStereoConfig(config VrStereoConfig)
pub fn unload_stereo_config(config VrStereoConfig) {
	C.UnloadVrStereoConfig(config)
}

pub fn (this VrStereoConfig) unload() {
	unload_stereo_config(this)
}
