local localPlayer = game.Players.LocalPlayer

local function createHighlight(player)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = player.Character
    highlight.FillColor = Color3.fromRGB(255, 100, 100)
    highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
    highlight.OutlineTransparency = 0
    highlight.FillTransparency = 0.5
    highlight.Enabled = true
    highlight.Parent = player.Character
end

local function updateEsp()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Highlight") then
            player.Character.Highlight:Destroy()
        end
    end

    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= localPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
            createHighlight(player)
        end
    end
end

local function showText()
    wait(5)
    local hint = Instance.new("Hint")
    hint.Parent = workspace
    hint.Text = "Автор: BLACK SCRIPTS"
    delay(5, function()
        hint:Destroy()
    end)
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createHighlight(player)
        updateEsp()
    end)
end)

updateEsp()

localPlayer.CharacterAdded:Connect(function(character)
    updateEsp()
end)

showText()
