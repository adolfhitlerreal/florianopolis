if not game:IsLoaded() then
	game.Loaded:Wait()
end

--- Player
local killscript = false
local admins = {}
local plr = game:GetService("Players").LocalPlayer

-- Anti !help

local event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents
event.OnMessageDoneFiltering.OnClientEvent:Connect(function(msg)
	if not killscript then 
		if string.match(msg.Message, ":jail "..plr.Name) or string.match(msg.Message, ":jail "..plr.DisplayName) then 
			local r = messagebox(string.format("Admin %s usou o comando :jail em voce. Sair?", msg.FromSpeaker), "AVISO", 4)
			if r == 6 then 
				plr:Kick("Você foi expulso para evitar :jail de administradores.")
			end
		end
	end
end)
spawn(function()
	game:GetService("Players").PlayerAdded:Connect(function(plr)
		if not killscript then
			if not plr.Character then 
				plr.CharacterAdded:Wait()
				wait(1)
			end
			if plr.Character:FindFirstChild("Passes") and plr.Character.Passes:FindFirstChild("PassesTexto") and string.match(plr.Character.Passes.PassesTexto.Text,"🛡") then 
				print("ADMIN ENCONTRADO : "..v.Name.." "..v.Character.Passes.PassesTexto.Text)
				local sairdojogo = messagebox(string.format("Admin %s entrou no jogo, Sair?", plr.Name), "AVISO",4)
				if sairdojogo == 6 then 
					plr:Kick("Você foi expulso para evitar administradores.")
				end
			end
		end
	end)
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do 
		s,e = pcall(function()
			if string.match(v.Character.Passes.PassesTexto.Text,"🛡") then 
				table.insert(admins, v)
				print("ADMIN ENCONTRADO : "..v.Name.." "..v.Character.Passes.PassesTexto.Text)
			end
		end)
	end
	if #admins > 0 then
		local sairdojogo = messagebox(string.format("%s admin(s) foram encontrado no seu jogo, Sair?", #admins), "AVISO",4)
		if sairdojogo == 6 then 
			plr:Kick("Você foi expulso para evitar administradores.")
		end
	end
end)
--- Functions 

-- Teleport Function

local tinfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear)

function teleport_player(pos)
	local twen = game:GetService("TweenService"):Create(plr.Character.HumanoidRootPart, tinfo, {["CFrame"] = pos})
	twen:Play()
	return twen
end


--- GUI 

local florianopolis = Instance.new("ScreenGui")
florianopolis.Name = "florianopolis"
florianopolis.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
if gethui then 
	florianopolis.Parent = gethui()
else 
	florianopolis.Parent = game.CoreGui
end

local dragger = Instance.new("Frame")
dragger.Name = "dragger"
dragger.Size = UDim2.new(0, 486, 0, 18)
dragger.Position = UDim2.new(0.0984315, 0, 0.3345196, 0)
dragger.BorderSizePixel = 0
dragger.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
dragger.Active = true 
dragger.Draggable = true
dragger.Parent = florianopolis


local main = Instance.new("Frame")
main.Name = "main"
main.Size = UDim2.new(0, 486, 0, 230)
main.Position = UDim2.new(-0.00084, 0, 0.9968855, 0)
main.BorderSizePixel = 0
main.BackgroundColor3 = Color3.fromRGB(61, 61, 61)
main.Parent = dragger

local sidebar = Instance.new("Frame")
sidebar.Name = "sidebar"
sidebar.Size = UDim2.new(0, 100, 0, 220)
sidebar.BorderSizePixel = 0
sidebar.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
sidebar.Parent = main

local homebtn = Instance.new("TextButton")
homebtn.Name = "homebtn"
homebtn.Size = UDim2.new(0, 100, 0, 30)
homebtn.Position = UDim2.new(0, 0, 0, 0)
homebtn.BorderSizePixel = 0
homebtn.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
homebtn.FontSize = Enum.FontSize.Size14
homebtn.TextSize = 14
homebtn.TextColor3 = Color3.fromRGB(255, 255, 255)
homebtn.Text = "Início"
homebtn.Font = Enum.Font.SourceSans
homebtn.Parent = sidebar

local tpbtn = Instance.new("TextButton")
tpbtn.Name = "tpbtn"
tpbtn.Size = UDim2.new(0, 100, 0, 30)
tpbtn.Position = UDim2.new(0, 0, 0.1363637, 0)
tpbtn.BorderSizePixel = 0
tpbtn.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
tpbtn.FontSize = Enum.FontSize.Size14
tpbtn.TextSize = 14
tpbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
tpbtn.Text = "Teletransporte"
tpbtn.Font = Enum.Font.SourceSans
tpbtn.Parent = sidebar

local jobbtn = Instance.new("TextButton")
jobbtn.Name = "jobbtn"
jobbtn.Size = UDim2.new(0, 100, 0, 30)
jobbtn.Position = UDim2.new(0, 0, 0.2727273, 0)
jobbtn.BorderSizePixel = 0
jobbtn.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
jobbtn.FontSize = Enum.FontSize.Size14
jobbtn.TextSize = 14
jobbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
jobbtn.Text = "Trabalho"
jobbtn.Font = Enum.Font.SourceSans
jobbtn.Parent = sidebar

local otherbtn = Instance.new("TextButton")
otherbtn.Name = "otherbtn"
otherbtn.Size = UDim2.new(0, 100, 0, 30)
otherbtn.Position = UDim2.new(0, 0, 0.409091, 0)
otherbtn.BorderSizePixel = 0
otherbtn.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
otherbtn.FontSize = Enum.FontSize.Size14
otherbtn.TextSize = 14
otherbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
otherbtn.Text = "Outros"
otherbtn.Font = Enum.Font.SourceSans
otherbtn.Parent = sidebar

local testbtn = Instance.new("TextButton")
testbtn.Name = "testbtn"
testbtn.Size = UDim2.new(0, 100, 0, 30)
testbtn.Position = UDim2.new(0, 0, 0.5454546, 0)
testbtn.BorderSizePixel = 0
testbtn.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
testbtn.FontSize = Enum.FontSize.Size14
testbtn.TextSize = 14
testbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
testbtn.Text = "Experimental"
testbtn.Font = Enum.Font.SourceSans
testbtn.Parent = sidebar

local version_ = Instance.new("TextLabel")
version_.Name = "version"
version_.Size = UDim2.new(0, 100, 0, 43)
version_.BorderColor3 = Color3.fromRGB(27, 42, 53)
version_.BackgroundTransparency = 0.5
version_.Position = UDim2.new(0, 0, 0.6521741, 0)
version_.BorderSizePixel = 0
version_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
version_.FontSize = Enum.FontSize.Size14
version_.TextSize = 14
version_.TextColor3 = Color3.fromRGB(255, 255, 255)
version_.Text = "versão 1.2.4 \"público\""
version_.TextWrapped = true
version_.Font = Enum.Font.SourceSans
version_.TextWrap = true
version_.Parent = main

local slection = Instance.new("Frame")
slection.Name = "slection"
slection.Size = UDim2.new(0, 269, 0, 219)
slection.BackgroundTransparency = 1
slection.Position = UDim2.new(0.2710027, 0, 0, 0)
slection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
slection.Parent = main

local homesl = Instance.new("Frame")
homesl.Name = "homesl"
homesl.Size = UDim2.new(0, 269, 0, 219)
homesl.BackgroundTransparency = 1
homesl.Position = UDim2.new(-0.0003728, 0, 0.0045662, 0)
homesl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
homesl.Parent = slection

local txtdeco1 = Instance.new("TextLabel")
txtdeco1.Name = "txtdeco1"
txtdeco1.Size = UDim2.new(0, 235, 0, 20)
txtdeco1.Position = UDim2.new(0.0610048, 0, 0.0410959, 0)
txtdeco1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
txtdeco1.FontSize = Enum.FontSize.Size14
txtdeco1.TextSize = 14
txtdeco1.TextColor3 = Color3.fromRGB(255, 255, 255)
txtdeco1.Text = "CONSOLE"
txtdeco1.Font = Enum.Font.SourceSans
txtdeco1.Parent = homesl

local consolebox = Instance.new("TextBox")
consolebox.Name = "consolebox"
consolebox.SizeConstraint = Enum.SizeConstraint.RelativeYY
consolebox.Size = UDim2.new(0, 235, 0, 171)
consolebox.Position = UDim2.new(0.0594796, 0, 0.1780822, 0)
consolebox.BorderSizePixel = 0
consolebox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
consolebox.FontSize = Enum.FontSize.Size10
consolebox.TextYAlignment = Enum.TextYAlignment.Top
consolebox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
consolebox.TextSize = 10
consolebox.TextColor3 = Color3.fromRGB(255, 255, 255)
consolebox.Text = ""
consolebox.PlaceholderText = ""
consolebox.CursorPosition = -1
consolebox.Font = Enum.Font.Ubuntu
consolebox.TextXAlignment = Enum.TextXAlignment.Left
consolebox.Parent = homesl
consolebox.ClearTextOnFocus = false
consolebox.TextEditable = false

function homeconsoleprint(text)
	consolebox.Text = consolebox.Text.. text.."\n"
end

local jobsl = Instance.new("Frame")
jobsl.Name = "jobsl"
jobsl.Visible = false
jobsl.Size = UDim2.new(0, 269, 0, 219)
jobsl.BackgroundTransparency = 1
jobsl.Position = UDim2.new(-0.0003728, 0, 0.0045662, 0)
jobsl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
jobsl.Parent = slection

local mecjob = Instance.new("Frame")
mecjob.Name = "mecjob"
mecjob.Size = UDim2.new(0, 101, 0, 51)
mecjob.BackgroundTransparency = 0.78
mecjob.Position = UDim2.new(0.0594796, 0, 0.716895, 0)
mecjob.BorderSizePixel = 0
mecjob.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mecjob.Parent = jobsl

local mecjobtitle = Instance.new("TextLabel")
mecjobtitle.Name = "mecjobtitle"
mecjobtitle.Size = UDim2.new(0, 101, 0, 17)
mecjobtitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
mecjobtitle.BackgroundTransparency = 1
mecjobtitle.BorderSizePixel = 0
mecjobtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mecjobtitle.FontSize = Enum.FontSize.Size14
mecjobtitle.TextSize = 14
mecjobtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
mecjobtitle.Text = "Mecânico"
mecjobtitle.TextWrapped = true
mecjobtitle.Font = Enum.Font.SourceSans
mecjobtitle.TextWrap = true
mecjobtitle.TextScaled = true
mecjobtitle.Parent = mecjob

local prodabtn = Instance.new("TextButton")
prodabtn.Name = "prodabtn"
prodabtn.Size = UDim2.new(0, 77, 0, 22)
prodabtn.Position = UDim2.new(0.1119445, 0, 0.4480398, 0)
prodabtn.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
prodabtn.FontSize = Enum.FontSize.Size14
prodabtn.TextStrokeTransparency = 0
prodabtn.TextSize = 14
prodabtn.TextColor3 = Color3.fromRGB(255, 255, 255)
prodabtn.Text = "Pegar Roda"
prodabtn.Font = Enum.Font.SourceSans
prodabtn.Parent = mecjob

local txtdeco2 = Instance.new("TextLabel")
txtdeco2.Name = "txtdeco2"
txtdeco2.Size = UDim2.new(0, 200, 0, 20)
txtdeco2.BackgroundTransparency = 1
txtdeco2.Position = UDim2.new(0.126394, 0, -0.0045662, 0)
txtdeco2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
txtdeco2.FontSize = Enum.FontSize.Size14
txtdeco2.TextSize = 14
txtdeco2.TextColor3 = Color3.fromRGB(255, 255, 255)
txtdeco2.Text = "Trabalho Ilegal"
txtdeco2.Font = Enum.Font.SourceSans
txtdeco2.Parent = jobsl

local txtdeco3 = Instance.new("TextLabel")
txtdeco3.Name = "txtdeco3"
txtdeco3.Size = UDim2.new(0, 200, 0, 20)
txtdeco3.BackgroundTransparency = 1
txtdeco3.Position = UDim2.new(0.126394, 0, 0.4520548, 0)
txtdeco3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
txtdeco3.FontSize = Enum.FontSize.Size14
txtdeco3.TextSize = 14
txtdeco3.TextColor3 = Color3.fromRGB(255, 255, 255)
txtdeco3.Text = "Trabalho Legal"
txtdeco3.Font = Enum.Font.SourceSans
txtdeco3.Parent = jobsl

local mecjob1 = Instance.new("Frame")
mecjob1.Name = "mecjob"
mecjob1.Size = UDim2.new(0, 236, 0, 51)
mecjob1.BackgroundTransparency = 0.78
mecjob1.Position = UDim2.new(0.0594796, 0, 0.1324201, 0)
mecjob1.BorderSizePixel = 0
mecjob1.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mecjob1.Parent = jobsl

local mecjobtitle1 = Instance.new("TextLabel")
mecjobtitle1.Name = "mecjobtitle"
mecjobtitle1.Size = UDim2.new(0, 79, 0, 17)
mecjobtitle1.BorderColor3 = Color3.fromRGB(0, 0, 0)
mecjobtitle1.BackgroundTransparency = 1
mecjobtitle1.BorderSizePixel = 0
mecjobtitle1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mecjobtitle1.FontSize = Enum.FontSize.Size14
mecjobtitle1.TextSize = 14
mecjobtitle1.TextColor3 = Color3.fromRGB(255, 255, 255)
mecjobtitle1.Text = "Roubo"
mecjobtitle1.TextWrapped = true
mecjobtitle1.Font = Enum.Font.SourceSans
mecjobtitle1.TextWrap = true
mecjobtitle1.TextScaled = true
mecjobtitle1.Parent = mecjob1

local prodabtn1 = Instance.new("TextButton")
prodabtn1.Name = "prodabtn"
prodabtn1.Size = UDim2.new(0, 207, 0, 22)
prodabtn1.Position = UDim2.new(0.0483851, 0, 0.3500007, 0)
prodabtn1.BackgroundColor3 = Color3.fromRGB(67, 67, 67)
prodabtn1.FontSize = Enum.FontSize.Size14
prodabtn1.TextStrokeTransparency = 0
prodabtn1.TextSize = 14
prodabtn1.TextColor3 = Color3.fromRGB(255, 255, 255)
prodabtn1.Text = "Guardar dinheiro roubado"
prodabtn1.Font = Enum.Font.SourceSans
prodabtn1.Parent = mecjob1

local tpsl = Instance.new("Frame")
tpsl.Name = "tpsl"
tpsl.Visible = false
tpsl.Size = UDim2.new(0, 269, 0, 219)
tpsl.BackgroundTransparency = 1
tpsl.Position = UDim2.new(-0.0003728, 0, 0.0045662, 0)
tpsl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
tpsl.Parent = slection

local layouttp = Instance.new("Frame")
layouttp.Name = "layouttp"
layouttp.Size = UDim2.new(0, 346, 0, 212)
layouttp.BackgroundTransparency = 1
layouttp.Position = UDim2.new(-0.0148699, 0, 0.0273973, 0)
layouttp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
layouttp.Parent = tpsl

local bopeintp = Instance.new("TextButton")
bopeintp.Name = "bopeintp"
bopeintp.Size = UDim2.new(0, 85, 0, 22)
bopeintp.Position = UDim2.new(0.0595374, 0, 0.030366, 0)
bopeintp.BorderSizePixel = 0
bopeintp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
bopeintp.FontSize = Enum.FontSize.Size14
bopeintp.TextSize = 14
bopeintp.TextColor3 = Color3.fromRGB(255, 255, 255)
bopeintp.Text = "Base do BOPE Interior"
bopeintp.Font = Enum.Font.SourceSans
bopeintp.Parent = layouttp

local mafiaextp = Instance.new("TextButton")
mafiaextp.Name = "mafiaextp"
mafiaextp.Size = UDim2.new(0, 85, 0, 22)
mafiaextp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
mafiaextp.BorderSizePixel = 0
mafiaextp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
mafiaextp.FontSize = Enum.FontSize.Size14
mafiaextp.TextSize = 14
mafiaextp.TextColor3 = Color3.fromRGB(255, 255, 255)
mafiaextp.Text = "Base Mafia Exterior"
mafiaextp.Font = Enum.Font.SourceSans
mafiaextp.Parent = layouttp

local mcartp = Instance.new("TextButton")
mcartp.Name = "mcartp"
mcartp.Size = UDim2.new(0, 85, 0, 22)
mcartp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
mcartp.BorderSizePixel = 0
mcartp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
mcartp.FontSize = Enum.FontSize.Size14
mcartp.TextSize = 14
mcartp.TextColor3 = Color3.fromRGB(255, 255, 255)
mcartp.Text = "Minas Car Oficina"
mcartp.Font = Enum.Font.SourceSans
mcartp.Parent = layouttp

local gdpextp = Instance.new("TextButton")
gdpextp.Name = "gdpextp"
gdpextp.Size = UDim2.new(0, 85, 0, 22)
gdpextp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
gdpextp.BorderSizePixel = 0
gdpextp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
gdpextp.FontSize = Enum.FontSize.Size14
gdpextp.TextSize = 14
gdpextp.TextColor3 = Color3.fromRGB(255, 255, 255)
gdpextp.Text = "Base GDP Exterior"
gdpextp.Font = Enum.Font.SourceSans
gdpextp.Parent = layouttp

local hospextp = Instance.new("TextButton")
hospextp.Name = "hospextp"
hospextp.Size = UDim2.new(0, 85, 0, 22)
hospextp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
hospextp.BorderSizePixel = 0
hospextp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
hospextp.FontSize = Enum.FontSize.Size14
hospextp.TextSize = 14
hospextp.TextColor3 = Color3.fromRGB(255, 255, 255)
hospextp.Text = "Hospital Exterior"
hospextp.Font = Enum.Font.SourceSans
hospextp.Parent = layouttp

local hospintp = Instance.new("TextButton")
hospintp.Name = "hospintp"
hospintp.Size = UDim2.new(0, 85, 0, 22)
hospintp.Position = UDim2.new(0.0595374, 0, 0.1490874, 0)
hospintp.BorderSizePixel = 0
hospintp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
hospintp.FontSize = Enum.FontSize.Size14
hospintp.TextSize = 14
hospintp.TextColor3 = Color3.fromRGB(255, 255, 255)
hospintp.Text = "Hospital Interior"
hospintp.Font = Enum.Font.SourceSans
hospintp.Parent = layouttp

local ljrouptp = Instance.new("TextButton")
ljrouptp.Name = "ljrouptp"
ljrouptp.Size = UDim2.new(0, 85, 0, 22)
ljrouptp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
ljrouptp.BorderSizePixel = 0
ljrouptp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ljrouptp.FontSize = Enum.FontSize.Size14
ljrouptp.TextSize = 14
ljrouptp.TextColor3 = Color3.fromRGB(255, 255, 255)
ljrouptp.Text = "Loja de roupa"
ljrouptp.Font = Enum.Font.SourceSans
ljrouptp.Parent = layouttp

local ljcartp = Instance.new("TextButton")
ljcartp.Name = "ljcartp"
ljcartp.Size = UDim2.new(0, 85, 0, 22)
ljcartp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
ljcartp.BorderSizePixel = 0
ljcartp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ljcartp.FontSize = Enum.FontSize.Size14
ljcartp.TextSize = 14
ljcartp.TextColor3 = Color3.fromRGB(255, 255, 255)
ljcartp.Text = "Loja de carros"
ljcartp.Font = Enum.Font.SourceSans
ljcartp.Parent = layouttp

local mafiaintp = Instance.new("TextButton")
mafiaintp.Name = "mafiaintp"
mafiaintp.Size = UDim2.new(0, 85, 0, 22)
mafiaintp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
mafiaintp.BorderSizePixel = 0
mafiaintp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
mafiaintp.FontSize = Enum.FontSize.Size14
mafiaintp.TextSize = 14
mafiaintp.TextColor3 = Color3.fromRGB(255, 255, 255)
mafiaintp.Text = "Base Mafia Interior"
mafiaintp.Font = Enum.Font.SourceSans
mafiaintp.Parent = layouttp

local estcatp = Instance.new("TextButton")
estcatp.Name = "estcatp"
estcatp.Size = UDim2.new(0, 85, 0, 22)
estcatp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
estcatp.BorderSizePixel = 0
estcatp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
estcatp.FontSize = Enum.FontSize.Size14
estcatp.TextSize = 14
estcatp.TextColor3 = Color3.fromRGB(255, 255, 255)
estcatp.Text = "Estacionamento"
estcatp.Font = Enum.Font.SourceSans
estcatp.Parent = layouttp

local ljarmtp = Instance.new("TextButton")
ljarmtp.Name = "ljarmtp"
ljarmtp.Size = UDim2.new(0, 85, 0, 22)
ljarmtp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
ljarmtp.BorderSizePixel = 0
ljarmtp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ljarmtp.FontSize = Enum.FontSize.Size14
ljarmtp.TextSize = 14
ljarmtp.TextColor3 = Color3.fromRGB(255, 255, 255)
ljarmtp.Text = "Loja de arma"
ljarmtp.Font = Enum.Font.SourceSans
ljarmtp.Parent = layouttp

local pmscintp = Instance.new("TextButton")
pmscintp.Name = "pmscintp"
pmscintp.Size = UDim2.new(0, 85, 0, 22)
pmscintp.Position = UDim2.new(0.0595374, 0, 0.1490874, 0)
pmscintp.BorderSizePixel = 0
pmscintp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
pmscintp.FontSize = Enum.FontSize.Size14
pmscintp.TextSize = 14
pmscintp.TextColor3 = Color3.fromRGB(255, 255, 255)
pmscintp.Text = "Base PMSC Interior"
pmscintp.Font = Enum.Font.SourceSans
pmscintp.Parent = layouttp

local museutp = Instance.new("TextButton")
museutp.Name = "museutp"
museutp.Size = UDim2.new(0, 85, 0, 22)
museutp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
museutp.BorderSizePixel = 0
museutp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
museutp.FontSize = Enum.FontSize.Size14
museutp.TextSize = 14
museutp.TextColor3 = Color3.fromRGB(255, 255, 255)
museutp.Text = "Museu Interior"
museutp.Font = Enum.Font.SourceSans
museutp.Parent = layouttp

local rolantp = Instance.new("TextButton")
rolantp.Name = "rolantp"
rolantp.Size = UDim2.new(0, 85, 0, 22)
rolantp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
rolantp.BorderSizePixel = 0
rolantp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
rolantp.FontSize = Enum.FontSize.Size14
rolantp.TextSize = 14
rolantp.TextColor3 = Color3.fromRGB(255, 255, 255)
rolantp.Text = "Museu Exterior"
rolantp.Font = Enum.Font.SourceSans
rolantp.Parent = layouttp

local mrcatp = Instance.new("TextButton")
mrcatp.Name = "mrcatp"
mrcatp.Size = UDim2.new(0, 85, 0, 22)
mrcatp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
mrcatp.BorderSizePixel = 0
mrcatp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
mrcatp.FontSize = Enum.FontSize.Size14
mrcatp.TextSize = 14
mrcatp.TextColor3 = Color3.fromRGB(255, 255, 255)
mrcatp.Text = "Mercearia do Braia [A]"
mrcatp.Font = Enum.Font.SourceSans
mrcatp.Parent = layouttp

local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.FillDirectionMaxCells = 10
UIGridLayout.CellSize = UDim2.new(0, 110, 0, 20)
UIGridLayout.Parent = layouttp

local mrcbtp = Instance.new("TextButton")
mrcbtp.Name = "mrcbtp"
mrcbtp.Size = UDim2.new(0, 85, 0, 22)
mrcbtp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
mrcbtp.BorderSizePixel = 0
mrcbtp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
mrcbtp.FontSize = Enum.FontSize.Size14
mrcbtp.TextSize = 14
mrcbtp.TextColor3 = Color3.fromRGB(255, 255, 255)
mrcbtp.Text = "Mercearia do Toretto [B]"
mrcbtp.Font = Enum.Font.SourceSans
mrcbtp.Parent = layouttp

local mrcctp = Instance.new("TextButton")
mrcctp.Name = "mrcctp"
mrcctp.Size = UDim2.new(0, 85, 0, 22)
mrcctp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
mrcctp.BorderSizePixel = 0
mrcctp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
mrcctp.FontSize = Enum.FontSize.Size14
mrcctp.TextSize = 14
mrcctp.TextColor3 = Color3.fromRGB(255, 255, 255)
mrcctp.Text = "Mercearia do Ham [C]"
mrcctp.Font = Enum.Font.SourceSans
mrcctp.Parent = layouttp

local mrcdtp = Instance.new("TextButton")
mrcdtp.Name = "mrcdtp"
mrcdtp.Size = UDim2.new(0, 85, 0, 22)
mrcdtp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
mrcdtp.BorderSizePixel = 0
mrcdtp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
mrcdtp.FontSize = Enum.FontSize.Size14
mrcdtp.TextSize = 14
mrcdtp.TextColor3 = Color3.fromRGB(255, 255, 255)
mrcdtp.Text = "Mercearia da Neela [D]"
mrcdtp.Font = Enum.Font.SourceSans
mrcdtp.Parent = layouttp

local favelatp = Instance.new("TextButton")
favelatp.Name = "favelatp"
favelatp.Size = UDim2.new(0, 85, 0, 22)
favelatp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
favelatp.BorderSizePixel = 0
favelatp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
favelatp.FontSize = Enum.FontSize.Size14
favelatp.TextSize = 14
favelatp.TextColor3 = Color3.fromRGB(255, 255, 255)
favelatp.Text = "Favela Frente"
favelatp.Font = Enum.Font.SourceSans
favelatp.Parent = layouttp

local bfsintp = Instance.new("TextButton")
bfsintp.Name = "bfsintp"
bfsintp.Size = UDim2.new(0, 85, 0, 22)
bfsintp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
bfsintp.BorderSizePixel = 0
bfsintp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
bfsintp.FontSize = Enum.FontSize.Size14
bfsintp.TextSize = 14
bfsintp.TextColor3 = Color3.fromRGB(255, 255, 255)
bfsintp.Text = "Base FS Interior"
bfsintp.Font = Enum.Font.SourceSans
bfsintp.Parent = layouttp

local rlantp = Instance.new("TextButton")
rlantp.Name = "rlantp"
rlantp.Size = UDim2.new(0, 85, 0, 22)
rlantp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
rlantp.BorderSizePixel = 0
rlantp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
rlantp.FontSize = Enum.FontSize.Size14
rlantp.TextSize = 14
rlantp.TextColor3 = Color3.fromRGB(255, 255, 255)
rlantp.Text = "Ronaldo Lanches"
rlantp.Font = Enum.Font.SourceSans
rlantp.Parent = layouttp

local pmscextp = Instance.new("TextButton")
pmscextp.Name = "pmscextp"
pmscextp.Size = UDim2.new(0, 85, 0, 22)
pmscextp.Position = UDim2.new(0.0595374, 0, 0.1490874, 0)
pmscextp.BorderSizePixel = 0
pmscextp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
pmscextp.FontSize = Enum.FontSize.Size14
pmscextp.TextSize = 14
pmscextp.TextColor3 = Color3.fromRGB(255, 255, 255)
pmscextp.Text = "Base PMSC Exterior"
pmscextp.Font = Enum.Font.SourceSans
pmscextp.Parent = layouttp

local bfsextp = Instance.new("TextButton")
bfsextp.Name = "bfsextp"
bfsextp.Size = UDim2.new(0, 85, 0, 22)
bfsextp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
bfsextp.BorderSizePixel = 0
bfsextp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
bfsextp.FontSize = Enum.FontSize.Size14
bfsextp.TextSize = 14
bfsextp.TextColor3 = Color3.fromRGB(255, 255, 255)
bfsextp.Text = "Base FS Exterior"
bfsextp.Font = Enum.Font.SourceSans
bfsextp.Parent = layouttp

local gdpintp = Instance.new("TextButton")
gdpintp.Name = "gdpintp"
gdpintp.Size = UDim2.new(0, 85, 0, 22)
gdpintp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
gdpintp.BorderSizePixel = 0
gdpintp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
gdpintp.FontSize = Enum.FontSize.Size14
gdpintp.TextSize = 14
gdpintp.TextColor3 = Color3.fromRGB(255, 255, 255)
gdpintp.Text = "Base GDP Interior"
gdpintp.Font = Enum.Font.SourceSans
gdpintp.Parent = layouttp

local bopeextp = Instance.new("TextButton")
bopeextp.Name = "bopeextp"
bopeextp.Size = UDim2.new(0, 85, 0, 22)
bopeextp.Position = UDim2.new(0.0595374, 0, 0.1490874, 0)
bopeextp.BorderSizePixel = 0
bopeextp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
bopeextp.FontSize = Enum.FontSize.Size14
bopeextp.TextSize = 14
bopeextp.TextColor3 = Color3.fromRGB(255, 255, 255)
bopeextp.Text = "Base do BOPE Exterior"
bopeextp.Font = Enum.Font.SourceSans
bopeextp.Parent = layouttp

local pftinp = Instance.new("TextButton")
pftinp.Name = "pftinp"
pftinp.Size = UDim2.new(0, 85, 0, 22)
pftinp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
pftinp.BorderSizePixel = 0
pftinp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
pftinp.FontSize = Enum.FontSize.Size14
pftinp.TextSize = 14
pftinp.TextColor3 = Color3.fromRGB(255, 255, 255)
pftinp.Text = "PF Interior"
pftinp.Font = Enum.Font.SourceSans
pftinp.Parent = layouttp

local pfextp = Instance.new("TextButton")
pfextp.Name = "pfextp"
pfextp.Size = UDim2.new(0, 85, 0, 22)
pfextp.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
pfextp.BorderSizePixel = 0
pfextp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
pfextp.FontSize = Enum.FontSize.Size14
pfextp.TextSize = 14
pfextp.TextColor3 = Color3.fromRGB(255, 255, 255)
pfextp.Text = "PF Exterior"
pfextp.Font = Enum.Font.SourceSans
pfextp.Parent = layouttp

local otherssl = Instance.new("Frame")
otherssl.Name = "otherssl"
otherssl.Visible = false
otherssl.Size = UDim2.new(0, 269, 0, 219)
otherssl.BackgroundTransparency = 1
otherssl.Position = UDim2.new(-0.0003728, 0, 0.0045662, 0)
otherssl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
otherssl.Parent = slection

local infiniteyield = Instance.new("TextButton")
infiniteyield.Name = "infiniteyield"
infiniteyield.Size = UDim2.new(0, 85, 0, 22)
infiniteyield.Position = UDim2.new(0.0595374, 0, 0.2860737, 0)
infiniteyield.BorderSizePixel = 0
infiniteyield.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
infiniteyield.FontSize = Enum.FontSize.Size14
infiniteyield.TextSize = 14
infiniteyield.TextColor3 = Color3.fromRGB(255, 255, 255)
infiniteyield.Text = "Infinite Yield"
infiniteyield.Font = Enum.Font.SourceSans
infiniteyield.Parent = otherssl

local unnamedesp = Instance.new("TextButton")
unnamedesp.Name = "unnamedesp"
unnamedesp.Size = UDim2.new(0, 85, 0, 22)
unnamedesp.Position = UDim2.new(0.0595374, 0, 0.4458911, 0)
unnamedesp.BorderSizePixel = 0
unnamedesp.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
unnamedesp.FontSize = Enum.FontSize.Size14
unnamedesp.TextSize = 14
unnamedesp.TextColor3 = Color3.fromRGB(255, 255, 255)
unnamedesp.Text = "Unnamed ESP"
unnamedesp.Font = Enum.Font.SourceSans
unnamedesp.Parent = otherssl

local experimentalsl = Instance.new("Frame")
experimentalsl.Name = "experimentalsl"
experimentalsl.Visible = false
experimentalsl.Size = UDim2.new(0, 269, 0, 219)
experimentalsl.BackgroundTransparency = 1
experimentalsl.Position = UDim2.new(-0.0003728, 0, 0.0045662, 0)
experimentalsl.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
experimentalsl.Parent = slection

local txtdeco4 = Instance.new("TextLabel")
txtdeco4.Name = "txtdeco4"
txtdeco4.Size = UDim2.new(0, 331, 0, 39)
txtdeco4.BackgroundTransparency = 1
txtdeco4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
txtdeco4.FontSize = Enum.FontSize.Size14
txtdeco4.TextSize = 14
txtdeco4.TextColor3 = Color3.fromRGB(238, 238, 238)
txtdeco4.Text = "Incompleto"
txtdeco4.TextWrapped = true
txtdeco4.Font = Enum.Font.SourceSans
txtdeco4.TextWrap = true
txtdeco4.TextScaled = true
txtdeco4.Parent = experimentalsl

local credit = Instance.new("TextLabel")
credit.Name = "credit"
credit.Size = UDim2.new(0, 100, 0, 34)
credit.BorderColor3 = Color3.fromRGB(27, 42, 53)
credit.BackgroundTransparency = 0.5
credit.Position = UDim2.new(0, 0, 0.8409092, 0)
credit.BorderSizePixel = 0
credit.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
credit.FontSize = Enum.FontSize.Size14
credit.TextSize = 14
credit.TextColor3 = Color3.fromRGB(255, 255, 255)
credit.Text = "criador : trollo_v3"
credit.TextWrapped = true
credit.Font = Enum.Font.SourceSans
credit.TextWrap = true
credit.Parent = main

local title = Instance.new("TextLabel")
title.Name = "title"
title.Size = UDim2.new(0, 205, 0, 17)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0.0144033, 0, 0, 0)
title.BorderSizePixel = 0
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.FontSize = Enum.FontSize.Size14
title.TextSize = 14
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Florianópolis GUI - Início"
title.Font = Enum.Font.SourceSansBold
title.TextXAlignment = Enum.TextXAlignment.Left

title.Parent = dragger

local close_btn = Instance.new("TextButton")
close_btn.Name = "close_btn"
close_btn.Size = UDim2.new(0, 17, 0, 17)
close_btn.BackgroundTransparency = 1
close_btn.Position = UDim2.new(0.9512195, 0, 0, 0)
close_btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
close_btn.FontSize = Enum.FontSize.Size14
close_btn.TextSize = 14
close_btn.TextColor3 = Color3.fromRGB(255, 255, 255)
close_btn.Text = "X"
close_btn.Font = Enum.Font.GothamBold
close_btn.Parent = dragger

local min_btn = Instance.new("TextButton")
min_btn.Name = "min_btn"
min_btn.Size = UDim2.new(0, 17, 0, 17)
min_btn.BackgroundTransparency = 1
min_btn.Position = UDim2.new(0.905149, 0, 0, 0)
min_btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
min_btn.FontSize = Enum.FontSize.Size14
min_btn.TextSize = 14
min_btn.TextColor3 = Color3.fromRGB(255, 255, 255)
min_btn.Text = "-"
min_btn.Font = Enum.Font.GothamBold
min_btn.Parent = dragger

--- Script 
s,e = pcall(function()
	close_btn.MouseButton1Down:Connect(function()
		killscript = true
		florianopolis:Destroy()
		script.Disabled = true
		script:Destroy()
	end)

	min_btn.MouseButton1Down:Connect(function()
		main.Visible = not main.Visible
	end)

	infiniteyield.MouseButton1Down:Connect(function()
		local iy = loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))
		local s1,e1 = pcall(iy)
		if not s1 and e1 then 
			for i,v in pairs(slection:GetChildren()) do 
				v.Visible = false
			end
			homesl.Visible = true
			title.Text = "Florianópolis GUI - Início"
			homeconsoleprint("INFINITE YIELD ADMIN ERROR : \n"..tostring(e))
		end
	end)

	unnamedesp.MouseButton1Down:Connect(function()
		local uesp = loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua"))
		local s1,e1 = pcall(uesp)
		if not s1 and e1 then 
			for i,v in pairs(slection:GetChildren()) do 
				v.Visible = false
			end
			homesl.Visible = true
			title.Text = "Florianópolis GUI - Início"
			homeconsoleprint("UNNAMED ESP ERROR : \n"..tostring(e))
		end
	end)

	homebtn.MouseButton1Down:Connect(function()
		for i,v in pairs(slection:GetChildren()) do 
			v.Visible = false
		end
		homesl.Visible = true
		title.Text = "Florianópolis GUI - Início"
	end)

	otherbtn.MouseButton1Down:Connect(function()
		for i,v in pairs(slection:GetChildren()) do 
			v.Visible = false
		end
		otherssl.Visible = true
		title.Text = "Florianópolis GUI - Outros"
	end)

	jobbtn.MouseButton1Down:Connect(function()
		for i,v in pairs(slection:GetChildren()) do 
			v.Visible = false
		end
		jobsl.Visible = true
		title.Text = "Florianópolis GUI - Trabalho"
	end)

	testbtn.MouseButton1Down:Connect(function()
		for i,v in pairs(slection:GetChildren()) do 
			v.Visible = false
		end
		experimentalsl.Visible = true
		title.Text = "Florianópolis GUI - Experimental"
	end)

	tpbtn.MouseButton1Down:Connect(function()
		for i,v in pairs(slection:GetChildren()) do 
			v.Visible = false
		end
		tpsl.Visible = true
		title.Text = "Florianópolis GUI - Teletransporte"
	end)
	local function assign_coord(btn, pos)
		if btn then
			btn.MouseButton1Down:Connect(function()
				teleport_player(pos)
			end)
		end
	end

	prodabtn.MouseButton1Down:Connect(function()
		prcs = true

		PreviousPosition = plr.Character.HumanoidRootPart.CFrame

		local MainTweenRoda = teleport_player(game:GetService("Workspace").Roda.CFrame)
		MainTweenRoda.Completed:Wait()

		wait(0.5)
		fireproximityprompt(game:GetService("Workspace").Roda.PegarRoda, 0)

		local AltTween = teleport_player(PreviousPosition)
		AltTween.Completed:Wait()

		prcs = false
	end)

	prodabtn1.MouseButton1Down:Connect(function()
		prcs = true

		PreviousPosition = plr.Character.HumanoidRootPart.CFrame

		local MainTweenDR = teleport_player(game:GetService("Workspace").EntregarRoubo.CFrame)
		MainTweenDR.Completed:Wait()

		wait(0.1)
		firetouchinterest(plr.Character.HumanoidRootPart,game:GetService("Workspace").EntregarRoubo,1)
		wait(0.1)
		firetouchinterest(plr.Character.HumanoidRootPart,game:GetService("Workspace").EntregarRoubo,0)

		local AltTween = teleport_player(PreviousPosition)
		AltTween.Completed:Wait()

		prcs = false
	end)

	assign_coord(bopeintp, CFrame.new(383, -12, -211))
	assign_coord(mcartp, CFrame.new(248, 27, -116))
	assign_coord(gdpextp, CFrame.new(248, 27, -116))
	assign_coord(hospextp, CFrame.new(685, 46, 187))
	assign_coord(ljrouptp, CFrame.new(883, 55, -96))
	assign_coord(mafiaintp, CFrame.new(58, 19, -1374))
	assign_coord(estcatp, CFrame.new(-11, 16, 197))
	assign_coord(ljarmtp, CFrame.new(-92, 12, 131) )
	assign_coord(pmscintp, CFrame.new(385, -12, -137))
	assign_coord(museutp, CFrame.new(469, 19, -4))
	assign_coord(rolantp, CFrame.new(564, 40, 28))
	assign_coord(mrcatp, CFrame.new(-235, 6, 481))
	assign_coord(mrcbtp, CFrame.new(-61, 13, -318))
	assign_coord(mrcctp, CFrame.new(-210, 7, -691))
	assign_coord(mrcdtp, CFrame.new(-210, 7, -1526))
	assign_coord(favelatp, CFrame.new(-729, 3, -2067))
	assign_coord(bfsintp, CFrame.new(-328, 137, -2094))
	assign_coord(rlantp, CFrame.new(-100, 12, -1091))
	assign_coord(pmscextp, CFrame.new(82, 19, 207))
	assign_coord(bfsextp, CFrame.new(-322, 137, -2178))
	assign_coord(gdpintp, CFrame.new(-357, 4, -90))
	assign_coord(bopeextp, CFrame.new(79, 19, -1002))
	assign_coord(hospintp, CFrame.new(697, 47, 295))
	assign_coord(mafiaextp, CFrame.new(17, 17, -1390))
	assign_coord(pftinp, CFrame.new(404, 33, -760))
	assign_coord(pfextp, CFrame.new(342, 31, -751))
	assign_coord(ljcartp, CFrame.new(-123, 11, -64))
	-- Museu Interior, Museu Exterior
	homeconsoleprint("Script carregado com sucesso")
end)

if not s and e then 
	for i,v in pairs(slection:GetChildren()) do 
		v.Visible = false
	end
	homesl.Visible = true
	title.Text = "Florianópolis GUI - Início"
	homeconsoleprint("ERROR : \n"..tostring(e))
	homeconsoleprint("\FECHANDO EM 10 SEGUNDOS")
	wait(10)
	killscript = true
	florianopolis:Destroy()
	script.Disabled = true
	script:Destroy()
end
