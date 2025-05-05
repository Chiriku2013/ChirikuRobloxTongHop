local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=83190276951914"

UICorner.CornerRadius = UDim.new(1, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title = "Chiriku Roblox Tổng Hợp",
    SubTitle = "Blox Fruit",
    TabWidth = 157,
    Size = UDim2.fromOffset(555, 320),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})
local Tabs = {
    Main0 = Window:AddTab({ Title="Thông Tin" }),
    Main1 = Window:AddTab({ Title="Script Farm" }),
    Main2 = Window:AddTab({ Title="Farm Fruit" }),
    Main3 = Window:AddTab({ Title="Farm Chest" }),
    Main4 = Window:AddTab({ Title="Script Hop" }),
    Main5 = Window:AddTab({ Title="lin tinh" }),
}

Tabs.Main0:AddButton({
    Title = "Discord",
    Description = "TBoyRoblox Community",
    Callback = function()
        setclipboard("https://discord.gg/tboyroblox-community-1253927333920899153")
    end
})

Tabs.Main0:AddButton({
    Title = "Youtuber",
    Description = "TBoy Roblox",
    Callback = function()
        setclipboard("https://www.youtube.com/@TBoyRoblox08")
    end
})

Tabs.Main0:AddButton({
    Title = "Youtuber",
    Description = "TBoy Gamer",
    Callback = function()
        setclipboard("https://www.youtube.com/@TBoyGamer08")
    end
})

-- Add Redz Hub and GreenZ Hub to "Main 1"
Tabs.Main1:AddButton({
    Title = "Redz Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))()
    end
})

Tabs.Main1:AddButton({
    Title = "GreenZ Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaAnarchist/GreenZ-Hub/refs/heads/main/KaitunDoughKing.lua"))()
    end
})

-- Add all requested hubs to "Main 1"
Tabs.Main1:AddButton({
    Title = "W-azure Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3b2169cf53bc6104dabe8e19562e5cc2.lua"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Blue X Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Banana Hub Free",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kimprobloxdz/Banana-Free/refs/heads/main/Protected_5609200582002947.lua.txt"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Hiru Hub V2",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaStupid/Source/main/HiruHubVeriV2.lua"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Min Gaming Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinGamingDVn"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Maru Hub Free",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/KimP/refs/heads/main/MaruHub"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Đạt THG Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/DatThg/refs/heads/main/DatThgV1"))()
    end
})

Tabs.Main1:AddButton({
    Title = "KimP Roblox Hub V3",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/KimP/refs/heads/main/KimPRobloxV3"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Relz Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/farghii/relzhub/refs/heads/main/v2.bloxfruits.lua"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Lion Hub",
    Description = "",
    Callback = function()
        repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/e0c7fcf6c077fc23475cf4ce4db58e42.lua"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Rubu Hub V3",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/RubuRoblox/refs/heads/main/RubuBF"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Trẩu Roblox Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/TrauHub/refs/heads/main/TrauAp1"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Tsuo Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Tsuo7/TsuoHub/main/Tsuoscripts"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Astral Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Zis Roblox Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Zis/refs/heads/main/ZisRb3"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Xero Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xero2409/XeroHub/refs/heads/main/main.lua"))()
    end
})

-- Set "Main 2", "Main 3", "Main 4", and "Main 5" titles as requested
Tabs.Main2:AddLabel("Đang Cập Nhật...")
Tabs.Main3:AddLabel("Đang Cập Nhật...")
Tabs.Main4:AddLabel("Đang Cập Nhật...")
Tabs.Main5:AddLabel("Test")