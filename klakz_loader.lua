-- klakz Hub - Professional Loader & Main Hub
-- Bu dosyayı GitHub'a yükleyip raw linkini alabilirsin.

_G.KlakzHub_Version = "v3.0"
_G.GitHubRawBase = "BURAYA_GITHUB_RAW_KLASOR_LINKINI_YAZ" -- Örn: https://raw.githubusercontent.com/kullaniciadi/proje/main/
_G.DiscordWebhookURL = "BURAYA_DISCORD_WEBHOOK_LINKINI_YAZ"

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

-- Ana Arayüz Scriptini GitHub'dan Çekip Çalıştırma (Auto-Update Sistemi)
local success, err = pcall(function()
    local mainScript = game:HttpGet(_G.GitHubRawBase .. "klakz_main.lua")
    loadstring(mainScript)()
end)

if not success then
    warn("klakz Hub yüklenirken hata oluştu: " .. tostring(err))
end
