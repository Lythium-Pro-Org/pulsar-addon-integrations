Lyth_Pulsar = Lyth_Pulsar or {}
Lyth_Pulsar.DB = Lyth_Pulsar.DB or {}

XeninDS.Currencies:set("pulsar", {
    format = function(self, money) return string.Comma(money) .. " Credits" end,
    add = function(self, ply, money)
        if CLIENT then return end

            if money >= 0 then
                Lyth_Pulsar.GiveCredits(nil, ply, money)
            else
                Lyth_Pulsar.RemoveCredits(nil, ply, money)
            end
        end,
        get = function(self, ply)
            local playerID = ply:SteamID64()
            local credits = 0

            Lyth_Pulsar.GetCredits(playerID, function(data)
                credits = data.credits
            end)

        return credits
    end,
    canAfford = function(self, ply, amount)
        local playerID = ply:SteamID64()
        local credits = 0

            Lyth_Pulsar.GetCredits(playerID, function(data)
                credits = data.credits
            end)

        if credits >= amount then
            return true
        else
            return false
        end
    end
})
