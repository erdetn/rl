// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module audiostream

import rl

// Wave, audio wave data
pub struct C.Wave {
	frameCount u32     // Total number of frames (considering channels)
	sampleRate u32     // Frequency (samples per second)
	sampleSize u32     // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	channels   u32     // Number of channels (1-mono, 2-stereo, ...)
	data       voidptr // Buffer data pointer
}

pub type Wave = C.Wave

// AudioStream, custom audio stream
pub struct C.AudioStream {
	buffer     &C.rAudioBuffer // Pointer to internal data used by the audio system
	sampleRate u32 // Frequency (samples per second)
	sampleSize u32 // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
	channels   u32 // Number of channels (1-mono, 2-stereo, ...)
}

pub type AudioStream = C.AudioStream

// Sound
pub struct C.Sound {
	stream     C.AudioStream // Audio stream
	frameCount u32 // Total number of frames (considering channels)
}

pub type Sound = C.Sound

// Music, audio stream, anything longer than ~10 seconds should be streamed
pub struct C.Music {
	stream     C.AudioStream // Audio stream
	frameCount u32  // Total number of frames (considering channels)
	looping    bool // Music looping enable
	ctxType    int  // Type of music context (audio filetype)
	ctxData    voidptr
}

pub type Music = C.Music

fn C.InitAudioDevice()
pub fn init_device() {
	C.InitAudioDevice()
}

fn C.CloseAudioDevice()
pub fn close() {
	C.CloseAudioDevice()
}

fn C.IsAudioDeviceReady() bool
pub fn is_device_ready() bool {
	return C.IsAudioDeviceReady()
}

fn C.SetMasterVolume(volume f32)
pub fn set_volume(volume f32) {
	C.SetMasterVolume(volume)
}

// Wave //

fn C.LoadWave(filename &char) Wave
pub fn load_wave(filename string) Wave {
	return unsafe {
		C.LoadWave(cstring_to_vstring(filename))
	}
}

fn C.UnloadWave(wave Wave)
pub fn (this Wave) unload() {
	return C.UnloadWave(this)
}

fn C.ExportWave(wave Wave, filename &char) bool
fn C.ExportWaveAsCode(wave Wave, filename &char) bool
pub fn (this Wave) export(filename string, as_code bool) bool {
	if as_code == true {
		return unsafe {
			C.ExportWaveAsCode(this, &char(filename.str))
		}
	}
	return unsafe {
		C.ExportWave(this, &char(filename.str))
	}
}

// TODO:
fn C.WaveFormat(wave &Wave, sample_rate int, sample_size int, channels int)
fn C.WaveCopy(wave Wave) Wave
fn C.WaveCrop(wave &Wave, init_sample int, final_sample int)
fn C.LoadWaveSamples(wave Wave) &f32
fn C.UnloadWaveSamples(samples &f32)

// TODO:
fn C.LoadWaveFromMemory(file_type &char, file_data &char, data_size int) Wave

// Sound
fn C.LoadSound(filename &char) Sound
pub fn load_sound(filename string) Sound {
	return unsafe {
		C.LoadSound(&char(filename))
	}
}

fn C.LoadSoundFromWave(wave Wave) Sound
pub fn load_sound_from_wave(wave Wave) Sound {
	return C.LoadSoundFromWave(wave)
}

fn C.UpdateSound(sound Sound, data voidptr, sample_count int)
pub fn (this Sound) update(data voidptr, sample_count int) {
	C.UpdateSound(this, data, sample_count)
}

fn C.UnloadSound(sound Sound)
pub fn (this Sound) unload() {
	return C.UnloadSound(this)
}

fn C.PlaySound(sound Sound)
fn C.PlaySoundMulti(sound Sound)
pub fn (this Sound) play(multichannel bool) {
	if multichannel {
		C.PlaySoundMulti(this)
		return
	}
	C.PlaySound(this)
}

fn C.StopSound(sound Sound)
fn C.StopSoundMulti()
pub fn (this Sound) stop(multichannel bool) {
	if multichannel {
		C.StopSoundMulti()
		return
	}
	C.StopSound(this)
}

fn C.PauseSound(sound Sound)
pub fn (this Sound) pause() {
	C.PauseSound(this)
}

fn C.ResumeSound(sound Sound)
pub fn (this Sound) resume() {
	C.ResumeSound(this)
}

fn C.IsSoundPlaying(sound Sound) bool
pub fn (this Sound) is_playing() bool {
	return C.IsSoundPlaying(this)
}

fn C.SetSoundVolume(sound Sound, volume f32)
pub fn (this Sound) set_volume(volume f32) {
	C.SetSoundVolume(this, volume)
}

fn C.SetSoundPitch(sound Sound, pitch f32)
pub fn (this Sound) set_pitch(pitch f32) {
	C.SetSoundPitch(this, pitch)
}

fn C.GetSoundsPlaying() int
pub fn get_sounds_playing() int {
	return C.GetSoundsPlaying()
}

fn C.LoadMusicStream(filename &char) Music
pub fn load_music(filename string) Music {
	return unsafe {
		C.LoadMusicStream(&char(filename.str))
	}
}

fn C.LoadMusicStreamFromMemory(filetype &char, data &char, data_size int) Music

fn C.UnloadMusicStream(music Music)
pub fn (this Music) unload() {
	return C.UnloadMusicStream(this)
}

fn C.PlayMusicStream(music Music)
pub fn (this Music) play() {
	C.PlayMusicStream(this)
}

fn C.IsMusicStreamPlaying(music Music) bool
pub fn (this Music) is_playing() bool {
	return C.IsMusicStreamPlaying(this)
}

fn C.UpdateMusicStream(music Music)
pub fn (this Music) update() {
	C.UpdateMusicStream(this)
}

fn C.StopMusicStream(music Music)
pub fn (this Music) stop() {
	C.StopMusicStream(this)
}

fn C.PauseMusicStream(music Music)
pub fn (this Music) pause() {
	C.PauseMusicStream(this)
}

fn C.ResumeMusicStream(music Music)
pub fn (this Music) resume() {
	C.ResumeMusicStream(this)
}

fn C.SeekMusicStream(music Music, position f32)
pub fn (this Music) seek(position f32) {
	C.SeekMusicStream(this, position)
}

fn C.SetMusicVolume(music Music, volume f32)
pub fn (this Music) set_volume(volume f32) {
	C.SetMusicVolume(this, volume)
}

fn C.SetMusicPitch(music Music, pitch f32)
pub fn (this Music) set_pitch(pitch f32) {
	C.SetMusicPitch(this, pitch)
}

fn C.GetMusicTimeLength(Music music) f32
pub fn (this Music) get_time_length() f32 {
	return C.GetMusicTimeLength(this)
}

fn C.GetMusicTimePlayed(Music music) f32
pub fn (this Music) get_time_played() f32 {
	return C.GetMusicTimePlayed(this)
}

fn C.LoadAudioStream(sample_rate u32, samplesize u32, channels u32) AudioStream
pub fn load_audio_stream(samples_rate u32, samples_size u32, channels u32) AudioStream {
	return C.LoadAudioStream(sample_rate, sample_size, channels)
}

fn C.UnloadAudioStream(stream AudioStream)
pub fn (this AudioStream) unload() {
	C.UnloadAudioStream(this)
}

fn C.UpdateAudioStream(stream AudioStream, data voidptr, frame_count int)
pub fn (this AudioStream) update(data voidptr, frame_count int) {
	C.UpdateAudioStream(this, data, frame_count)
}

fn C.IsAudioStreamProcessed(stream AudioStream) bool
pub fn (this AudioStream) is_processed() bool {
	return C.IsAudioStreamProcessed(this)
}

fn C.PlayAudioStream(stream AudioStream)
pub fn (this AudioStream) play() {
	C.PlayAudioStream(this)
}

fn C.PauseAudioStream(stream AudioStream)
pub fn (this AudioStream) pause() {
	C.PauseAudioStream(this)
}

fn C.ResumeAudioStream(stream AudioStream)
pub fn (this AudioStream) resume() {
	C.ResumeAudioStream(this)
}

fn C.IsAudioStreamPlaying(stream AudioStream) bool
pub fn (this AudioStream) is_playing() bool {
	return C.IsAudioStreamPlaying(this)
}

fn C.StopAudioStream(stream AudioStream)
pub fn (this AudioStream) stop() {
	C.StopAudioStream(this)
}

fn C.SetAudioStreamVolume(stream AudioStream, volume f32)
pub fn (this AudioStream) set_volume(volume f32) {
	C.SetAudioStreamVolume(this, volume)
}

fn C.SetAudioStreamPitch(stream AudioStream, pitch f32)
pub fn (this AudioStream) set_pitch(pitch f32) {
	C.SetAudioStreamPitch(this, pitch)
}

fn C.SetAudioStreamBufferSizeDefault(size int)
pub fn (this AudioStream) set_buffer_size(size int) {
	C.SetAudioStreamBufferSizeDefault(this, size)
}
