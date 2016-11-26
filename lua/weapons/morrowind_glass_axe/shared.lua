if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Glass Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Glass weapons and armor are an ornate design: light and flexible, although very difficult to make and expensive. Glass armor is a lightweight armor created using rare metals studded with volcanic glass. The result is stronger than steel due to its ability to absorb and distribute shocks very well. Glass armor not only surpasses other light armor in strength, but is also superior to most medium armor (with the exception of a few Artifacts and some new medium armor added by the two expansions). The armor is favored by the Buoyant Armigers, and one of the only places it can be found for sale is at their stronghold in Ghostgate."

SWEP.ViewModel      = "models/morrowind/glass/axe/v_glassaxe.mdl"
SWEP.WorldModel   = "models/morrowind/glass/axe/w_glassaxe.mdl"
SWEP.Category = "Morrowind Axes"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true