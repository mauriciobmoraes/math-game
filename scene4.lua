---------------------------------------------------------------------------------
--
-- testscreen4.lua
--
---------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

local image, text1, text3

local function onSceneTouch( self, event )
	if event.phase == "began" then
		
		--destroyScene( "scene2")
		scene:addEventListener("destroyScene",scene)
		scene1:addEventListener("destroyScene",scene1)
		scene2:addEventListener("destroyScene",scene2)
		scene3:addEventListener("destroyScene",scene3)
		scene4:addEventListener("destroyScene",scene4)
		storyboard.gotoScene( "scene1", "fromBottom", 800  )
		
		return true
	end
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local screenGroup = self.view
	
	image = display.newImage( "bg2.jpg" )
	screenGroup:insert( image )
	
	image.touch = onSceneTouch
	
	text1 = display.newText( "Scene 4 - estou aqui", 0, 0, native.systemFontBold, 24 )
	text1:setTextColor( 255 )
	text1:setReferencePoint( display.CenterReferencePoint )
	text1.x, text1.y = display.contentWidth * 0.5, 50
	screenGroup:insert( text1 )
	
	text3 = display.newText( "Touch to continue.", 0, 0, native.systemFontBold, 18 )
	text3:setTextColor( 255 ); text3.isVisible = false
	text3:setReferencePoint( display.CenterReferencePoint )
	text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight - 100
	screenGroup:insert( text3 )
	
	print( "\n4: createScene event" )
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	
	print( "4: enterScene event" )
	
	-- remove previous scene's view
	--scene:addEventListener( "destroyScene", scene )
	storyboard.destroyScene( "scene3" )
	
-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	print( "((destroying scene 4's view))" )
end

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene2:addEventListener( "destroyScene", main)

---------------------------------------------------------------------------------
end
return scene