local customShopSystem = {}
customShopSystem.name = "Pulsar Store"
customShopSystem.priority = 10

function customShopSystem.GetPoints(ply)
	return Lyth_Pulsar.DB.GetCredits(ply:SteamID64(), nil, true)
end

if SERVER then
  function customShopSystem.TakePoints(ply, amount)
    Lyth_Pulsar.DB.RemoveCredits("Easy Skins", ply, amount)
  end

  function customShopSystem.GivePoints(ply, amount)
    Lyth_Pulsar.DB.GiveCredits("Easy Skins", ply, amount, false)
  end
end

return customShopSystem