if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Daedric Battleaxe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Daedric weapons are made from raw ebony which has been refined using the craft and magical substances of the lesser minions of Oblivion. The process is not a pleasant one for the Daedra involved, and the weapons retain echoes of preternaturally prolonged suffering endured during manufacture. Daedric weapons are the most rare and expensive weapons known in Tamriel."
  
SWEP.ViewModel      = "models/morrowind/daedric/battleaxe/v_daedricbattleaxe.mdl"
SWEP.WorldModel   = "models/morrowind/daedric/battleaxe/w_daedricbattleaxe.mdl"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true
SWEP.Category = "Morrowind Axes"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true