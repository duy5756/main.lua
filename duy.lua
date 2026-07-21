-- Chạy Script 1 (Theo dõi)
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/duy5756/main.lua/refs/heads/main/track"))()
end)

-- Chạy Script 2 (Rejoin)
task.spawn(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/duy5756/main.lua/refs/heads/main/re30"))()
end)
