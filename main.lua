-- NebulaUI v3.0 FULL - Mobile + PC Perfect | 2025
-- Made with love for the community <3
-- MODIFIED FOR EXTERNAL CONFIGURATION

return function(userConfig)
    local NebulaUI = {}
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer

    -- DEFAULT CONFIG (Is overwritten by your settings in sample.lua)
    local Config = {
        Key = "DEFAULT_KEY",
        CreatorName = "DEFAULT_AUTHOR",
        LibraryName = "NebulaUI v3",
        Discord = "https://discord.gg/nebula2025",
        AccentColor = Color3.fromRGB(130, 90, 255),
        BackgroundColor = Color3.fromRGB(18, 18, 24),
        TextColor = Color3.fromRGB(255, 255, 255)
    }

    -- Merge the user's config table with the default one
    if userConfig and type(userConfig) == "table" then
        for key, value in pairs(userConfig) do
            Config[key] = value
        end
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NebulaUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.Parent = game:GetService("CoreGui")

    -- Notification Function (Gumagana sa mobile) - FIXED LOGIC
    function NebulaUI:Notify(Title, Text, Duration)
        Duration = Duration or 4
        spawn(function()
            local Notif = Instance.new("Frame")
            local Corner = Instance.new("UICorner")
            local TitleLabel = Instance.new("TextLabel")
            local TextLabel = Instance.new("TextLabel")

            Notif.Size = UDim2.new(0, 320, 0, 90)
            Notif.BackgroundColor3 = Config.BackgroundColor
            Notif.BorderSizePixel = 0
            Notif.Parent = ScreenGui
            
            Notif.Position = UDim2.new(1, 20, 1, -110)

            Corner.CornerRadius = UDim.new(0, 12)
            Corner.Parent = Notif

            TitleLabel.Size = UDim2.new(1, -10, 0, 30)
            TitleLabel.Position = UDim2.new(0, 10, 0, 8)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Text = Title or "Notification"
            TitleLabel.TextColor3 = Config.AccentColor
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.TextSize = 18
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = Notif

            TextLabel.Size = UDim2.new(1, -20, 1, -45)
            TextLabel.Position = UDim2.new(0, 10, 0, 35)
            TextLabel.BackgroundTransparency = 1
            TextLabel.Text = Text or "No text provided"
            TextLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
            TextLabel.Font = Enum.Font.Gotham
            TextLabel.TextSize = 15
            TextLabel.TextWrapped = true
            TextLabel.TextXAlignment = Enum.TextXAlignment.Left
            TextLabel.Parent = Notif

            TweenService:Create(Notif, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(1, -340, 1, -110)}):Play()
            task.wait(Duration + 0.5)
            TweenService:Create(Notif, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {Position = UDim2.new(1, 20, 1, -110)}):Play()
            task.wait(0.6)
            Notif:Destroy()
        end)
    end

    -- Forward-declare Init so the key system can call it
    local Init

    -- Key System - ENHANCED with Author Name
    local function CreateKeySystem()
        local KeyGui = Instance.new("Frame")
        KeyGui.Size = UDim2.new(0, 360, 0, 240)
        KeyGui.Position = UDim2.new(0.5, -180, 0.5, -120)
        KeyGui.BackgroundColor3 = Config.BackgroundColor
        KeyGui.Parent = ScreenGui

        local Corner = Instance.new("UICorner", KeyGui)
        Corner.CornerRadius = UDim.new(0, 16)

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(1,0,0,30)
        Title.Position = UDim2.new(0,0,0,10)
        Title.BackgroundTransparency = 1
        Title.Text = Config.LibraryName .. " - Key System"
        Title.TextColor3 = Config.AccentColor
        Title.Font = Enum.Font.GothamBold
        Title.TextSize = 24
        Title.Parent = KeyGui

        local AuthorLabel = Instance.new("TextLabel")
        AuthorLabel.Size = UDim2.new(1,0,0,20)
        AuthorLabel.Position = UDim2.new(0,0,0,38)
        AuthorLabel.BackgroundTransparency = 1
        AuthorLabel.Text = "Made by: " .. Config.CreatorName
        AuthorLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        AuthorLabel.Font = Enum.Font.Gotham
        AuthorLabel.TextSize = 14
        AuthorLabel.Parent = KeyGui
        
        local KeyBox = Instance.new("TextBox")
        KeyBox.Size = UDim2.new(0, 300, 0, 50)
        KeyBox.Position = UDim2.new(0.5, -150, 0, 70)
        KeyBox.PlaceholderText = "Enter Key..."
        KeyBox.Text = ""
        KeyBox.BackgroundColor3 = Color3.fromRGB(30,30,35)
        KeyBox.TextColor3 = Config.TextColor
        KeyBox.Font = Enum.Font.Gotham
        KeyBox.TextSize = 18
        KeyBox.Parent = KeyGui
        Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0,10)

        local Submit = Instance.new("TextButton")
        Submit.Size = UDim2.new(0, 300, 0, 50)
        Submit.Position = UDim2.new(0.5, -150, 0, 130)
        Submit.BackgroundColor3 = Config.AccentColor
        Submit.Text = "Submit Key"
        Submit.TextColor3 = Config.TextColor
        Submit.Font = Enum.Font.GothamBold
        Submit.TextSize = 18
        Submit.Parent = KeyGui
        Instance.new("UICorner", Submit).CornerRadius = UDim.new(0,10)

        local DiscordBtn = Instance.new("TextButton")
        DiscordBtn.Size = UDim2.new(0, 300, 0, 40)
        DiscordBtn.Position = UDim2.new(0.5, -150, 1, -50)
        DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        DiscordBtn.Text = "Copy Discord Link"
        DiscordBtn.TextColor3 = Config.TextColor
        DiscordBtn.Parent = KeyGui
        Instance.new("UICorner", DiscordBtn).CornerRadius = UDim.new(0,10)

        local dragging = false
        local dragInput, dragStart, startPos
        local draggableComponents = {Title, AuthorLabel} 
        for _, comp in ipairs(draggableComponents) do
            comp.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true
                    dragStart = input.Position
                    startPos = KeyGui.Position
                end
            end)
        end
        UserInputService.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)
        RunService.RenderStepped:Connect(function()
            if dragging and dragInput then
                local delta = dragInput.Position - dragStart
                KeyGui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end)

        Submit.MouseButton1Click:Connect(function()
            if KeyBox.Text == Config.Key then
                NebulaUI:Notify("Success", "Key Accepted! Loading UI...", 3)
                TweenService:Create(KeyGui, TweenInfo.new(0.6), {Position = UDim2.new(0.5, -180, -1, 0)}):Play()
                task.wait(0.7)
                KeyGui:Destroy()
                Init() -- Call the main UI function
            else
                KeyBox.Text = ""
                KeyBox.PlaceholderText = "Wrong Key!"
                KeyBox.PlaceholderColor3 = Color3.fromRGB(255,80,80)
                NebulaUI:Notify("Error", "Invalid Key provided!", 2)
                task.wait(2)
                KeyBox.PlaceholderText = "Enter Key..."
                KeyBox.PlaceholderColor3 = Color3.fromRGB(150,150,150)
            end
        end)

        DiscordBtn.MouseButton1Click:Connect(function()
            setclipboard(Config.Discord)
            NebulaUI:Notify("Copied!", "Discord link copied to clipboard!", 3)
        end)
    end

    -- Main UI Init
    Init = function()
        local Main = Instance.new("Frame")
        Main.Size = UDim2.new(0, 650, 0, 500)
        Main.Position = UDim2.new(0.5, -325, 0.5, -250)
        Main.BackgroundColor3 = Config.BackgroundColor
        Main.ClipsDescendants = true
        Main.Parent = ScreenGui

        local Corner = Instance.new("UICorner", Main)
        Corner.CornerRadius = UDim.new(0, 16)

        local TitleBar = Instance.new("Frame")
        TitleBar.Size = UDim2.new(1,0,0,55)
        TitleBar.BackgroundColor3 = Config.AccentColor
        TitleBar.Parent = Main
        Instance.new("UICorner", TitleBar).CornerRadius = UDim.new(0,16)

        local Title = Instance.new("TextLabel")
        Title.Size = UDim2.new(0,200,1,0)
        Title.Position = UDim2.new(0,20,0,0)
        Title.BackgroundTransparency = 1
        Title.Text = Config.LibraryName
        Title.TextColor3 = Config.TextColor
        Title.Font = Enum.Font.GothamBold
        Title.TextSize = 22
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Parent = TitleBar

        local Close = Instance.new("TextButton")
        Close.Size = UDim2.new(0,45,0,45)
        Close.Position = UDim2.new(1,-55,0,5)
        Close.BackgroundTransparency = 1
        Close.Text = "X"
        Close.TextColor3 = Color3.fromRGB(255,100,100)
        Close.Font = Enum.Font.GothamBold
        Close.TextSize = 24
        Close.Parent = TitleBar
        Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

        local Minimize = Instance.new("TextButton")
        Minimize.Size = UDim2.new(0,45,0,45)
        Minimize.Position = UDim2.new(1,-105,0,5)
        Minimize.BackgroundTransparency = 1
        Minimize.Text = "—"
        Minimize.TextColor3 = Color3.fromRGB(200,200,200)
        Minimize.Font = Enum.Font.GothamBold
        Minimize.TextSize = 32
        Minimize.Parent = TitleBar

        local Minimized = false
        Minimize.MouseButton1Click:Connect(function()
            Minimized = not Minimized
            TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {Size = Minimized and UDim2.new(0,300,0,60) or UDim2.new(0,650,0,500)}):Play()
        end)

        local dragging = false
        local dragStart, startPos
        TitleBar.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = Main.Position
            end
        end)
        RunService.RenderStepped:Connect(function()
            if dragging then
                if UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) or UserInputService:GetTouchState(dragStart) then
                    local mousePos = UserInputService:GetMouseLocation()
                    local delta = mousePos - dragStart
                    Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                else
                    dragging = false
                end
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)

        local TabContainer = Instance.new("Folder", Main)
        local TabButtons = Instance.new("Frame")
        TabButtons.Size = UDim2.new(0,160,1,-55)
        TabButtons.Position = UDim2.new(0,0,0,55)
        TabButtons.BackgroundColor3 = Color3.fromRGB(15,15,20)
        TabButtons.Parent = Main

        local Content = Instance.new("Frame")
        Content.Size = UDim2.new(1,-160,1,-55)
        Content.Position = UDim2.new(0,160,0,55)
        Content.BackgroundTransparency = 1
        Content.Parent = Main

        local ListLayout = Instance.new("UIListLayout")
        ListLayout.Padding = UDim.new(0,8)
        ListLayout.Parent = TabButtons

        function NebulaUI:CreateTab(Name)
            local TabBtn = Instance.new("TextButton")
            TabBtn.Size = UDim2.new(1,-16,0,50)
            TabBtn.Position = UDim2.new(0,8,0,0)
            TabBtn.BackgroundColor3 = Color3.fromRGB(35,35,40)
            TabBtn.Text = "  "..Name
            TabBtn.TextColor3 = Color3.fromRGB(180,180,180)
            TabBtn.Font = Enum.Font.GothamSemibold
            TabBtn.TextSize = 18
            TabBtn.TextXAlignment = Enum.TextXAlignment.Left
            TabBtn.Parent = TabButtons
            Instance.new("UICorner", TabBtn).CornerRadius = UDim.new(0,10)

            local TabContent = Instance.new("ScrollingFrame")
            TabContent.Size = UDim2.new(1,-20,1,-20)
            TabContent.Position = UDim2.new(0,10,0,10)
            TabContent.BackgroundTransparency = 1
            TabContent.ScrollBarThickness = 4
            TabContent.AutomaticCanvasSize = Enum.AutomaticSize.Y
            TabContent.Visible = false
            TabContent.Parent = Content

            local List = Instance.new("UIListLayout")
            List.Padding = UDim.new(0,10)
            List.HorizontalAlignment = Enum.HorizontalAlignment.Center
            List.Parent = TabContent

            TabBtn.MouseButton1Click:Connect(function()
                for _, v in pairs(Content:GetChildren()) do
                    if v:IsA("ScrollingFrame") then v.Visible = false end
                end
                TabContent.Visible = true
                for _, b in pairs(TabButtons:GetChildren()) do
                    if b:IsA("TextButton") then
                        b.TextColor3 = Color3.fromRGB(180,180,180)
                    end
                end
                TabBtn.TextColor3 = Config.AccentColor
            end)

            if #TabButtons:GetChildren() == 2 then -- Changed to 2 to account for the UIListLayout
                TabContent.Visible = true
                TabBtn.TextColor3 = Config.AccentColor
            end

            local Tab = {}
            function Tab:Button(Text, Callback)
                local Btn = Instance.new("TextButton")
                Btn.Size = UDim2.new(0, 440, 0, 55)
                Btn.BackgroundColor3 = Color3.fromRGB(40,40,45)
                Btn.Text = Text
                Btn.TextColor3 = Config.TextColor
                Btn.Font = Enum.Font.Gotham
                Btn.TextSize = 18
                Btn.Parent = TabContent
                Instance.new("UICorner", Btn).CornerRadius = UDim.new(0,12)
                Btn.MouseEnter:Connect(function() TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = Config.AccentColor}):Play() end)
                Btn.MouseLeave:Connect(function() TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40,40,45)}):Play() end)
                Btn.MouseButton1Click:Connect(Callback or function() end)
            end
            function Tab:Toggle(Text, Default, Callback)
                local Toggle = Instance.new("Frame")
                Toggle.Size = UDim2.new(0,440,0,55)
                Toggle.BackgroundColor3 = Color3.fromRGB(35,35,40)
                Toggle.Parent = TabContent
                Instance.new("UICorner", Toggle).CornerRadius = UDim.new(0,12)
                local Label = Instance.new("TextLabel")
                Label.Size = UDim2.new(0,300,1,0)
                Label.Position = UDim2.new(0,20,0,0)
                Label.BackgroundTransparency = 1
                Label.Text = Text
                Label.TextColor3 = Config.TextColor
                Label.Font = Enum.Font.Gotham
                Label.TextSize = 18
                Label.TextXAlignment = Enum.TextXAlignment.Left
                Label.Parent = Toggle
                local Switch = Instance.new("TextButton")
                Switch.Size = UDim2.new(0,70,0,35)
                Switch.Position = UDim2.new(1,-90,0.5,-17)
                Switch.BackgroundColor3 = Default and Config.AccentColor or Color3.fromRGB(70,70,70)
                Switch.Text = ""
                Switch.Parent = Toggle
                Instance.new("UICorner", Switch).CornerRadius = UDim.new(1,0)
                local Circle = Instance.new("Frame")
                Circle.Size = UDim2.new(0,28,0,28)
                Circle.Position = Default and UDim2.new(1,-38,0.5,-14) or UDim2.new(0,8,0.5,-14)
                Circle.BackgroundColor3 = Config.TextColor
                Circle.Parent = Switch
                Instance.new("UICorner", Circle).CornerRadius = UDim.new(1,0)
                local enabled = Default or false
                Switch.MouseButton1Click:Connect(function()
                    enabled = not enabled
                    TweenService:Create(Switch, TweenInfo.new(0.3), {BackgroundColor3 = enabled and Config.AccentColor or Color3.fromRGB(70,70,70)}):Play()
                    TweenService:Create(Circle, TweenInfo.new(0.3, Enum.EasingStyle.Quint), {Position = enabled and UDim2.new(1,-38,0.5,-14) or UDim2.new(0,8,0.5,-14)}):Play()
                    if Callback then Callback(enabled) end
                end)
            end
            function Tab:Slider(Text, Min, Max, Default, Callback)
                local Slider = Instance.new("Frame")
                Slider.Size = UDim2.new(0,440,0,70)
                Slider.BackgroundColor3 = Color3.fromRGB(35,35,40)
                Slider.Parent = TabContent
                Instance.new("UICorner", Slider).CornerRadius = UDim.new(0,12)
                local Label = Instance.new("TextLabel")
                Label.Size = UDim2.new(1,0,0,30)
                Label.BackgroundTransparency = 1
                Label.Text = Text .. ": " .. Default
                Label.TextColor3 = Config.TextColor
                Label.Font = Enum.Font.Gotham
                Label.TextSize = 16
                Label.Parent = Slider
                local Bar = Instance.new("Frame")
                Bar.Size = UDim2.new(1,-40,0,10)
                Bar.Position = UDim2.new(0,20,0,40)
                Bar.BackgroundColor3 = Color3.fromRGB(60,60,60)
                Bar.Parent = Slider
                Instance.new("UICorner", Bar).CornerRadius = UDim.new(0,5)
                local Fill = Instance.new("Frame")
                Fill.Size = UDim2.new((Default-Min)/(Max-Min),0,1,0)
                Fill.BackgroundColor3 = Config.AccentColor
                Fill.Parent = Bar
                Instance.new("UICorner", Fill).CornerRadius = UDim.new(0,5)
                local function UpdateSlider(percent)
                    local value = math.floor(Min + (Max - Min) * percent + 0.5) -- Added rounding
                    Fill.Size = UDim2.new(percent,0,1,0)
                    Label.Text = Text .. ": " .. value
                    if Callback then Callback(value) end
                end
                local dragging = false
                Bar.InputBegan:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = true
                        local percent = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
                        UpdateSlider(percent)
                    end
                end)
                UserInputService.InputEnded:Connect(function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                        dragging = false
                    end
                end)
                UserInputService.InputChanged:Connect(function(input)
                    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                        local percent = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
                        UpdateSlider(percent)
                    end
                end)
            end
            function Tab:Dropdown(Text, Options, Callback)
                local Drop = Instance.new("Frame")
                Drop.Size = UDim2.new(0,440,0,55)
                Drop.BackgroundColor3 = Color3.fromRGB(35,35,40)
                Drop.Parent = TabContent
                Instance.new("UICorner", Drop).CornerRadius = UDim.new(0,12)
                local Label = Instance.new("TextLabel")
                Label.Size = UDim2.new(1,-80,1,0)
                Label.Text = Text .. ": " .. Options[1]
                Label.TextColor3 = Config.TextColor
                Label.Font = Enum.Font.Gotham
                Label.TextSize = 18
                Label.TextXAlignment = Enum.TextXAlignment.Left
                Label.Position = UDim2.new(0,20,0,0)
                Label.Parent = Drop
                local Arrow = Instance.new("TextButton")
                Arrow.Size = UDim2.new(0,40,0,40)
                Arrow.Position = UDim2.new(1,-55,0.5,-20)
                Arrow.BackgroundTransparency = 1
                Arrow.Text = "▼"
                Arrow.TextColor3 = Color3.fromRGB(200,200,200)
                Arrow.Parent = Drop
                local List = Instance.new("Frame")
                List.Size = UDim2.new(1,0,0,0)
                List.Position = UDim2.new(0,0,1,5)
                List.BackgroundColor3 = Color3.fromRGB(40,40,45)
                List.Visible = false
                List.Parent = Drop
                Instance.new("UICorner", List).CornerRadius = UDim.new(0,10)
                local ListLayout = Instance.new("UIListLayout", List)
                ListLayout.Padding = UDim.new(0,5)
                local open = false
                Arrow.MouseButton1Click:Connect(function()
                    open = not open
                    List.Visible = open
                    local targetHeight = open and 55 + #Options*45 or 55
                    TweenService:Create(Drop, TweenInfo.new(0.3), {Size = UDim2.new(0,440,0,targetHeight)}):Play()
                end)
                for _, opt in pairs(Options) do
                    local OptBtn = Instance.new("TextButton")
                    OptBtn.Size = UDim2.new(1,0,0,40)
                    OptBtn.BackgroundTransparency = 1
                    OptBtn.Text = "  " .. opt
                    OptBtn.TextColor3 = Color3.fromRGB(200,200,200)
                    OptBtn.TextXAlignment = Enum.TextXAlignment.Left
                    OptBtn.Parent = List
                    OptBtn.MouseButton1Click:Connect(function()
                        Label.Text = Text .. ": " .. opt
                        open = false
                        TweenService:Create(Drop, TweenInfo.new(0.3), {Size = UDim2.new(0,440,0,55)}):Play()
                        List.Visible = false
                        if Callback then Callback(opt) end
                    end)
                end
            end
            function Tab:Keybind(Text, DefaultKey, Callback)
                local Keybind = Instance.new("Frame")
                Keybind.Size = UDim2.new(0,440,0,55)
                Keybind.BackgroundColor3 = Color3.fromRGB(35,35,40)
                Keybind.Parent = TabContent
                Instance.new("UICorner", Keybind).CornerRadius = UDim.new(0,12)
                local Label = Instance.new("TextLabel")
                Label.Size = UDim2.new(0,300,1,0)
                Label.Position = UDim2.new(0,20,0,0)
                Label.BackgroundTransparency = 1
                Label.Text = Text
                Label.TextColor3 = Config.TextColor
                Label.Font = Enum.Font.Gotham
                Label.TextSize = 18
                Label.TextXAlignment = Enum.TextXAlignment.Left
                Label.Parent = Keybind
                local BindBtn = Instance.new("TextButton")
                BindBtn.Size = UDim2.new(0,100,0,35)
                BindBtn.Position = UDim2.new(1,-120,0.5,-17)
                BindBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
                BindBtn.Text = DefaultKey and DefaultKey.Name or "None"
                BindBtn.TextColor3 = Config.TextColor
                BindBtn.Parent = Keybind
                Instance.new("UICorner", BindBtn).CornerRadius = UDim.new(0,8)
                local currentKey = DefaultKey
                local binding = false
                BindBtn.MouseButton1Click:Connect(function()
                    if binding then return end 
                    binding = true
                    BindBtn.Text = "..."
                    local conn
                    conn = UserInputService.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Keyboard then
                            currentKey = input.KeyCode
                            BindBtn.Text = input.KeyCode.Name
                            binding = false
                            conn:Disconnect()
                            if Callback then Callback(input.KeyCode) end
                        end
                    end)
                end)
                return currentKey
            end
            return Tab
        end

        NebulaUI:Notify("Welcome!", "NebulaUI v3 Loaded Successfully! Made by: " .. Config.CreatorName, 5)
    end

    -- Start the UI process by showing the key system
    CreateKeySystem()

    return NebulaUI
end
