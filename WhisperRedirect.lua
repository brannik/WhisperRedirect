local allowedCharacterToActivate = "" -- char to recieve send te whisper aka the recruiter
local targets = {"Char 1","Char 2"} -- reciever character


local function findFirstOnlineTargetWithDelay(targetss,sender,message)
    local index = 1

    while index <= #targetss do
        local target = targetss[index]
        local _, class = UnitClass(sender)
        if class then
            SendChatMessage("[" .. class .. "]" .. sender .. " -> " .. message  , "WHISPER", nil, target)
        else
            SendChatMessage(sender .. " -> " .. message  , "WHISPER", nil, target)
        end
        print("Index " .. targetss[index])
        index = index + 1
    end
end


local function OnWhisperReceived(self, event, message, sender, ...)
    if UnitName("player") == allowedCharacterToActivate then
        findFirstOnlineTargetWithDelay(targets,sender,message)
        print("Received whisper from " .. sender .. ": " .. message)
    end
end

-- Register the event handler
local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_WHISPER")
frame:SetScript("OnEvent", OnWhisperReceived)