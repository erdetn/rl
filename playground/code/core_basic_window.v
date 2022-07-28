module main 

import rl
import rl.window
import rl.color
import rl.text
import rl.draw
import rl.geometry as rg
import rl.camera as cam 

const screen_width  = 800
const screen_height = 450 

fn main() {
    window.init(screen_width, screen_height, 'raylib [core] example - basic window')

    cam3d := cam.new(rg.Vector3{0, 10, 10}, rg.Vector3{0, 0, 0}, rg.Vector3{0, 1, 0}, f32(120), cam.CameraProjection.perspective)
    cam3d.set_mode(cam.CameraMode.free)
    
    cylinder := draw.new_cylinder(rg.Vector3{0, 0, 0}, f32(2), f32(2), f32(2), 10, color.Color{200, 180, 0, 250})
    plane := draw.new_plane(rg.Vector3{10, 10, 0}, rg.Vector2{40, 40}, color.Color {200, 200, 200, 255})
    grid := draw.new_grid(10, f32(1))
    line := draw.new_line(rg.Vector2{50, 50}, rg.Vector2{250, 250}, f32(3.0), color.Color{255, 10, 10, 255})

    pxl := draw.new_pixel(100, 100, color.Color{255, 0, 0, 255})
    mut txt := text.new('Hello Vorld', 10, 50, 18, color.Color{10, 10, 10, 255})
    mut txt_fps := text.new_text_fps(10, 10)
    rl.set_target_fps(60)

    for {
        if window.should_close() == true {
           break
        }

        cam3d.update()

        rl.begin_drawing()

        rl.clear_background(color.Color{50, 50, 50, 255}) 
        
        cam3d.begin()
        
        plane.draw()
        cylinder.draw()
        //C.DrawCube(C.Vector3{0, 0, 0}, f32(10), f32(10), f32(10), C.Color{255, 0,0, 255})
        grid.draw()

        cam3d.end()

        txt_fps.draw()
        txt.draw()
        pxl.draw()
        line.draw()

        rl.end_drawing()

    }

    window.close()
}

