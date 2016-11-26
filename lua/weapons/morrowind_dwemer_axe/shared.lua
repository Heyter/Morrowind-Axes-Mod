if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Dwemer Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "A Dwemer Waraxe, though heavier than steel, are highly sought after for their resistance to corrosion, unmatched craftsmanship, their ability to keep an edge, and even just for their rarity. Dwarven items have not been produced since the disappearance of the Dwemer long ago and are truly a treasure whether in the battlefield or on display."

SWEP.ViewModel      = "models/morrowind/dwemer/axe/v_dwemeraxe.mdl"
SWEP.WorldModel   = "models/morrowind/dwemer/axe/w_dwemeraxe.mdl"
SWEP.Category = "Morrowind Axes"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true