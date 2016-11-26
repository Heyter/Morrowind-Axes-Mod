if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Iron Battle Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Iron axes are the the most abundant and cheap axes available. Unfortunately they have a heavy weight and bend easily."

SWEP.ViewModel      = "models/morrowind/iron/battleaxe/v_ironbattleaxe.mdl"
SWEP.WorldModel   = "models/morrowind/iron/battleaxe/w_battleaxe.mdl"
SWEP.KnifeEnt = "ent_iron_battleaxe"