if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Ebony Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Ebony axes are created from a rare form of volcanic glass buried in the lava flows from Vvardenfell's Red Mountain.Thus Ebony axes are very high quality and are much sought-after."

SWEP.ViewModel      = "models/morrowind/ebony/axe/v_ebonyaxe.mdl"
SWEP.WorldModel   = "models/morrowind/ebony/axe/w_ebonyaxe.mdl"
SWEP.KnifeEnt = "ent_ebony_axe"