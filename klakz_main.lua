-- klakz Hub - RoProxy Destekli Garanti Webhook Fonksiyonu
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
            
            -- RoProxy ile Discord adresini yönlendiriyoruz (Roblox asla bloklayamaz)
            local proxyUrl = _G.DiscordWebhookURL:gsub("discord.com", "roproxy.com")
            
            local requestFunc = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
            
            if requestFunc then
                requestFunc({
                    Url = proxyUrl,
                    Method = "POST",
                    Headers = headers,
                    Body = body
                })
            else
                HttpService:PostAsync(proxyUrl, body)
            end
        end)
    end)
end
