if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Nordic Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Nordic weapons are high quality steel weapons enchanted with the runes of the witch-warriors of Skyrim for enhanced effectiveness."

SWEP.ViewModel      = "models/morrowind/nordic/axe/v_nordicwaraxe.mdl"
SWEP.WorldModel   = "models/morrowind/nordic/axe/w_nordicwaraxe.mdl"
SWEP.KnifeEnt = "ent_nordic_axe"