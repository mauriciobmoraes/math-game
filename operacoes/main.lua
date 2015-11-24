
display.setStatusBar( display.HiddenStatusBar )


local storyboard = require "storyboard"
local widget = require "widget"

operacoes = {	{" 8       2 = 10", "+"},
				{" 9       2 = 18", "*"},
				{" 5       3 = 02", "-"},
				{" 7       9 = 16", "+"},
				{" 6       2 = 04", "-"},
				{" 5       3 = 15", "*"},
				{" 4       4 = 01", "/"},
				{" 1       7 = 07", "*"},
				{" 8       2 = 04", "/"},
				{"10       3 = 07", "-"},
				{" 8       2 = 04", "/"},
				{" 7       4 = 03", "-"},
				{" 3       9 = 27", "*"},
				{" 2       9 = 11", "+"},
				{" 5       5 = 01", "/"},
				{" 2       2 = 04", "+"},
				{" 9       4 = 32", "*"},
				{"10       2 = 05", "/"},
				{" 3       8 = 11", "+"},
				{" 1       1 = 00", "-"}
				
				}
				
imagensFundos = {	"bg.jpg",
					"bg2.jpg",
					"bg3.jpg",
					"bg4.jpg",
					"bg5.jpg",
					"bg6.jpg",
					"bg7.jpg",
					"bg8.jpg",
					"bg9.jpg",
					"bg10.jpg",
					}

acertos = 0
errados = 0


storyboard.gotoScene( "scene1" )