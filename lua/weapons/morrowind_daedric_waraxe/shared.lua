if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Daedric Waraxe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Daedric weapons are made from raw ebony which has been refined using the craft and magical substances of the lesser minions of Oblivion. The process is not a pleasant one for the Daedra involved, and the weapons retain echoes of preternaturally prolonged suffering endured during manufacture. Daedric weapons are the most rare and expensive weapons known in Tamriel."
  
SWEP.ViewModel      = "models/morrowind/daedric/waraxe/v_daedricwaraxe.mdl"
SWEP.WorldModel   = "models/morrowind/daedric/waraxe/w_daedricwaraxe.mdl"
SWEP.KnifeEnt = "ent_daedric_waraxe"