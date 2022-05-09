module main 

import rl
import rl.window
import rl.color
import rl.text
import rl.draw
import rl.geometry as rg

const screen_width  = 800
const screen_height = 450 

fn main() {
    window.init(screen_width, screen_height, 'raylib [core] example - basic window')

    cylinder := draw.new_cylinder(rg.Vector3{0, 0, 0}, f32(10), f32(20), f32(100), 10, color.Color{100, 100, 0, 255})
    plane := draw.new_plane(rg.Vector3{10, 10, 0}, rg.Vector2{40, 40}, color.Color {200, 200, 200, 255})
    grid := draw.new_grid(20, f32(20))
    line := draw.new_line(rg.Vector2{50, 50}, rg.Vector2{250, 250}, f32(3.0), color.Color{255, 10, 10, 255})

    pxl := draw.new_pixel(100, 100, color.Color{255, 0, 0, 255})
    mut txt := text.new('Hello Vorld', 10, 50, 18, color.Color{10, 10, 10, 255})
    mut txt_fps := text.new_text_fps(10, 10)
    rl.set_target_fps(60)

    for {
        if window.should_close() == true {
           break
        }

        rl.begin_drawing()

        rl.clear_background(color.gray) 
        
        plane.draw()
        txt_fps.draw()
        txt.draw()
        pxl.draw()
        line.draw()
        grid.draw()
        cylinder.draw()

        rl.end_drawing()

    }

    window.close()
}

