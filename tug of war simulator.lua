--https://www.roblox.com/games/14626899141
--loadstring(game:HttpGet("https://raw.githubusercontent.com/Keighta/Roblox/main/tug%20of%20war%20simulator.lua"))()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Tug of War Simulator", IntroEnabled = false})
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    game:GetService("VirtualUser"):CaptureController()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end) --antiafk
game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
	prompt.HoldDuration = 0
end) --instantproximityprompt
local Tab = Window:MakeTab({
	Name = "Main Tab",
	Icon = "rbxassetid://14903697669"
})
local knit = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):
WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services")
Tab:AddButton({
	Name = "Redeem All Codes",
	Callback = function()
      	knit:WaitForChild("CodeService"):WaitForChild("RE"):WaitForChild("Submit"):FireServer("Super_idol123")
		wait(1)
        local codeTable = require(game:GetService("ReplicatedStorage").Shared.Config.Codes)
        for redeemCode, v in pairs(codeTable) do
            knit:WaitForChild("CodeService"):WaitForChild("RE"):WaitForChild("Submit"):FireServer(redeemCode)
            wait(.1)
        end
  	end
})
Tab:AddToggle({
	Name = "Auto Training",
	Default = false,
	Callback = function(Value)
		getgenv().autoTraining = Value
		while autoTraining do
			knit:WaitForChild("ToolService"):WaitForChild("RE"):WaitForChild("Activated"):FireServer()
			task.wait()
		end
	end
})
Tab:AddToggle({
	Name = "Auto Fight Nearest",
	Default = false,
	Callback = function(Value)
		getgenv().autoFightNearest = Value
        game:GetService("ProximityPromptService").PromptShown:Connect(function(prompt)
            if autoFightNearest then
                fireproximityprompt(prompt)
                workspace:WaitForChild("Rope")
                knit:WaitForChild("FighterService"):WaitForChild("RE"):WaitForChild("Started"):FireServer()
                while workspace.Rope do
                    knit:WaitForChild("FighterService"):WaitForChild("RE"):WaitForChild("Clicked"):FireServer()
                    task.wait()
                end
            end
        end)
	end
})
Tab:AddToggle({
	Name = "Auto Claim Ticket",
	Default = false,
	Callback = function(Value)
		getgenv().autoClaimTicket = Value
		while autoClaimTicket do
			knit:WaitForChild("EnchantService"):WaitForChild("RE"):WaitForChild("Claim"):FireServer(1)
			wait(.5)
			knit:WaitForChild("EnchantService"):WaitForChild("RE"):WaitForChild("Claim"):FireServer(2)
			wait(.5)
		end
	end
})
Tab:AddToggle({
	Name = "Auto Punch Mystery Egg",
	Default = false,
	Callback = function(Value)
		getgenv().autoPunchMysteryEgg = Value
		while autoPunchMysteryEgg do
            knit:WaitForChild("PunchableService"):WaitForChild("RE"):WaitForChild("Punch"):FireServer("Mystery Egg")
            wait(.2)
        end
	end
})
Tab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		getgenv().autoRebirth = Value
		while autoRebirth do
			knit:WaitForChild("RebirthService"):WaitForChild("RE"):WaitForChild("Rebirth"):FireServer()
			wait(1)
		end
	end
})
Tab:AddToggle({
	Name = "Auto Spin",
	Default = false,
	Callback = function(Value)
		getgenv().autoSpin = Value
		while autoSpin do
			knit:WaitForChild("SpinService"):WaitForChild("RF"):WaitForChild("Spin"):InvokeServer()
			wait(.3)
		end
	end
})
local Tab2 = Window:MakeTab({
	Name = "Egg Tab",
	Icon = "rbxassetid://14903697669"
})
Tab2:AddToggle({
	Name = "Auto Hatch Egg",
	Default = false,
	Callback = function(Value)
		getgenv().autoHatchEgg = Value
		while autoHatchEgg do
			knit:WaitForChild("EggService"):WaitForChild("RE"):WaitForChild("Purchase"):FireServer(autoHatchEggEgg, 1)
			wait(3)
		end
	end
})
Tab2:AddDropdown({
	Name = "Selected Egg",
	Default = "Ninja",
	Options = {"WORLD 1: DOJO", "Ninja", "Lantern", "Samurai", "Oni", 
    "WORLD 2: SPACE DOJO", "Cyborg", "Crystal", "Bonsai", "Space", 
    "WORLD 3: CANDY ISLAND", "Candy", "Chocolate", "Gingerbread", "Jelly", 
    "WORLD 4: KRAKEN COVE", "Swashbuckled", "Bucaneer", "Traveller", "DeepSea", 
    "WORLD 5: BONZOS FUNLAND", "Dodgem", "Circus", "Grub", "Bonzo", 
    "WORLD 6: WILD WEST", "Cowboy", "Sheriff", "Wild", "Western"},
	Callback = function(Value)
		autoHatchEggEgg = Value
	end
})
Tab2:AddToggle({
	Name = "Auto Hatch Event Egg",
	Default = false,
	Callback = function(Value)
		getgenv().autoHatchEventEgg = Value
		while autoHatchEventEgg do
			knit:WaitForChild("EventService"):WaitForChild("RE"):WaitForChild("Hatch"):FireServer(1)
			wait(3)
		end
	end
})
Tab2:AddToggle({
	Name = "Auto Click Egg",
	Default = false,
	Callback = function(Value)
		getgenv().autoClickEgg = Value
        while autoClickEgg do
            if workspace.Camera:FindFirstChild("Display") then
                for i = 1, 2 do
                    game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, i == 1, nil, 0)
                end
            end
            wait()
        end
	end
})
Tab2:AddToggle({
	Name = "Auto Click & Destroy Egg",
	Default = false,
	Callback = function(Value)
		getgenv().autoClickEgg2 = Value
        workspace.Camera.ChildAdded:Connect(function(eggAnimation)
            if autoClickEgg2 then
                if eggAnimation:IsA("Model") or eggAnimation.Name == "Display" then
                    eggAnimation:Destroy()
                    for i = 1, 2 do
                        game:GetService("VirtualInputManager"):SendMouseButtonEvent(1, 1, 0, i == 1, nil, 0)
                    end
                end
            end
        end)
        if game:GetService("Players").LocalPlayer.PlayerGui.Hud.Flash:FindFirstChild("Flash") then
            game:GetService("Players").LocalPlayer.PlayerGui.Hud.Flash.Flash:Destroy()
        end
	end
})
local CreditTab = Window:MakeTab({
	Name = ".gg/ugcleaks",
	Icon = "rbxassetid://14903697669"
})
CreditTab:AddLabel("discord.gg/ugcleaks")
CreditTab:AddButton({
    Name = "Copy discord invite link to clipboard",
    Callback = function()
        local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
        clipBoard("discord.gg/ugcleaks")
        OrionLib:MakeNotification({
        Name = "Link copied!",
        Content = "discord.gg/ugcleaks",
        Image = "rbxassetid://14903697669",
        Time = 3
        })
    end
})
OrionLib:Init()
