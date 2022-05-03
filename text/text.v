// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module text

import rl
import rl.color

pub enum FontType {
	default = C.FONT_DEFAULT
    	bitmap = C.FONT_BITMAP 
    	sdf = C.FONT_SDF
}

// GlyphInfo, font characters glyphs info
pub struct C.GlyphInfo {
    value    int       // Character value (Unicode)
    offsetX  int       // Character offset X when drawing
    offsetY  int       // Character offset Y when drawing
    advanceX int       // Character advance position X
    image    C.Image   // Character image data
} 
pub type GlyphInfo = C.GlyphInfo

// Font, font texture and GlyphInfo array data
pub struct C.Font {
    baseSize int           // Base size (default chars height)
    glyphCount int        // Number of glyph characters
    glyphPadding int       // Padding around the glyph characters
    texture C.Texture2D      // Texture atlas containing the glyphs
    recs &C.Rectangle        // Rectangles in texture for the glyphs
    glyphs &C.GlyphInfo      // Glyphs info data
}
pub type Font = C.Font

// Font loading/unloading functions
fn C.GetFontDefault() C.Font 
fn C.LoadFont(file_name &char) C.Font 
fn C.LoadFontEx(file_name &char, font_size int, font_chars &int, glyph_count int) C.Font 
fn C.LoadFontFromImage(image C.Image, key C.Color, first_char int) C.Font 
fn C.LoadFontFromMemory(file_type &char, file_data &u8, data_size int, font_size int, font_chars &int, glyph_count int) C.Font 
fn C.LoadFontData(file_data &u8, data_size int, font_size int, font_chars &int, glyph_count int, @type int) &C.GlyphInfo 
fn C.GenImageFontAtlas(chars &C.GlyphInfo, recs &&C.Rectangle, glyph_count int, font_size int, padding int, pack_method int) C.Image 
fn C.UnloadFontData(chars &C.GlyphInfo, glyph_count int)  
fn C.UnloadFont(font C.Font)  
fn C.ExportFontAsCode(font C.Font, file_name &char) bool

pub struct TextFps {
pub mut:
    x int
    y int
}

pub fn new_text_fps(x int, y int) TextFps {
    return TextFps {
        x: x 
        y: y 
    }
}

pub fn (mut this TextFps)move_to(x int, y int) {
    this.x = x
    this.y = y
}

pub fn (this TextFps)draw() {
    C.DrawFPS(this.x, this.y)
}

// Text drawing functions
fn C.DrawFPS(pos_x int, pos_y int) 
fn C.DrawText(text &char, pos_x int, pos_y int, font_size int, color C.Color) 
fn C.DrawTextEx(font C.Font, text &char, position C.Vector2, font_size f32, spacing f32, tint C.Color) 
fn C.DrawTextPro(font C.Font, text &char, position C.Vector2, origin C.Vector2, rotation f32, font_size f32, spacing f32, tint C.Color)
fn C.DrawTextCodepoint(font C.Font, codepoint int, position C.Vector2, font_size f32, tint C.Color)

// Text font info functions
fn C.MeasureText(text &char, font_size int) int  
fn C.MeasureTextEx(font C.Font, text &char, font_size f32, spacing f32) C.Vector2 
fn C.GetGlyphIndex(font C.Font, codepoint int) int 
fn C.GetGlyphInfo(font C.Font, codepoint int) C.GlyphInfo 
fn C.GetGlyphAtlasRec(font C.Font, codepoint int) C.Rectangle 

// Text codepoints management functions (unicode characters)
fn C.LoadCodepoints(text &char, count &int) &int
fn C.UnloadCodepoints(codepoints &int) 
fn C.GetCodepointCount(text &char) int 
fn C.GetCodepoint(text &char, bytes_processed &int) int 
fn C.CodepointToUTF8(codepoint int, byte_size &int) &char 
fn C.TextCodepointsToUTF8(codepoints &int, length int) &char 

pub struct Text {
pub mut:
    text string
    x int
    y int
    font_size int
    color color.Color
}

pub fn (this Text)draw() {
    unsafe {
        C.DrawText(&char(this.text.str), this.x, this.y, this.font_size, this.color)
    }
}

pub fn new(text string, x int, y int, font_size int, color color.Color) Text {
    return Text {
        text: text
        x: x
        y: y
        font_size: font_size
        color: color
    }
}

pub fn (mut this Text)set_text(text string) {
    this.text = text
}

pub fn (this Text)get_text() string {
    return this.text
}

pub fn (mut this Text)move_to(x int, y int) {
    this.x = x
    this.y = y
}

pub fn (this Text)get_position() (int, int) {
    return this.x, this.y
}

pub fn (mut this Text)set_font_size(font_size int) {
    this.font_size = font_size
}

pub fn (this Text) get_font_size() int {
    return this.font_size
}


// For text operations, we will use the native string functions //
fn C.TextCopy(dst &char, src &char) int 
fn C.TextIsEqual(text1 &char, text2 &char) bool
fn C.TextLength(text &char) u32 
fn C.TextFormat(text &char) &char 
fn C.TextSubtext(text &char, position int, length int) &char 
fn C.TextReplace(text &char, replace &char, by &char) &char 
fn C.TextInsert(text &char, insert &char, position int) &char 
fn C.TextJoin(text_list &&char, count int, delimiter &char) &char
fn C.TextSplit(text &char, delimiter char, count &int) &&char
fn C.TextAppend(text &char, append &char, position &int) 
fn C.TextFindIndex(text &char, find &char) int 
fn C.TextToUpper(text &char) &char 
fn C.TextToLower(text &char) &char 
fn C.TextToPascal(text &char) &char
fn C.TextToInteger(text &char) int

