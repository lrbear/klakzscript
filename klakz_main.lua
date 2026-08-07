-- Gelişmiş ve Engellenemeyen Discord Webhook Fonksiyonu
local function SendWebhook(title, desc, color, enteredKey, keyType)
    if not _G.DiscordWebhookURL or _G.DiscordWebhookURL == "" or _G.DiscordWebhookURL:find("BURAYA") then return end
    
    task.spawn(function()
        pcall(function()
            local fields = {
                {["name"] = "👤 Oyuncu Adı", ["value"] = LocalPlayer.Name, ["inline"] = true},
                {["name"] = "🎮 Oyun ID", ["value"] = tostring(game.GameId), ["inline"] = true}
            }
            if enteredKey then
                table.insert(fields, {["name"] = "🗝️ Girilen Key", ["value"] = "||" .. enteredKey .. "||", ["inline"] = false})
                table.insert(fields, {["name"] = "🔑 Giriş Türü", ["value"] = keyType, ["inline"] = true})
            end

            local data = {
                ["embeds"] = {{
                    ["title"] = title,
                    ["description"] = desc,
                    ["color"] = color,
                    ["fields"] = fields,
                    ["footer"] = { ["text"] = "klakz Hub Security & Analytics | " .. os.date("%H:%M:%S") }
                }}
            }
            
            local body = HttpService:JSONEncode(data)
            local headers = {["Content-Type"] = "application/json"}
            
            -- Roblox'un engelini aşmak için doğrudan executor istek fonksiyonunu kullanıyoruz
            local requestFunc = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
            
            if requestFunc then
                requestFunc({
                    Url = _G.DiscordWebhookURL,
                    Method = "POST",
                    Headers = headers,
                    Body = body
                })
            else
                -- Eğer özel istek fonksiyonu yoksa son çare PostAsync
                HttpService:PostAsync(_G.DiscordWebhookURL, body)
            end
        end)
    end)
end
