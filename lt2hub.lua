-- Создаем GUI
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local dragGui = Instance.new("ScreenGui")
dragGui.Name = "DragGui"
dragGui.ResetOnSpawn = false
dragGui.Parent = playerGui

-- Создаем Frame для перетаскивания
local dragFrame = Instance.new("Frame")
dragFrame.Size = UDim2.new(0, 200, 0, 150)
dragFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
dragFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
dragFrame.BorderSizePixel = 0
dragFrame.Parent = dragGui

-- Создаем заголовок
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundTransparency = 0
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Text = "Мой GUI"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18
title.Parent = dragFrame

-- Функция для перетаскивания
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    dragFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = dragFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch and dragging then
        dragInput = input
        update(input)
    end
end)

-- Создаем кнопки
local function createButton(text, position)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 80, 0, 30)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    button.Parent = dragFrame
    return button
end

local button1 = createButton("Dark X V5.0", UDim2.new(0, 10, 0, 40))
local button2 = createButton("Luaware", UDim2.new(0, 110, 0, 40))
local button3 = createButton("Butter", UDim2.new(0, 10, 0, 80))
local button4 = createButton("Dazed X", UDim2.new(0, 110, 0, 80))
local button5 = createButton("Toads", UDim2.new(0, 10, 0, 120))
local button6 = createButton("X", UDim2.new(0, 110, 0, 120))

-- Функции для кнопок
button1.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet"https://raw.githubusercontent.com/Collecterme/Darkxv5.0/main/darkx.txt")()
end)

button2.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))()
end)

button3.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/Butter/main/Root2.lua'))("")
end)

button4.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/666TranZit666/rewrite/main/Dazed%20X'))()
end)

button5.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://bit.ly/3x90l99"))("TOADS")
end)

button6.MouseButton1Click:Connect(function()
    dragGui:Destroy()
end)
