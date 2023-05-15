repeat task.wait() until gam:IsLoaded()
if not identityexecutor then
  game:GetService("Players").LocalPlayer:Kick("[UnknownExecutor]: Missing identifyexecutor.")
end
local isfile = isfile or function(x)
  local suc, res = pcall(function() return readfile(x) end)
  return suc and res ~= nil
end
local delfile = delfile or function(x) return writefile(x, "") end
local suc, whitelist = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/KL-AE2160/SonicForRoblox/main/whitelist.json") end)
local TextService = game:GetService"TextService"
local Players = game:GetService"Players"
local TextChatService = game:GetService"TextChatService"
local InputService = game:GetService"UserInputService"
local RunService = game:GetService"RunService"
local TweenService = game:GetService"TweenService"
local CollectionService = game:GetService"CollectionService"
local ReplicatedStorage = game:GetService"ReplicatedStorage"
local ChatTable
local ChatFunction
if getconnections then
  for i, v in pairs(getconnections(ReplicatedStorage.DefaultChatSystemChatEvents.OnNewMessage.OnClientEvent)) do
    if v.Function and #debug.getupvalues(v.Function) > 0 and type(debug.getupvalues(v.Function)[1]) == "table" and getmetatable(debug.getupvalues(v.Function)[1]) and getmetatable(debug.getupvalues(v.Function)[1]).GetChannel then
      ChatTable = getmetatable(debug.getupvalues(v.Function)[1])
      ChatFunction = getmetatable(debug.getupvalues(v.Function)[1]).GetChannel
      getmetatable(debug.getupvalues(v.Function)[1]).GetChannel = function(Self, Name)
        local tab = ChatFunction(Self, Name)
        if tab and tab.AddMessageToChannel then
          local AddMsg = tab.AddMessageToChannel
          if ChatFunction[tab] == nil then
            ChatFunction[tab] = tab.AddMessageToChannel
          end
          tab.AddMessageToChannel = function(Selx, MessageData)
            if MessageData.FromSpeaker and Players[MessageData.FromSpeaker] then
              local plr = Players[MessageData.FromSpeaker]
              local pos = whitelist[plr.UserId] and whitelist[plr.UserId].Position
              local tag = whitelist[plr.UserId] and whitelist[plr.UserId].Tag
              if pos == 4 then
                MessageData.ExtraData = {
                  NameColor = Color3.fromRGB(255, 255, 255),
                  Tags = {
                    table.unpack(MessageData.ExtraData.Tags),
                    {
                      TagColor = Color3.new(1, 0.3, 0.3),
                      TagText = tag or "SONIC OWNER"
                    }
                  }
                }
              end
            end
end
          end
        end
        return tab
      end
    end
  end
end