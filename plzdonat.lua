--hello
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/amorestar/raceclickerroblox/refs/heads/main/raceclickergui.lua"))()

local Window = Library:Window({
    Title = "⚡ Union ⚡",
    Desc = "Welcome to Union!\nThis is a free multihack for pls donate!",
    Icon = 105059922903197,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.LeftControl,
        Size = UDim2.new(0, 500, 0, 400)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "Union"
    }
})

local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(0, 140, 0, 0) 
SidebarLine.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SidebarLine.BorderSizePixel = 0
SidebarLine.ZIndex = 5
SidebarLine.Name = "SidebarLine"
SidebarLine.Parent = game:GetService("CoreGui") 

local Tab = Window:Tab({Title = "Main", Icon = "tag"}) do 
    Tab:Section({Title = "Main Information"})

    local CodeBlock = Tab:Code({
        Title = "Information about the script",
        Code = "Last update 03/08/2025\n\n\n" ..
               "If you have any suggestions or ideas, feel free to contact me.\n" ..
               "I hope you enjoy using this script and it will help you in the game.\n" ..
               "If you find any bugs or issues, please report them to me.\n" ..
               "Thank you for using my script and have a great day!\n"

    })

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local Tab = Window:Tab({Title = "Chat", Icon = "tag"}) do
    Tab:Section({Title = "Chat features"})

    local floodMessage = "Union hub is the best!"
    local floodSpeed = 5
    local floodEnabled = false
    local floodThread = nil
    local chatMode = "All"

    local function sendChatMessage(message)
        if TextChatService and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        else
            local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
            if chatEvents then
                local sayMessageRequest = chatEvents:FindFirstChild("SayMessageRequest")
                if sayMessageRequest then
                    sayMessageRequest:FireServer(message, chatMode)
                end
            end
        end
    end

    Tab:Textbox({
        Title = "Flood text",
        Placeholder = "Enter message",
        Value = floodMessage,
        ClearTextOnFocus = false,
        Callback = function(text)
            floodMessage = text
        end
    })

    Tab:Slider({
        Title = "Delay (sec)",
        Min = 1,
        Max = 120,
        Rounding = 0,
        Value = 5,
        Callback = function(val)
            floodSpeed = val
        end
    })

    Tab:Toggle({
        Title = "Start flooding",
        Default = false,
        Callback = function(state)
            floodEnabled = state

            if state then
                floodThread = task.spawn(function()
                    while floodEnabled do
                        sendChatMessage(floodMessage)
                        task.wait(floodSpeed)
                    end
                end)
            else
                floodThread = nil
            end
        end
    })
end


Window:Notify({
    Title = "☄️ UNION LOADED ☄️",
    Desc = "Loaded",
    Time = 4    
})
end