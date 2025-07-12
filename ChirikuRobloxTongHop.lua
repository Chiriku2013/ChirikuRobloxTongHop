-- Set UI title/logo/credit - UiLoading
    getgenv().TitleScript = "Loading Script..."
    getgenv().LogoScript = "rbxassetid://119836305527028"
    getgenv().CreditScript = "By: Chiriku Roblox"
    
    -- Load UI song song - UiLoading
    task.spawn(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Chiriku2013/UiLoading/refs/heads/main/UiLoading.lua"))()
    end)

    -- Đợi UI Loading hoàn tất
    repeat task.wait()until
    _G.LoadingDone

local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")
local ClickSound = Instance.new("Sound")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local VirtualInput = game:GetService("VirtualInputManager")

-- UI trạng thái toggle
getgenv().UIVisible = true

-- Cài đặt UI
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0, 20, 0.3, -6)
ImageButton.Size = UDim2.new(0, 50, 0, 50)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=81787064714217"

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = ImageButton

-- Âm thanh click Minecraft
ClickSound.Name = "ClickSound"
ClickSound.SoundId = "rbxassetid://535716488"
ClickSound.Volume = 5
ClickSound.Parent = ImageButton

-- Hàm bounce + xoay
local isRotating = false
local function rotateAndBounce(clockwise)
	if isRotating then return end
	isRotating = true

	-- Bounce effect
	local bounceOut = TweenService:Create(ImageButton, TweenInfo.new(0.07, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 42, 0, 42)})
	local bounceIn = TweenService:Create(ImageButton, TweenInfo.new(0.07, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 50, 0, 50)})
	bounceOut:Play()
	bounceOut.Completed:Wait()
	bounceIn:Play()

	-- Rotation
	local total = 0
	local step = clockwise and -30 or 30
	local conn
	conn = RunService.RenderStepped:Connect(function()
		ImageButton.Rotation += step
		total += math.abs(step)
		if total >= 360 then
			conn:Disconnect()
			isRotating = false
		end
	end)
end

-- Khi bấm nút ảnh
ImageButton.MouseButton1Down:Connect(function()
	ClickSound:Play()
	VirtualInput:SendKeyEvent(true, Enum.KeyCode.End, false, game)

	-- Đảo chiều toggle UI
	getgenv().UIVisible = not getgenv().UIVisible
	-- Bật = trái, Tắt = phải
	rotateAndBounce(getgenv().UIVisible)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title = "Chiriku Roblox",
    SubTitle = "Tổng Hợp Script",
    TabWidth = 160,
    Size = UDim2.fromOffset(555, 320),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})
local Tabs = {
    Main0 = Window:AddTab({ Title="Thông Tin", Icon="info" }),
    Main1 = Window:AddTab({ Title="Blox Fruits", Icon="swords" }),
    Main2 = Window:AddTab({ Title="Grow a Garden", Icon="leaf" }),
    Main3 = Window:AddTab({ Title="Steal A Brainrot", Icon="skull" }),
    Main4 = Window:AddTab({ Title="Dead Rails", Icon="train" }),
    Main5 = Window:AddTab({ Title="Evade", Icon="heart" }),
}

Tabs.Main0:AddParagraph({
    Title = "Development",
    Content = "Chiriku Roblox"
})

local executorName
if identifyexecutor then
    executorName=identifyexecutor()
elseif getexecutorname then
    executorName=getexecutorname()
end
if executorName then
    Tabs.Main0:AddParagraph({
        Title = "Client Has Use",
        Content = executorName
    })
end

local Time = Tabs.Main0:AddParagraph({
    Title = "Time Zone",
    Content = "Local Time: Updating..."
})

local function UpdateLocalTime()
    local date = os.date("*t")
    local hour = date.hour % 24
    local ampm = hour < 12 and "AM" or "PM"
    local formattedTime = string.format("%02i:%02i:%02i %s", ((hour - 1) % 12) + 1, date.min, date.sec, ampm)
    local formattedDate = string.format("%02d/%02d/%04d", date.day, date.month, date.year)
    local LocalizationService = game:GetService("LocalizationService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local regionCode = "Unknown"
    local success, code = pcall(function()
        return LocalizationService:GetCountryRegionForPlayerAsync(player)
    end)
    if success then
        regionCode = code
    end
    Time:SetDesc("Local Time: " .. formattedDate .. " - " .. formattedTime .. " [ " .. regionCode .. " ]")
end

spawn(function()
    while true do
        UpdateLocalTime()
        game:GetService("RunService").RenderStepped:Wait()
    end
end)

-- Add Redz Hub and Chiriku Roblox Hub to "Main 1"
Tabs.Main1:AddButton({
    Title = "Redz Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
    end
})

Tabs.Main1:AddButton({
    Title = "Chiriku Roblox Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Chiriku2013/ChirikuRoblox/refs/heads/main/ChirikuRoblox.lua"))()
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
Tabs.Main2:AddButton({
    Title = "ThunderZ Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/ThundarZ/Welcome/refs/heads/main/Main/GaG/Main.lua'))()
    end
})

Tabs.Main2:AddButton({
    Title = "No Lag Hub V2",
    Description = "",
    Callback = function()
        loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/NoLag-id/No-Lag-HUB/refs/heads/main/Loader/LoaderV2.lua"))()
    end
})

Tabs.Main2:AddButton({
    Title = "Skull Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/nf-36/Koronis/refs/heads/main/Scripts/Loader.lua"))()
    end
})

Tabs.Main2:AddButton({
    Title = "Blue Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tesghg/Grow-a-Garden/main/ameicaa_Grow_A_Garden.lua"))()
    end
})

Tabs.Main2:AddButton({
    Title = "Vxeze Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Dex-Bear/Vxezehub/refs/heads/main/VxezeHubMain"))()
    end
})

Tabs.Main2:AddButton({
    Title = "Nat Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://get.nathub.xyz/loader"))()
    end
})

Tabs.Main2:AddButton({
    Title = "Alchemy Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://scripts.alchemyhub.xyz"))()
    end
})

Tabs.Main2:AddButton({
    Title = "Speed Hub X",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

Tabs.Main3:AddButton({
    Title = "XxLegendxX Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Akbar123s/Script-Roblox-/refs/heads/main/nabaruBrainrot"))()
    end
})

Tabs.Main3:AddButton({
    Title = "Delfi Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/eCzs7DNQ/raw"))()
    end
})

Tabs.Main3:AddButton({
    Title = "Makal Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DoliScriptz/loader/refs/heads/main/main.lua", true))()
    end
})

Tabs.Main3:AddButton({
    Title = "Nexon Hub [Kaitun]",
    Description = "",
    Callback = function()
        repeat wait() until game:IsLoaded()
getgenv().Config = {
    ["Pet"] = {
        ["Pet Level"] = {
            "Rare",
            "Epic",
            "Legendary",
            "Mythic",
            "Brainrot God",
            "Secret"
        },
        ["Protect Pet Level From Being SellAnd Rebirth"] = {
            "Brainrot God",
            "Secret"
        },
        ["Auto Buy"] = true,
        ["Auto Sell"] = true,
        ["Auto Buy Rebirth Requirements"] = true,
        ["Auto Rebirth"] = true,
        ["Lock Priority"] = true,
    },

    ["Settings"] = {
        ["Tween Speed"] = 40,
        ["Collect Interval"] = 30,
        ["White Screen"] = false,
    },

    ["Webhook"] = {
        ["Enabled"] = true,
        ["Url"] = "",
        ["Settings"] = {
            ["Mode"] = "Edit", -- Send/Edit
            ["Interval"] = 10,
        },
        ["Notification Settings"] = {
            ["Enabled"] = true,
            ["Url"] = "",
            ["Ping Everyone"] = true,
            ["Pet Level"] = {
                "",
            },
        }
    }
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/f352b40fcef4ebdbae10dcb94339d6ed.lua"))()
    end
})

Tabs.Main4:AddButton({
    Title = "Ringta Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/deadrailsui.github.io/refs/heads/main/RINGTA.LUA"))()
    end
})

Tabs.Main4:AddButton({
    Title = "Tp To Tesla",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtaa/tptotesla.github.io/refs/heads/main/Tptotesla.lua"))()
    end
})

Tabs.Main4:AddButton({
    Title = "Tbao Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/refs/heads/main/TbaoHubDeadRails"))()
    end
})

Tabs.Main4:AddButton({
    Title = "Lunor Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Catto-YFCN/Lunor_Dependencies/refs/heads/main/Loader'))()
    end
})

Tabs.Main4:AddButton({
    Title = "Dead Rails",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/DeadRails"))()
    end
})

Tabs.Main4:AddButton({
    Title = "Speed Hub X",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
    end
})

Tabs.Main5:AddButton({
    Title = "Draconic Hub X [OP Script]",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Chiriku2013/DraconicHubX/refs/heads/main/DraconicHubX.lua"))()
    end
})

Tabs.Main5:AddButton({
    Title = "Tbao Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubEvade"))()
    end
})

Tabs.Main5:AddButton({
    Title = "TurboLite Hub",
    Description = "",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TurboLite/Script/refs/heads/main/Evade.lua"))()
    end
})
