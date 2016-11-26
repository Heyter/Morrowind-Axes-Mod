if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Steel Battle Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Steel,made from a refined form of iron, is another of the more common metals used to produce weapons and heavy armor.Its hardness is greater than that of iron, which leads to higher quality items with about the same weight. Steel is the choice of the common soldier and mercenary who cannot afford some of the higher quality materials."

SWEP.ViewModel      = "models/morrowind/steel/battleaxe/v_steelbattleaxe.mdl"
SWEP.WorldModel   = "models/morrowind/steel/battleaxe/w_steelbattleaxe.mdl"
SWEP.KnifeEnt = "ent_steel_battleaxe"