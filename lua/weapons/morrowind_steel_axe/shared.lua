if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Steel Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"

SWEP.ViewModel      = "models/morrowind/steel/axe/v_steelaxe.mdl"
SWEP.WorldModel   = "models/morrowind/steel/axe/w_steelaxe.mdl"
  
SWEP.KnifeEnt = "ent_steel_axe"