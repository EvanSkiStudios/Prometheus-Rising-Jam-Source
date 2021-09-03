//reset draw
draw_set_default();
draw_set_color(c_white);




/*
With that done, it's time to actually draw our dialogue text! First, we need to check the current last character of the text being drawn,
and if it's not the last character of the whole text, advance it by the speed that we set in the create event:
*/

var len = string_length(text[text_current][TContent]); 
if (char_current < len) { 
	char_current += char_speed;
}


/*
To draw the text, we simply use the string_copy() function to copy the section of the 
total text from the beginning to the current last character and then draw that, like this:
*/

//draw text settings
draw_set_halign(display_text_H_align);
draw_set_valign(fa_top);
draw_set_color(text[text_current][TColor]);
draw_set_font(text_font);

text_color = text[text_current][TColor];

var _str = string_copy(text[text_current][TContent], 1, char_current);
draw_text_color(text_x, text_y,  _str, text_color,text_color,text_color,text_color,1);

draw_set_default();