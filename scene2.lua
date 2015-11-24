require( "setup" )

local composer = require( "composer" )
local scene = composer.newScene()

local imagensFundos = {	
	"images/random/1.jpg",
	"images/random/2.png",
	"images/random/3.jpg",
	"images/random/4.jpg"
}


operacoes = {	
	{" 8       2 = 10", "+"},
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
	{" 2       9 = 11", "+"}
}


local errados = 01
local acertos = 01

function scene:create( )
	local sceneGroup = self.view

	local background = setupBackground(imagensFundos[math.random(1,#imagensFundos)])
    sceneGroup:insert(background)

	local logo = display.newImageRect("images/logo.png", 180, 150)
	logo.x = 145
	logo.y = 90
	sceneGroup:insert(logo)

	local acerto
	local ErroX 

	function operacao(event)
		if (event.phase == "began") then
			if (contaSorteada1[2]==event.target.tipo)then
			audio.stop()
			Sound8 = audio.loadSound("botao2.mp3")
			audio.play(Sound8)
				acerto.isVisible = true 
				print(acertos)
				acertos=acertos+1

			else print(errados)
				audio.stop()
				Sound6 = audio.loadSound("botao.mp3")
				audio.play(Sound6)
				ErroX.isVisible = true 
				errados=errados+1
		end
			composer.setVariable( "acertos", acertos )
			composer.setVariable( "errados", errados )
			
			local sair = function(event)
			print("aaaaaa")
			print(#operacoes)
				if (#operacoes  < 1) then
					print("acabou")
					composer.gotoScene("scene3", "fade", 400)
				else
					createQuestion()
				end
			end

			local tm = timer.performWithDelay( 500, sair )
		end
	end


-- local image, titulo, subtitulo, number_parcela1,text3, number_parcela2, resultado_conta, contaSorteada, conta
-- local function onSceneTouch( self, event )
-- 	if event.phase == "began" then
-- 		storyboard.gotoScene( true, "scene3", "fromRight", 800  )
-- 		return true
-- 	end
-- end
-- -- Called when the scene's view does not exist:
-- --Cria as imagens de fundo, de um banco de imagens
-- function scene:createScene( event )
-- 	local sceneGroup = self.view
	-- local image = display.newImage(imagensFundos[math.random(1,#imagensFundos)] )
	-- sceneGroup:insert( image )

	-- background = setupBackground("images/background.png")

    local marc1 = display.newImageRect("marc.png", 50, 50)
	marc1.x = 38
	marc1.y = 280
	sceneGroup:insert(marc1)

	local marc2 = display.newImageRect("marc2.png", 50, 50)
	marc2.x = 98
	marc2.y = 280
	sceneGroup:insert(marc2)

	local marc3 = display.newImageRect("marc.png", 50, 50)
	marc3.x = 158
	marc3.y = 280
	sceneGroup:insert(marc3)

	local marc4 = display.newImageRect("marc4.png", 50, 50)
	marc4.x = 218
	marc4.y = 280
	sceneGroup:insert(marc4)

	local marc5 = display.newImageRect("marc1.png", 60, 50)
	marc5.x = 280
	marc5.y = 280
	sceneGroup:insert(marc5)

	local menos = display.newImageRect("menos.png", 50, 50)
	menos.tipo="-"
	menos.x = 72
	menos.y = 400
	sceneGroup:insert(menos)
	menos:addEventListener("touch", operacao)

	local vezes = display.newImageRect("vezes.png", 50, 50)
	vezes.tipo="*"
	vezes.x = 128
	vezes.y = 400
	sceneGroup:insert(vezes)
	vezes:addEventListener("touch", operacao)

	local div = display.newImageRect("div.png", 50, 50)
	div.tipo="/"
	div.x = 184
	div.y = 400
	sceneGroup:insert(div)
	div:addEventListener("touch", operacao)

	local mais = display.newImageRect("mais.png", 50, 50)
	mais.tipo = "+"
	mais.x = 240
	mais.y = 400
	sceneGroup:insert(mais)
	mais:addEventListener("touch", operacao)

	if (#operacoes == 0) then
		print("remontou o vetor")
		operacoes = {	
			{" 8       2 = 10", "+"},
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
			{" 1       1 = 00", "-"},			
			{" 8       9 = 72", "*"}	
		}
	end

	local number_parcela1 = display.newText("?", 0, 0, native.systemFontBold, 50 )
	number_parcela1:setTextColor( 000 ); 
	number_parcela1.isVisible = true
	number_parcela1.x= 38
	number_parcela1.y = 280
	sceneGroup:insert( number_parcela1 )

	local number_parcela2 = display.newText("", 0, 0, native.systemFontBold, 50)
	number_parcela2:setTextColor(000); number_parcela2.isVisible = true
	-- number_parcela2:setReferencePoint(display.CenterReferencePoint)
	number_parcela2.x= 155
	number_parcela2.y = 280
	sceneGroup:insert(number_parcela2)

	local resultado_conta = display.newText("?", 0, 0, native.systemFontBold, 50 )
	resultado_conta:setTextColor(000); resultado_conta.isVisible = true
	resultado_conta.x= 280
	resultado_conta.y = 280
	sceneGroup:insert( resultado_conta )

	function createQuestion() 

		acerto.isVisible = false
		ErroX.isVisible = false
		
		local selecao = math.random(1,#operacoes)
	 	contaSorteada = operacoes[selecao]
		table.remove(operacoes,selecao)

		local parcelas1 = {	{"1"},	{"2"},	{"3"},	{"4"},	{"5"},	{"6"},	{"7"},	{"8"},	{"9"}	}
		local parcelas2 = {	{"2"},	{"3"},	{"4"},	{"5"},	{"6"},	{"7"},	{"8"},	{"9"}	}
		-- --numero aleatorio 
		selecao1 = math.random(#parcelas1)
		local conta = parcelas1[selecao1]
		table.remove(parcelas1,selecao1)	

		selecao2 = math.random(#parcelas2)
		local conta1 = parcelas2[selecao2]
		table.remove(parcelas2,selecao2)

		continha = {	
			{conta[1]-conta1[1],'-'},	
			{conta[1]+conta1[1],'+'},	
			{conta[1]*conta1[1],'*'},	
			{conta[1]/conta1[1],'/'}
		}


	-- --seleciona uma conta aleatorio, removendo em seguida para nao se repetir(#)
		local selecionada = math.random(1,#continha)
		contaSorteada1 = continha[selecionada]
		table.remove(continha,selecionada)

		if (contaSorteada1[2]=='/') then
			print("Continha de DIVIDIR")
					--numeros 
			local parcelas3 = {	{"2"},{"4"},{"6"},{"8"}}
			local parcelas4 = {	{"2"}}
			--numero aleatorio 
			selecao1 = math.random(#parcelas3)
			local conta = parcelas3[selecao1]
			table.remove(parcelas3,selecao1)	

			selecao2 = math.random(#parcelas4)
			local conta1 = parcelas4[selecao2]
			table.remove(parcelas4,selecao2)

	
			number_parcela1.text = conta[1]
			number_parcela2.text = conta1[1]
			resultado_conta.text = conta[1]/conta1[1]
		else
			if (contaSorteada1[2]=='-') then
				print("Continha de menos")
								--numeros 
				local parcelas3 = {	{"9"},{"6"},{"7"},{"8"}}
				local parcelas4 = {	{"1"},{"2"},{"3"},{"4"},{5}}
				--numero aleatorio 
				selecao1 = math.random(#parcelas3)
				local conta = parcelas3[selecao1]
				table.remove(parcelas3,selecao1)	

				selecao2 = math.random(#parcelas4)
				local conta1 = parcelas4[selecao2]
				table.remove(parcelas4,selecao2)

				--primeira parcela
				number_parcela1.text = conta[1]
				number_parcela2.text = conta1[1]
				resultado_conta.text = conta[1]-conta1[1]
			else
				print("Continhas +*")
				--primeira parcela
				number_parcela1.text = conta[1]
				number_parcela2.text = conta1[1]
				resultado_conta.text = contaSorteada1[1]
			end			
		end
	end
 	
 	acerto = display.newImageRect("acerto.png", 50, 50)
	acerto.x = 99
	acerto.y = 280
	acerto.isVisible = false
	sceneGroup:insert(acerto)

	ErroX = display.newImageRect("erro.png", 50, 50)
	ErroX.x = 98
	ErroX.y = 280
	ErroX.isVisible = false
	sceneGroup:insert(ErroX)

	createQuestion()

end

function scene:show( ) end

function scene:hide( ) 
	composer.removeScene( "scene2" )
end

function scene:destroy( ) end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene