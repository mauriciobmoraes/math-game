require( "setup" )

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( )
	local sceneGroup = self.view

	local background = setupBackground("images/regras.png")
    sceneGroup:insert(background)

	local btnVoltar = display.newImageRect("images/voltar.png", 120, 50)
	btnVoltar.x = display.contentWidth * 0.5
	btnVoltar.y = display.contentHeight - 30
    sceneGroup:insert(btnVoltar)

    function btnVoltar:tap()
        composer.gotoScene( "scene1", {time=800, effect="crossFade"} )
    end

    btnVoltar:addEventListener("tap", btnVoltar)
end

function scene:show( ) end
function scene:hide( ) end
function scene:destroy( ) end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene