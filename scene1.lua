
require( "setup" )

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( )
	local sceneGroup = self.view

	local background = setupBackground("background.png")
    sceneGroup:insert(background)

	local logo = display.newImageRect("images/logo.png", 180, 150)
	logo.x = 145
	logo.y = 90
	sceneGroup:insert(logo)

	local btnStart = display.newImageRect("images/start.png", 120, 70)
	btnStart.x = 145
	btnStart.y = 320
	sceneGroup:insert(btnStart)

-- 	-- criar o botão de credito..
	local btnCreditos = display.newImageRect("images/credits.png", 120, 70)
	btnCreditos.x = 145
	btnCreditos.y = 370
    sceneGroup:insert(btnCreditos)

 	local btnRegras = display.newImageRect("images/rules.png", 120, 70)
	btnRegras.x = 145
	btnRegras.y = 420
    sceneGroup:insert(btnRegras)

   	function btnStart:tap()
   		print("Start game")
        composer.gotoScene( "scene2", {time=800, effect="crossFade"} )
    end

    function btnRegras:tap()
   		print("Regras game")
        composer.gotoScene( "regra", {time=800, effect="crossFade"} )
    end

    function btnCreditos:tap()
   		print("Creditos game")
        composer.gotoScene( "credito", {time=800, effect="crossFade"} )
    end

    btnStart:addEventListener("tap", btnStart)
    btnRegras:addEventListener("tap", btnRegras)
    btnCreditos:addEventListener("tap", btnCreditos)
	
	-- local credClicked = function(event)
	-- 	if (event.phase == "began") then
	-- 		storyboard.gotoScene("credito")
	-- 	end
	-- end
	-- cred:addEventListener("touch", credClicked)
	
	-- local credClicked = function(event)
	-- 	if (event.phase == "began") then
	-- 		storyboard.gotoScene("regra")
	-- 	end
	-- end
	-- regras:addEventListener("touch", credClicked)

	-- local text3 = display.newText( "Toque para iniciar o jogo.", 0, 0, native.systemFontBold, 18 )
	-- text3:setTextColor( 0,0,255 ); text3.isVisible = false
	-- text3.x, text3.y = display.contentWidth * 0.5, display.contentHeight - 100
	-- sceneGroup:insert( text3 )

	-- function scene:enterScene( event )
	-- 	print( "1: enterScene event" )
	-- 	storyboard.purgeScene( "scene2" )
	-- 		image:addEventListener( "touch", image )
	-- 		--text3.isVisible = true
	-- 	local memTimer = timer.performWithDelay( 1000, showMem, 1 )
	-- end
	-- -- -- Called when scene is about to move offscreen:
	-- function scene:exitScene( event )
	-- 	print( "1: exitScene event" )	
	-- end
	-- -- -- Called prior to the removal of scene's "view" (display group)
	-- function scene:destroyScene( event )
	-- 	print( "((destroying scene 1's view))" )
	-- end

end

function scene:show( ) end
function scene:hide( ) end
function scene:destroy( ) end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene


-- function scene:createScene( event )

-- 	-- criar start
	