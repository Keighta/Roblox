--https://www.roblox.com/games/7234652571
--loadstring(game:HttpGet("https://raw.githubusercontent.com/Keighta/Roblox/main/bank%20tycoon.lua"))()
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Bank Tycoon", IntroEnabled = false})
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
Tab:AddButton({
    Name = "Collect Cash",
    Callback = function()
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("emptyCollector"):InvokeServer()
    end
})
Tab:AddToggle({
	Name = "Auto Collect Cash While x3 Boost Active",
	Default = false,
	Callback = function(Value)
		_G.autoCollectCash = Value
        local ugcleaks = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.LeftSide.CashBoost.Timer
		while _G.autoCollectCash do
            if ugcleaks.Text == "X3 CASH BOOST In Progress!" then
                game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("emptyCollector"):InvokeServer()
                wait(.1)
            end
            wait(.1)
        end
    end
})
Tab:AddButton({
    Name = "Collect Coin",
    Callback = function()
        for _, v in pairs(workspace.ItemsToCollect:GetDescendants()) do
            if v:IsA("ProximityPrompt") and v.Parent.Transparency ~= 1 then
                v.HoldDuration = 0
                game.Players.LocalPlayer.Character:PivotTo(v.Parent.CFrame + Vector3.new(0, 3, 0))
                wait(.5)
                fireproximityprompt(v)
                wait(.1)
            end
        end
    end
})
Tab:AddButton({
    Name = "Auto Build TBD", --tried to make auto build with button priorities but i gave up (after 5 minutes trying)
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0BankTycoon"))()
    end
})
local Section = Tab:AddSection({
	Name = "Note: you have to verify manually!"
})
Tab:AddButton({
    Name = "Copy dev discord link to clipboard",
    Callback = function()
        local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
        clipBoard("discord.gg/scriptsworld")
        OrionLib:MakeNotification({
        Name = "Link copied!",
        Content = "discord.gg/scriptsworld",
        Image = "rbxassetid://14903697669",
        Time = 3
        })
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
