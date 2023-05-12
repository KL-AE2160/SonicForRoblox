repeat wait() until game:IsLoaded()
local executor = (identifyexecutor and identifyexecutor()) or "Unknown"
shared.executor = executor
local setidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end
local getidentity = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity or function() return 8 end
local isfile = isfile or function(file)
	local suc, res = pcall(function() return readfile(file) end)
	return suc and res ~= nil
end
local delfile = delfile or function(file)
  writefile(file, "")
end
local function displayErrorPopup(text, func)
	local oldidentity = getidentity()
	setidentity(8)
	local ErrorPrompt = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
	local prompt = ErrorPrompt.new("Default")
	prompt._hideErrorCode = true
	local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	prompt:setErrorTitle("Sonic")
	prompt:updateButtons({{
		Text = "OK",
		Callback = function() 
			prompt:_close() 
			if func then func() end
		end,
		Primary = true
	}}, 'Default')
	prompt:setParent(gui)
	prompt:_open(text)
	setidentity(oldidentity)
end
local playersService = game:GetService("Players")
local Player = playersService.LocalPlayer
if executor == "Unknown" then
  Player:Kick("Failed to detect executor. Please do not use custom executor. This kick is to ensure the stability of the script. See Ya Next Time!")
  wait(5)
  game:Shutdown()
  return
end
return loadstring(game:HttpGet("https://raw.githubusercontent.com/KL-AE2160/SonicForRoblox/main/MainScript.lua"))()