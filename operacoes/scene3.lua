local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local image, text1, text3

local function onSceneTouch( self, event )
	if event.phase == "began" then
		
		storyboard.gotoScene( "scene1", "fromLeft", 800  )
		
		return true
	end
end

function scene:createScene( event )
	local screenGroup = self.view
	if(acertos > 15) then
	audio.stop()
	Sound7 = audio.loadSound( "venceu.mp3" )
	audio.play(Sound7)
	image = display.newImage( "bg3.png")
	screenGroup:insert( image )
	
	image.touch = onSceneTouch
	
	text1 = display.newText( "Resultado", 0, 0, native.systemFontBold, 24 )
	text1:setTextColor( 255 )
	text1:setReferencePoint( display.CenterReferencePoint )
	text1.x, text1.y = display.contentWidth * 0.5, 50
	screenGroup:insert( text1 )
	
	text4 = display.newText( "Acertou um total de "..acertos.." respostas!!", 0, 0, native.systemFontBold, 20 )
	text4:setTextColor( 255 )
	text4:setReferencePoint( display.CenterReferencePoint )
	text4.x = 160 
	text4.y = 250
	screenGroup:insert( text4 )
	
	text4 = display.newText( "Continue estudando!", 0, 0, native.systemFontBold, 22 )
	text4:setTextColor( 255 )
	text4:setReferencePoint( display.CenterReferencePoint )
	text4.x = 160 
	text4.y = 300
	screenGroup:insert( text4 )
	
	text3 = display.newText( "Toque para continuar.", 0, 0, native.systemFontBold, 20 )
	text3:setTextColor( 255 ); text3.isVisible = false
	text3:setReferencePoint( display.CenterReferencePoint )
	text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight - 100
	screenGroup:insert( text3 )
	
	print( "\n3: createScene event" )
	--storyboard.purgeScene( "scene1" )
	else
	
	audio.stop()
	Sound9 = audio.loadSound( "perdeu.mp3" )
	audio.play(Sound9)
	
	image = display.newImage( "bg33.png")
	screenGroup:insert( image )
	
	image.touch = onSceneTouch
	
	text1 = display.newText( "Resultado", 0, 0, native.systemFontBold, 24 )
	text1:setTextColor( 255 )
	text1:setReferencePoint( display.CenterReferencePoint )
	text1.x, text1.y = display.contentWidth * 0.5, 50
	screenGroup:insert( text1 )
	
	text5 = display.newText( "Errou um total de "..errados.." respostas!!", 0, 0, native.systemFontBold, 18 )
	text5:setTextColor( 255 )
	text5:setReferencePoint( display.CenterReferencePoint )
	text5.x = 160 
	text5.y = 250
	screenGroup:insert( text5 )
	
	text3 = display.newText( "Toque para continuar.", 0, 0, native.systemFontBold, 18 )
	text3:setTextColor( 255 ); text3.isVisible = false
	text3:setReferencePoint( display.CenterReferencePoint )
	text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight - 100
	screenGroup:insert( text3 )
	
	print( "\n3: createScene event" )
	
	
	end
end

function scene:enterScene( event )
	
	print( "3: enterScene event" )
	
	-- remove previous scene's view
	storyboard.purgeScene( "scene1" )
	
		image:addEventListener( "touch", image )
	
end

function scene:exitScene()
	
	print( "3: exitScene event" )
	
	-- remove touch listener for image
	image:removeEventListener( "touch", image )
	

end

function scene:destroyScene( event )
	
	print( "((destroying scene 3's view))" )
	storyboard.purgeScene( "scene1" )
end
scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene", scene )

scene:addEventListener( "exitScene", scene )

scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene