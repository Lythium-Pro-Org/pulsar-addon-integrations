Lyth_Pulsar = Lyth_Pulsar or {}
Lyth_Pulsar.Lang = Lyth_Pulsar.Lang or {}
local lang = Lyth_Pulsar.Lang

CATEGORY_NAME = "Pulsar"

-- Give Credits
function ulx.givecredits( calling_ply, target_ply, num )
    if SERVER then
        Lyth_Pulsar.DebugLog(target_ply)
        Lyth_Pulsar.GiveCredits(calling_ply, target_ply, num)
    end
    local name = "credits"
    if num == "1" then name = "credit" end

    ulx.fancyLogAdmin(calling_ply, true, lang["ULXGiveCredits"], target_ply, num, name )
end

local pulsar_give = ulx.command(CATEGORY_NAME, "ulx givecredits", ulx.givecredits, "!givecredits")
pulsar_give:addParam{ type = ULib.cmds.PlayerArg }
pulsar_give:addParam{ type = ULib.cmds.StringArg, hint = lang["SAMGiveCreditsNumHint"], ULib.cmds.takeRestOfLine }
pulsar_give:defaultAccess( ULib.ACCESS_SUPERADMIN  )
pulsar_give:help(lang["SAMGiveCreditsHelp"])

-- Remove Credits
function ulx.removecredits( calling_ply, target_ply, num )
    if SERVER then
        Lyth_Pulsar.DebugLog(target_ply)
        Lyth_Pulsar.RemoveCredits(calling_ply, target_ply, num)
    end
    local name = "credits"
    if num == "1" then name = "credit" end

    ulx.fancyLogAdmin(calling_ply, true, lang["ULXRemoveCredits"], num, name, target_ply )
end

local pulsar_remove = ulx.command(CATEGORY_NAME, "ulx removecredits", ulx.removecredits, "!removecredits")
pulsar_remove:addParam{ type = ULib.cmds.PlayerArg }
pulsar_remove:addParam{ type = ULib.cmds.StringArg, hint = lang["SAMRemoveCreditsNumHint"], ULib.cmds.takeRestOfLine }
pulsar_remove:defaultAccess( ULib.ACCESS_SUPERADMIN  )
pulsar_remove:help(lang["SAMRemoveCreditsHelp"])
