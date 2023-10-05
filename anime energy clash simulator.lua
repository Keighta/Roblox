--https://www.roblox.com/games/13370783664
--loadstring(game:HttpGet("https://pastebin.com/raw/8aqpmaAr"))()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Anime Energy Clash Simulator", IntroEnabled = false})
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
local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remote")
Tab:AddButton({
    Name = "Inf Gems",
    Callback = function()
        remote:WaitForChild("Function"):WaitForChild("Enchant"):WaitForChild("[C-S]DoEnchant"):InvokeServer("", -math.huge)
    end
})
Tab:AddToggle({
	Name = "Auto Training",
	Default = false,
	Callback = function(Value)
		getgenv().autoTraining = Value
		while autoTraining do
			remote:WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]PlayerClick"):FireServer()
			task.wait()
		end
	end
})
Tab:AddToggle({
	Name = "Auto Equip Best Sword",
	Default = false,
	Callback = function(Value)
		getgenv().autoEquipBestSword = Value
		while autoEquipBestSword do
			remote:WaitForChild("Event"):WaitForChild("Skin"):WaitForChild("[C-S]TryEquipBestSkin"):FireServer("p1")
			wait(3)
		end
	end
})
Tab:AddToggle({
	Name = "Auto Equip Best Ki",
	Default = false,
	Callback = function(Value)
		getgenv().autoEquipBestKi = Value
		while autoEquipBestKi do
			remote:WaitForChild("Event"):WaitForChild("Skin"):WaitForChild("[C-S]TryEquipBestSkin"):FireServer("p2")
			wait(3)
		end
	end
})
local Section = Tab:AddSection({
	Name = "Fight any boss once, then it will loop kills in the background"
})
Tab:AddToggle({
	Name = "Auto Win",
	Default = false,
	Callback = function(Value)
		getgenv().autoWin = Value
		while autoWin do
			remote:WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]PlayerPKEnd"):FireServer(true)
			task.wait()
		end
	end
})
Tab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(Value)
		getgenv().autoRebirth = Value
		while autoRebirth do
			remote:WaitForChild("Event"):WaitForChild("Rebirth"):WaitForChild("[C-S]TryBuyRebirth"):FireServer()
			wait()
		end
	end
})
Tab:AddSlider({
	Name = "Minimum rebirth to ascend",
	Min = 10,
	Max = 100,
	Default = 69,
	Color = Color3.fromRGB(100,100,100),
	Increment = 1,
	ValueName = "rebirth",
	Callback = function(Value)
        minRebirth = Value
	end
})
Tab:AddToggle({
	Name = "Auto Ascend",
	Default = false,
	Callback = function(Value)
		getgenv().autoAscend = Value
        local lp = game:GetService("Players").LocalPlayer
		while autoAscend do
            if game.Players.LocalPlayer.Eco.rebirth.Value >= minRebirth then
                remote:WaitForChild("Event"):WaitForChild("RebirthShop"):WaitForChild("[C-S]TryExchangeStar"):FireServer(lp)
            end
            wait(.1)
        end
	end
})
Tab:AddToggle({
	Name = "Auto Craft Equipment",
	Default = false,
	Callback = function(Value)
		getgenv().autoCraftEquipment = Value
		while autoCraftEquipment do
			remote:WaitForChild("Function"):WaitForChild("Equipment"):WaitForChild("[C-S]DoLuck"):InvokeServer()
			wait()
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
			remote:WaitForChild("Function"):WaitForChild("Luck"):WaitForChild("[C-S]DoLuck"):InvokeServer(autoHatchEggEgg)
			wait()
		end
	end
})
Tab2:AddDropdown({
	Name = "Selected Egg",
	Default = "Egg1",
	Options = {"Gem1", "=== WORLD 1 ===", "Egg1", "Egg2", "Egg3", "Egg4", 
    "=== WORLD 2 ===", "Egg5", "Egg6", "Egg7", "Egg8", "Egg9", "Egg10", 
    "=== WORLD 3 ===", "Egg11", "Egg12", "Egg13", "Egg14", "Egg15", "Egg16", 
    "=== WORLD 4 ===", "Egg17", "Egg18", "Egg19", "Egg20", "Egg21", "Egg22", 
    "=== WORLD 5 ===", "Egg23", "Egg24", "Egg25", "Egg26", "Egg27", 
    "=== WORLD 6 ===", "Egg28", "Egg29", "Egg30"},
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
			remote:WaitForChild("Event"):WaitForChild("Events"):WaitForChild("[C-S]TryGetEventReward"):FireServer("E700")
			wait(.1)
		end
	end
})
local Section = Tab2:AddSection({
	Name = "Warning! Crafting heroes may raise your ping; it's a game bug"
})
Tab2:AddToggle({
	Name = "Auto Craft All",
	Default = false,
	Callback = function(Value)
		getgenv().autoCraftAll = Value
		while autoCraftAll do
			remote:WaitForChild("Event"):WaitForChild("Pet"):WaitForChild("[C-S]TryautoCraftAll"):FireServer()
			wait(5)
		end
	end
})
local Tab3 = Window:MakeTab({
	Name = "TP Tab",
	Icon = "rbxassetid://14903697669"
})
local tp = remote:WaitForChild("Event"):WaitForChild("World"):WaitForChild("[C-S]ChangeWorld")
local Section = Tab3:AddSection({
	Name = "You have to unlock them first!"
})
Tab3:AddButton({
    Name = "World 1",
    Callback = function()
        tp:FireServer(1)
    end
})
Tab3:AddButton({
    Name = "World 2",
    Callback = function()
        tp:FireServer(2)
    end
})
Tab3:AddButton({
    Name = "World 3",
    Callback = function()
        tp:FireServer(3)
    end
})
Tab3:AddButton({
    Name = "World 4",
    Callback = function()
        tp:FireServer(4)
    end
})
Tab3:AddButton({
    Name = "World 5",
    Callback = function()
        tp:FireServer(5)
    end
})
Tab3:AddButton({
    Name = "World 6",
    Callback = function()
        remote:WaitForChild("Event"):WaitForChild("Game"):WaitForChild("[C-S]PlayerTP")
        :FireServer(workspace:WaitForChild("Check"):WaitForChild("ToWorld6"))
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