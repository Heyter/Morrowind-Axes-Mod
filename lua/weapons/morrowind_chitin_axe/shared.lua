if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Chitin Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "The spiked chitin war axe favored by Ashlander and Great House Dunmer is in some ways more like a mace than an axe."
  
SWEP.ViewModel      = "models/morrowind/chitin/axe/v_chitinaxe.mdl"
SWEP.WorldModel   = "models/morrowind/chitin/axe/w_chitinaxe.mdl"
SWEP.KnifeEnt = "ent_chitin_axe"