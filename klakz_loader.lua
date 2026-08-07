-- klakz Hub - Professional Loader & Main Hub
_G.KlakzHub_Version = "v3.4"
_G.GitHubRawBase = "https://raw.githubusercontent.com/lrbear/klakzscript/refs/heads/main/"
_G.DiscordWebhookURL = "https://discord.com/api/webhooks/1535359938019459072/RuJyBUsdZSATv_-TMfgLzStBNhgfqP9Z_KuzR1X25cO5a9f3rMOetXtJJqBlrUozs2XS"

-- Discord Webhook Bildirim Fonksiyonu
local HttpService = game:GetService("HttpService")
local function SendWebhook(title, desc, color)
    if _G.DiscordWebhookURL == "" or _G.DiscordWebhookURL:find("BURAYA") then return end
    task.spawn(function()
        pcall(function()
            local data = {
                ["embeds"] = {{
                    ["title"] = title,
                    ["description"] = desc,
                    ["color"] = color or 5793266,
                    ["footer"] = { ["text"] = "klakz Hub Analytics | " .. os.date("%H:%M:%S") }
                }}
            }
            HttpService:PostAsync(_G.DiscordWebhookURL, HttpService:JSONEncode(data))
        end)
    end)
end

SendWebhook("🚀 klakz Hub Başlatıldı", "Oyuncu: " .. game:GetService("Players").LocalPlayer.Name .. "\nOyun ID: " .. game.GameId, 3447003)

-- Ana Arayüz Scriptini GitHub'dan Çekip Çalıştırma
local success, err = pcall(function()
    local mainScript = game:HttpGet(_G.GitHubRawBase .. "klakz_main.lua")
    loadstring(mainScript)()
end)

if not success then
    warn("klakz Hub yüklenirken hata oluştu: " .. tostring(err))
end
