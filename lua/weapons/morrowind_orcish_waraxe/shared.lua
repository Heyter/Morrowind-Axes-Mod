if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Orcish Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end
SWEP.Base = "morrowind_base_axe"
SWEP.Purpose		= "Orcish armor is an ornate, light steel plate design which is worn over cloth padding resulting in a light and comfortable fit when compared to other steel plate designs. The armor is based on High Elven designs and is somewhat expensive to purchase. Not surprisingly it most favored by Orcs, although it is not exclusive to their race."
  
SWEP.ViewModel      = "models/morrowind/orcish/waraxe/v_orcishwaraxe.mdl"
SWEP.WorldModel   = "models/morrowind/orcish/waraxe/w_orcishwaraxe.mdl"
SWEP.Category = "Morrowind Axes"
SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true