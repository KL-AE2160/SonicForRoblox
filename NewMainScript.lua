repeat task.wait() until game:IsLoaded()
local isfile = isfile or function(x)
  local suc, res = pcall(function() return readfile(x) end)
  return suc and res ~= nil
end
local delfile = delfile or function(x)
  return writefile(x, "")
end
local setidentity = syn and syn.set_thread_identity or set_thread_identity or setidentity or setthreadidentity or function() end
local getidentity = syn and syn.get_thread_identity or get_thread_identity or getidentity or getthreadidentity or function() return 8 end
local function dep(text, func)
	local oldidentity = getidentity()
	setidentity(8)
	local ErrorPrompt = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
	local prompt = ErrorPrompt.new("Default")
	prompt._hideErrorCode = true
	local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
	prompt:setErrorTitle("SonicScript")
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
local eps = false
loadstring(game:HttpGet("https://raw.githubusercontent.com/KL-AE2160/SonicForRoblox/main/MainScript.lua"))()