Lyth_Pulsar = Lyth_Pulsar or {}
Lyth_Pulsar.Config = Lyth_Pulsar.Config or {}

local DROP = CarePackage:CreateDrop()
DROP.InventoryEnabled = false
DROP.EquipName = function()
    return "Credits"
end

function DROP:CanLoot(ent, ply, type)
    return true
end

function DROP:Loot(ent, ply, type)
    Lyth_Pulsar.DB.GiveCredits(ply, ent)
end

function DROP:GetName(ent)
    local creditText = lang["creditSingle"]

    if tonumber(num) > 1 then
        creditText = lang["creditsSingle"]
    end

    return string.Comma(ent) .. creditText
end

function DROP:GetModel(ent)
    return Lyth_Pulsar.Config.DefaultCreditLogo or "4qyX1DE"
end

DROP:Register("PulsarCredits")