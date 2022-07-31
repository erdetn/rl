module main

import rl
import rl.geometry as rg
import rl.model
import rl.camera
import rl.color
import rl.window
import rl.draw
import rl.text

const screen_width = 800

const screen_height = 450

fn main() {
	window.init(screen_width, screen_height, 'raylib [models] example - models loading')

	camera3d := camera.new(rg.Vector3{30.0, 30.0, 30.0}, 
                           rg.Vector3{0, 10.0, 0}, 
                           rg.Vector3{0, 1, 0},
		                   f32(35), 
                           camera.CameraProjection.perspective)
	camera3d.set_mode(camera.CameraMode.free)

	grid := draw.new_grid(10, f32(1))
	mut txt_fps := text.new_text_fps(10, 10)

	mut model := model.new('res/castle.obj')
	rl.set_target_fps(60)

	for {
		if window.should_close() == true {
			break
		}

		camera3d.update()
		rl.begin_drawing()
		{
			rl.clear_background(color.Color{50, 50, 50, 255})
			camera3d.begin()
			{
				model.draw()
				grid.draw()
			}
			camera3d.end()
			txt_fps.draw()
		}
		rl.end_drawing()
	}

	model.unload()
	window.close()
}
