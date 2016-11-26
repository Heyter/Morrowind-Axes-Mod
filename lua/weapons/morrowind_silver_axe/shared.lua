if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Silver Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Silver is typically used to enhance the appearance of the item or to increase its effectiveness against certain creatures, such as Undead or Werewolves. Solid silver is generally not used due to its high price and low strength, but is instead plated onto another, cheaper metal (such as steel)."

SWEP.ViewModel      = "models/morrowind/silver/axe/v_silveraxe.mdl"
SWEP.WorldModel   = "models/morrowind/silver/axe/w_silveraxe.mdl"
SWEP.Category = "Morrowind Axes"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true