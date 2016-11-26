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
SWEP.Purpose		= "Steel,made from a refined form of iron, is another of the more common metals used to produce weapons and heavy armor.Its hardness is greater than that of iron, which leads to higher quality items with about the same weight. Steel is the choice of the common soldier and mercenary who cannot afford some of the higher quality materials."
SWEP.Category = "Morrowind Axes"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true