Lyth_Pulsar = Lyth_Pulsar or {}
Lyth_Pulsar.Lang = Lyth_Pulsar.Lang or {}
local lang = Lyth_Pulsar.Lang

local MODULE = GAS.Logging:MODULE()
MODULE.Category = "Lyth_Pulsar"
MODULE.Name = "Lyth_Pulsar"
MODULE.Colour = Color(130, 90, 255)

local function checkText(num)
    local creditText = lang["creditSingle"]

    if tonumber(num) > 1 then
        creditText = lang["creditsSingle"]
    end

    return creditText
end

MODULE:Setup(function()
    MODULE:Hook("Lyth_Pulsar.PlayerGivenCredits", "Lyth_Pulsar.GASLog.PlayerGiven", function(callingPly, target, num)
        MODULE:Log("{1} gave {2} {3} to {4}", GAS.Logging:FormatPlayer(callingPly), GAS.Logging:Highlight(num), checkText(num), GAS.Logging:FormatPlayer(target))
    end)

    MODULE:Hook("Lyth_Pulsar.PlayerRemovedCredits", "Lyth_Pulsar.GASLog.PlayerRemoved", function(callingPly, target, num)
        MODULE:Log("{1} removed {2} {3} from {4}", GAS.Logging:FormatPlayer(callingPly), GAS.Logging:Highlight(num), checkText(num), GAS.Logging:FormatPlayer(target))
    end)

    MODULE:Hook("Lyth_Pulsar.PlayerPurchase", "Lyth_Pulsar.GASLog.PlayerPurchase", function(ply, item, price)
        MODULE:Log("{1} purchased {2} for {3} credits", GAS.Logging:FormatPlayer(ply), GAS.Logging:Highlight(item), GAS.Logging:Highlight(price))
    end)
end)

GAS.Logging:AddModule(MODULE)
