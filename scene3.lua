require( "setup" )

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( )
	local sceneGroup = self.view

	local background = setupBackground("images/background.png")	
	sceneGroup:insert(background)
	
	local acertos = composer.getVariable( "acertos" )
	local errados = composer.getVariable( "errados" )

	local trofeu = display.newImage("images/trofeu.png", display.contentWidth  * 0.5, 230)
	trofeu.width = 200
	trofeu.height = 200
	trofeu.alpha = 0
	sceneGroup:insert(trofeu)

	local porco = display.newImage("images/porco.png", display.contentWidth  * 0.5, 230)
	porco.width = 200
	porco.height = 200
	porco.alpha = 0
	sceneGroup:insert(porco)

	local resultado = display.newText( "Resultado", 0, 0, native.systemFontBold, 24 )
	resultado:setTextColor( 255 )
	resultado:setTextColor( 000 ); 
	resultado.x, resultado.y = display.contentWidth * 0.5, 50
	sceneGroup:insert( resultado )	

	if (acertos > 15) then
		transition.to(trofeu, {time = 4000, alpha = 1})

		audio.stop()
		local Sound7 = audio.loadSound( "venceu.mp3" )
		audio.play(Sound7)

		local text4 = display.newText( "Acertou um total de "..acertos.." respostas!!", 0, 0, native.systemFontBold, 20 )
		text4:setTextColor( 000 )
		text4.x = 160 
		text4.y = display.contentHeight - 70
		sceneGroup:insert( text4 )
	else 
		audio.stop()

		transition.to(porco, {time = 4000, alpha = 1})

		local som = audio.loadSound( "perdeu.mp3" )
		audio.play(som)

		local text4 = display.newText( "Continue estudando!", 0, 0, native.systemFontBold, 22 )
		text4:setTextColor( 000 )
		text4.x = 160 
		text4.y = display.contentHeight - 90
		sceneGroup:insert( text4 )

		local text5 = display.newText( "Errou um total de "..errados.." respostas!!", 0, 0, native.systemFontBold, 18 )
		text5:setTextColor( 0 )
		text5.x = 160 
		text5.y = display.contentHeight - 120
		sceneGroup:insert( text5 )
	end

	local text3 = display.newText( "Toque para continuar.", 0, 0, native.systemFontBold, 20 )
	text3:setTextColor( 000 ); 
	text3.x = display.contentWidth * 0.5
	text3.y = display.contentHeight - 20
	sceneGroup:insert( text3 )

    function background:tap()
        composer.gotoScene( "scene1", {time=800, effect="crossFade"} )
    end

    background:addEventListener("tap", background)
end

function scene:show( ) end
function scene:hide( ) end
function scene:destroy( ) end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene