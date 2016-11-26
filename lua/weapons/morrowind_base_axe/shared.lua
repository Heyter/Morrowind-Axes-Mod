if( SERVER ) then
	AddCSLuaFile( "shared.lua" )
end

if( CLIENT ) then
	SWEP.PrintName = "Base Axe"
	SWEP.Slot = 3
	SWEP.SlotPos = 3
	SWEP.DrawAmmo = false
	SWEP.DrawCrosshair = false
end

SWEP.Category = "Morrowind Axes"
SWEP.Author			= "Doug Tyrrell + Mad Cow For LUA (Models, Textures, ect. By: Hellsing/JJSteel) - Modified by end360"
SWEP.Instructions	= "Left click to stab/slash/lunge and right click to throw, Throwing will be cabable on all future weapons for added coolness/badassery."
SWEP.Contact		= "end360 on steam"
SWEP.Purpose		= "A Dwemer Waraxe, though heavier than steel, are highly sought after for their resistance to corrosion, unmatched craftsmanship, their ability to keep an edge, and even just for their rarity. Dwarven items have not been produced since the disappearance of the Dwemer long ago and are truly a treasure whether in the battlefield or on display."

SWEP.ViewModelFOV	= 72
SWEP.ViewModelFlip	= false

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false
  
SWEP.ViewModel      = "models/morrowind/dwemer/axe/v_dwemeraxe.mdl"
SWEP.WorldModel   = "models/morrowind/dwemer/axe/w_dwemeraxe.mdl"
  
SWEP.Primary.Recoil		= 5
SWEP.Primary.Damage		= 50
SWEP.Primary.NumShots		= 0
SWEP.Primary.Cone			= 0.075
SWEP.Primary.Delay 		= 0.5

SWEP.Primary.ClipSize		= -1					// Size of a clip
SWEP.Primary.DefaultClip	= 1					// Default number of bullets in a clip
SWEP.Primary.Automatic		= true				// Automatic/Semi Auto
SWEP.Primary.Ammo			= "XBowBolt"

SWEP.Secondary.ClipSize		= -1					// Size of a clip
SWEP.Secondary.DefaultClip	= -1					// Default number of bullets in a clip
SWEP.Secondary.Automatic	= false				// Automatic/Semi Auto
SWEP.Secondary.Ammo		= "none"

SWEP.ShellEffect			= "none"				// "effect_mad_shell_pistol" or "effect_mad_shell_rifle" or "effect_mad_shell_shotgun"
SWEP.ShellDelay			= 0

SWEP.Throwable = true

SWEP.KnifeEnt = "ent_dwemer_axe"
util.PrecacheSound("weapons/axe/morrowind_axe_deploy1.wav")
util.PrecacheSound("weapons/axe/morrowind_axe_hitwall1.wav")
util.PrecacheSound("weapons/axe/morrowind_axe_hit.wav")
util.PrecacheSound("weapons/axe/morrowind_axe_slash.wav")

function SWEP:Initialize()
    	self:SetWeaponHoldType("melee2")
	self.Hit = Sound( "weapons/axe/morrowind_axe_hitwall1.wav" )
	self.FleshHit = Sound("weapons/axe/morrowind_axe_hit.wav") 
end

function SWEP:Precache()
end

function SWEP:Deploy()
	self.Owner:EmitSound("weapons/axe/morrowind_axe_deploy1.wav")
	return true
end
function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire( CurTime() + .5 )
	if (IsFirstTimePredicted()) then
 	
	local tracedata = {}

	tracedata.start = self.Owner:GetShootPos()
	tracedata.endpos = self.Owner:GetShootPos() + self.Owner:GetAimVector() * 75
	tracedata.filter = self.Owner
	tracedata.mins = Vector( -8 , -8 , -8 )
	tracedata.maxs = Vector( 8 , 8 , 8 )
	if ( self.Owner:IsPlayer() ) then
		self.Owner:LagCompensation( true )
	end

	local tr = util.TraceHull( tracedata )

	if ( self.Owner:IsPlayer() ) then
		self.Owner:LagCompensation( false )
	end
	if tr.HitPos:Distance(self.Owner:GetShootPos()) <= 75 then
		if( tr.Entity:IsPlayer() or tr.Entity:IsNPC() or tr.Entity:GetClass()=="prop_ragdoll" ) then
			self.Owner:EmitSound( self.FleshHit )
		else
			self.Owner:EmitSound( self.Hit)
		end
			self.Owner:SetAnimation( PLAYER_ATTACK1 )
			self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER )

			local dmginfo = DamageInfo()
			dmginfo:SetAttacker((IsValid(self.Owner) and self.Owner) or self)
			dmginfo:SetInflictor(self)
			dmginfo:SetDamage(self.Primary.Damage or 50)

			tr.Entity:TakeDamageInfo(dmginfo)
	else
		self.Owner:SetAnimation( PLAYER_ATTACK1 )
		self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER )
		self.Weapon:EmitSound("weapons/axe/morrowind_axe_slash.wav")
	end
end
end

function RemoveKnife( ent )
	if ent:IsValid() then
		ent:Remove()
	end
end

function SWEP:SecondaryAttack()

	if !self.Throwable or self.Weapon:GetNetworkedBool("Holstered") or self.Owner:KeyDown(IN_SPEED) or self.Owner:GetAmmoCount(self.Primary.Ammo) < 1 then return end

	self.Weapon:EmitSound("weapons/axe/morrowind_axe_slash.wav")
	self.Weapon:SetNextPrimaryFire(CurTime() + 1)
	self.Weapon:SetNextSecondaryFire(CurTime() + 1)
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
	self.Owner:RemoveAmmo(1, self.Primary.Ammo)
	if (SERVER) then
		local knife = ents.Create("ent_thrown_axe")
		knife:SetAngles(self.Owner:EyeAngles())
		local pos = self.Owner:GetShootPos() + self.Owner:GetForward() * 5 + self.Owner:GetRight() * 9 + self.Owner:GetUp() * -5
		knife:SetPos(pos)

		knife:SetOwner(self.Owner)
		knife:SetPhysicsAttacker(self.Owner)
		knife:Spawn()
		knife:Activate()

		knife:SetModel(self.WorldModel)
		knife.ParentWeapon = self.ClassName
		
		self.Owner:SetAnimation(PLAYER_ATTACK1)

		local phys = knife:GetPhysicsObject()
		phys:SetVelocity(self.Owner:GetAimVector() * 1500)
		phys:AddAngleVelocity(Vector(0, 500, 0))
	end
	if(!self.Weapon:HasAmmo()) then
		self.Weapon:Remove()
	end
end