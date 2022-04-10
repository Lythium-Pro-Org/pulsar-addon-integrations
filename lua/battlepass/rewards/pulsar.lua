local REWARD = BATTLEPASS:CreateReward()
REWARD.Mat = "battlepass/credit.png"

function REWARD:CanUnlock(ply, reward)
    return true
end

function REWARD:GetTooltip(reward)
    local creditText = lang["creditSingle"]

    if tonumber(num) > 1 then
        creditText = lang["creditsSingle"]
    end

    return string.Comma(reward) .. creditText
end

function REWARD:GetName(reward)
    local creditText = lang["creditSingle"]

    if tonumber(num) > 1 then
        creditText = lang["creditsSingle"]
    end

    return string.Comma(reward) .. creditText
end

function REWARD:GetModel()
    return Lyth_Pulsar.Config.DefaultCreditLogo or "4qyX1DE"
end

function REWARD:Unlock(ply, reward)
    if (SERVER) then
        Lyth_Pulsar.GiveCredits(nil, ply, reward)
    end
end

REWARD:Register("PulsarCredits")