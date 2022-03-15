Lyth_Pulsar = Lyth_Pulsar or {}

local function loadAddon()
    Lyth_Pulsar.Log("info", "Loaded Pulsar Intergrations")
    hook.Run("Pulsar.IntergrationsLoaded")
end

if Lyth_Pulsar then
    loadAddon()
    return
end

hook.Add("Pulsar.Loaded", "PulsarInter.WaitForPulsar", loadAddon)
