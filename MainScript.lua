repeat task.wait() until game:IsLoaded()
local sonicInjected = true
local gameCamera = workspace.CurrentCamera
local textService = game:GetService("TextService")
local playersService = game:GetService("Players")
local inputService = game:GetService("UserInputService")
local isfile = isfile or function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local setidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end
local getidentity = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity or function() return 0 end 
-- Stolen From Vape heheheheh ⬆️ 💀 ⬇️
if getcustomasset then 
	local suc, res = pcall(function() return getcustomasset("") end)
	if suc and res == "rbxasset://textures/ui/WarningIcon.png" then
		--mobile exploit fix
		getgenv().getsynasset = nil
		getgenv().getcustomasset = nil
		-- why is this needed
		getsynasset = nil
		getcustomasset = nil
	end
end
local queueonteleport = syn and syn.queue_on_teleport or queue_on_teleport or function() end
local delfile = delfile or function(file) writefile(file, "") end

local function displayErrorPopup(text, funclist)
	local oldidentity = getidentity()
	setidentity(8)
	local ErrorPrompt = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
	local prompt = ErrorPrompt.new("Default")
	prompt._hideErrorCode = true
	local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	prompt:setErrorTitle("Sonic")
	local funcs
	if funclist then 
		funcs = {}
		local num = 0
		for i,v in pairs(funclist) do 
			num = num + 1
			table.insert(funcs, {
				Text = i,
				Callback = function() 
					prompt:_close() 
					v()
				end,
				Primary = num == #funclist
			})
		end
	end
	prompt:updateButtons(funcs or {{
		Text = "OK",
		Callback = function() 
			prompt:_close() 
		end,
		Primary = true
	}}, 'Default')
	prompt:setParent(gui)
	prompt:_open(text)
	setidentity(oldidentity)
end
-- Stealing End --

local vWarn = "rbxassetid://13350794868"
local vInfo = "rbxassetid://13350774006" -- Icons Stolen From VapeV4
assert(not shared.SonicExe, "Sonic Already Injected!")
shared.SonicExe = true
shared.SonicInjected = true
if not isfolder("sonic") then
  makefolder("sonic")
end
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
if shared.Developer then
  if isfile("sonic/CustomModules/"..game.PlaceId..".lua") then 
    loadstring(readfile("sonic/CustomModules/"..game.PlaceId..".lua"))()
  else
    local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/KL-AE2160/SonicForRoblox/main/CustomModules/"..game.PlaceId..".lua") end)
    if not suc or res == "404: Not Found" then return end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KL-AE2160/SonicForRoblox/main/CustomModules/"..game.PlaceId..".lua"))()
  end
else
  local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/KL-AE2160/SonicForRoblox/main/CustomModules/"..game.PlaceId..".lua") end)
    if not suc or res == "404: Not Found" then return end
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KL-AE2160/SonicForRoblox/main/CustomModules/"..game.PlaceId..".lua"))()
end