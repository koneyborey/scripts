repeat wait() until game:IsLoaded()
local cache = {}
local Services = setmetatable({}, {
    __index = function(_, serviceName)
        local service = cache[serviceName]
        if not service then
            service = cloneref(game:GetService(serviceName))
            cache[serviceName] = service
        end
        return service
    end
})

local blockedExecutors = {"Electron"}
local executor = identifyexecutor()

if table.find(blockedExecutors, executor) then
    local function Kick(title, reason)
    	Services.Players.LocalPlayer.Kick(player, "")
    
    	local kick = Services.CoreGui.RobloxPromptGui.promptOverlay:WaitForChild("ErrorPrompt")
        kick.TitleFrame.ErrorTitle.Text = title
    	kick.MessageArea.ErrorFrame.ErrorMessage.Text = reason
    end

    return Kick("Executor not supported", "Please switch to a more stable executor like Fluxus")
end
        

local options = ({...})[1] or {
    Method = 1,
    Keybind = "F",
    ShowMethodDictionary = true
}

local content = Services.HttpService:JSONEncode(options)
writefile("data.txt", content)

loadstring(game:HttpGet("https://raw.githubusercontent.com/synnyyy/synergy/betterbypasser/normalbetterbypasser", true))()
          