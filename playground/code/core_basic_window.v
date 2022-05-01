module main 

import rl
import rl.window
import rl.color

const screen_width  = 800
const screen_height = 450 

fn main() {
    window.init(screen_width, screen_height, 'raylib [core] example - basic window')

    rl.set_target_fps(60)

    for {
        if window.should_close() == true {
           break
        }
        
        rl.begin_drawing()

        rl.clear_background(color.gray) 
        

        rl.end_drawing()

    }

    window.close()
}

