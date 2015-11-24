local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

local image, text1, text2, text3,text9, contaSorteada

local function onSceneTouch( self, event )
	if event.phase == "began" then

		storyboard.gotoScene( true, "scene3", "fromRight", 800  )

		return true
	end
end


-- Called when the scene's view does not exist:
function scene:createScene( event )
	local screenGroup = self.view

	image = display.newImage(imagensFundos[math.random(1,#imagensFundos)] )
	screenGroup:insert( image )

	image.touch = onSceneTouch

	text1 = display.newText( "MathGame", 0, 0, native.systemFontBold, 50 )
	text1:setTextColor( 255 )
	text1:setReferencePoint( display.CenterReferencePoint )
	text1.x, text1.y = display.contentWidth * 0.5, 50
	screenGroup:insert( text1 )

	text2 = display.newText( "Qual operacao realizada? ", 0, 0, native.systemFont, 24 )
	text2:setTextColor( 0,255,255 )
	text2:setReferencePoint( display.CenterReferencePoint )
	text2.x= 165
	text2.y= 105
	screenGroup:insert( text2 )

	local selecao = math.random(0,#operacoes)
	contaSorteada = operacoes[selecao]
	table.remove(operacoes,selecao)


	
	text3 = display.newText(contaSorteada[1], 0, 0, native.systemFontBold, 50 )
	text3:setTextColor( 255 ); text3.isVisible = false
	text3:setReferencePoint( display.CenterReferencePoint )
	text3.x= 157
	text3.y = 220
	screenGroup:insert( text3 )

-- criar o quadrado em branco
  local marc1 = display.newImageRect("marc1.png", 80, 50)
  marc1.x = 85
  marc1.y = 260
  screenGroup:insert(marc1)
  --marc1:addEventListener("touch", operacao)
  

	-- criar o quadrado em branco
	--local marc = display.newImageRect("marc1.png", 50, 50)
	--marc.x = 105
	--marc.y = 220
	--screenGroup:insert(marc)
	--marc:addEventListener("touch", operacao)
	
	local operacao = function(event)
		if (event.phase == "began") then
			if (contaSorteada[2]==event.target.tipo)then
			audio.stop()
			Sound8 = audio.loadSound( "botao2.mp3" )
			audio.play(Sound8)
				local acerto = display.newImageRect("acerto.png", 50, 50)
				acerto.x = 105
				acerto.y = 220
				screenGroup:insert(acerto)
				print(acertos)
				acertos=acertos+1

			else print(errados)
				audio.stop()
				Sound6 = audio.loadSound( "botao.mp3" )
				audio.play(Sound6)
				local ErroX = display.newImageRect("erro.png", 50, 50)
				ErroX.x = 105
				ErroX.y = 220
				screenGroup:insert(ErroX)
				errados=errados+1

			end


			local sair = function(event)
				if (#operacoes<1) then
					print("acabou")

					--storyboard.purgeScene( "scene2","fade", 400 )
					storyboard.gotoScene("scene3", "fade", 400)
				else
					storyboard.purgeScene( "scene2","fade", 400 )
					storyboard.gotoScene("scene2", "fade", 400)
				end
			end
			local tm = timer.performWithDelay( 500, sair )
		end
	end

	


-- criar as operacoes

	local menos = display.newImageRect("menos.png", 50, 50)
	menos.tipo="-"
	menos.x = 72
	menos.y = 400
	screenGroup:insert(menos)
	menos:addEventListener("touch", operacao)
	
	
	local vezes = display.newImageRect("vezes.png", 50, 50)
	vezes.tipo="*"
	vezes.x = 128
	vezes.y = 400
	screenGroup:insert(vezes)
	vezes:addEventListener("touch", operacao)

	local div = display.newImageRect("div.png", 50, 50)
	div.tipo="/"
	div.x = 184
	div.y = 400
	screenGroup:insert(div)
	div:addEventListener("touch", operacao)
	
	local mais = display.newImageRect("mais.png", 50, 50)
	mais.tipo = "+"
	mais.x = 240
	mais.y = 400
	screenGroup:insert(mais)
	mais:addEventListener("touch", operacao)
	
	print( "\n2: createScene event" )
	storyboard.purgeScene( "scene3" )
	end

function scene:enterScene( event )

	print( "2: enterScene event" )

	-- remove previous scene's view
	storyboard.purgeScene( "scene1" )

	-- Update Lua memory text display
	--	local showMem = function()
	--		image:addEventListener( "touch", image )
	text3.isVisible = true
	-- text9.isVisible = true
	--		text2.text = text2.text .. collectgarbage("count")/1000 .. "MB"
	--		text2.x = display.contentWidth * 0.5
	--	end
	--local memTimer = timer.performWithDelay( 1000, showMem, 1 )
	end

function scene:exitScene()

	print( "2: exitScene event" )

	-- remove touch listener for image
	--image:removeEventListener( "touch", image )


end

function scene:destroyScene( event )

	print( "((destroying scene 2's view))" )
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene