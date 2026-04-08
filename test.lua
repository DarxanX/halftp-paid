local Players = game:GetService("Players")
local player = Players.LocalPlayer
local keyURL = "https://raw.githubusercontent.com/DarxanX/halftp-paid/refs/heads/main/keys.txt"

if Key == nil or Key == "" then
    Player:Kick("No key detected")
    return
end

local success, result = pcall(function()
    return game:HttpGet(keyURL)
end)

if not success then
    Player:Kick("Key server error")
    return
end

local valid = false

for key in string.gmatch(result, "[^\r\n]+") do
    if Key == key then
        valid = true
        break
    end
end

if not valid then
    Player:Kick("Wrong key")
    return
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/DarxanX/halftp-paid/refs/heads/main/loader.lua"))()
