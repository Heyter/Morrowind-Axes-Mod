if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Iron Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Iron axes are the the most abundant and cheap axes available. Unfortunately they have a heavy weight and bend easily."
  
SWEP.ViewModel      = "models/morrowind/iron/axe/v_ironaxe.mdl"
SWEP.WorldModel   = "models/morrowind/iron/axe/w_ironaxe.mdl"
SWEP.Category = "Morrowind Axes"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true