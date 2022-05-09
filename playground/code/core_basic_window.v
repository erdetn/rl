module main 

import rl
import rl.window
import rl.color
import rl.text
import rl.draw
const screen_width  = 800
const screen_height = 450 

fn main() {
    window.init(screen_width, screen_height, 'raylib [core] example - basic window')

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
        txt_fps.draw()
        txt.draw()
        pxl.draw()

        rl.end_drawing()

    }

    window.close()
}

