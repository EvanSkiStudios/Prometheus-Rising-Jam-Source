draw_set_default();

#region Function String_wrap
	/// @function                   string_wrap(text, width);
	/// @param  {string}    text    The text to wrap
	/// @param  {real}      width   The maximum width of the text before a line break is inserted
	//  Take a string and add line breaks so that it doesn't overflow the maximum width

	function string_wrap(_text, _width)
	{
		var _text_wrapped = "";
		var _space = -1;
		var _char_pos = 1;
		//while text is lobger then or equal too character position
		while (string_length(_text) >= _char_pos)
		{
			//if the string width of the text to the charater position is bigger then our width
			if (string_width(string_copy(_text, 1, _char_pos)) > _width)
			{
				//if there is a space
				if (_space != -1)
				{
					_text_wrapped += string_copy(_text, 1, _space) + "\n";
					_text = string_copy(_text, _space + 1, string_length(_text) - (_space));
					_char_pos = 1;
					_space = -1;
				}
			}
			//if the character position is a space, mark it and increase our position
			if (string_char_at(_text,_char_pos) == " ")
			{
				_space = _char_pos;
			}
			_char_pos += 1;
		}
		//if our text is longer then nothing, add the rest to our wrapped text
		if (string_length(_text) > 0)
		{
		    _text_wrapped += _text;
		}
		//give us our wrapped text
		return _text_wrapped;
	}
	/*
	All this script is doing is looping through the given string a letter at a time and 
	checking to see if the length of the string after each letter is added to it overflows 
	the permitted text width, while also storing n a variable the position of the last 
	space found between words. If the text does overflow the given width, then the function 
	adds a line break ("\n") into the text at the last space, then continues on, and it will 
	do this for the entire length of the given text, adding as many line breaks as required.
	*/
#endregion

#region DEFUALT SETTINGS
	text_current = 0;
	text_last = 1;
	text_width = 300;
	text_x = x+32;
	text_y = y+32;
	text_color_default = c_white;
	text_color = c_white;
	char_current = 1;
	char_start = char_current;
	text_font = noone;
	
	/*
	text_current : this will be used to tell GameMaker what the current text array position to use for the text.

	text_last : this will be used to tell GameMaker what the last array position is, in this case 1 as we have 2 positions - 0 and 1 - in our array. For an array with position 0, 1, 2, and 3, then this variable would be set to 3.

	text_width : this is the maximum width that we want the text to be drawn before it wraps to a new line

	text_x : the X position where we want to draw the text in the room

	text_y : the Y position where we want to draw the text in the room
	
	text_color : color of the current text
	
	text_color_deafult : default color to reset back too
	
	char_current : controls what char we are on based off of char speed
	
	char_start : holds the starting char_current and never changes
	
	text_font : font 
*/
#endregion

//array default refs
#macro TColor 0
#macro TContent 1
#macro TSprite 2
#macro TVoice 3

//SETTINGS
//when to wrap text
text_width = 300; 

//where text draws
text_x = x;
text_y = y+12;

//the Herizontial alignment to draw the text
display_text_H_align = fa_left;

//color
text_color_default = c_white;
text_color = c_white;

//font
text_font = global.font_Doom_small;

//text speed to draw
char_speed = 0.25;

alarm[0] = GAME_SPEED * 30;

//deubug talker sprite
//talker_sprite = spr_DEBUG;


#region DEFUALT TEXT ARRAY
	text[0] = "ERROR!!";
	text[1] = "ISSUE WITH GET DIALOUG FUNCTION";
#endregion
//reset array
text = undefined;
var i = 0;
	
text[i][TContent] = "it has started child, From the bowels of the abyss, Prometheus Rises to seek vengance against the gods, To cleanse their sins with the holiness of Flame, This is only the beginning, Prometheus shall return!";
text[i][TColor] = HUD_TEXTCOLOR_BRIGHT_RED;
text[i][TSprite] = 0;
text[i][TVoice] = 0;


/*
The last thing to do in our Create Event is to call the function we created earlier on the 
first line of text we'll be drawing so that it wraps correctly within the given width:
*/
text[text_current][TContent] = string_wrap(text[text_current][TContent], text_width);
