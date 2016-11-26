AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')
ENT.ParentWeapon = "morrowind_chitin_axe"
ENT.SetPosTo = nil
ENT.SetAngTo = nil
ENT.ShouldRemoveOwner = false
ENT.DealtDamage = false
ENT.ChangeCollision = false
/*---------------------------------------------------------
   Name: ENT:Initialize()
---------------------------------------------------------*/
function ENT:Initialize()
	
	self:SetModel( "models/morrowind/chitin/axe/w_chitinaxe.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	local phys = self.Entity:GetPhysicsObject()
	self.NextThink = CurTime() + 1

	self.Entity:DrawShadow(false)

	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(2)
	end

	util.PrecacheSound("weapons/axe/morrowind_axe_hitwall1.wav")
	util.PrecacheSound("weapons/axe/morrowind_axe_hit.wav")

	self.Hit = Sound("weapons/axe/morrowind_axe_hitwall1.wav")

	self.FleshHit =	Sound("weapons/axe/morrowind_axe_hit.wav")
	self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
	self.Entity:SetUseType(SIMPLE_USE)
end

/*---------------------------------------------------------
   Name: ENT:Think()
---------------------------------------------------------*/
function ENT:Think()
	
	self.lifetime = self.lifetime or CurTime() + 20
	if self.SetPosTo then
		self:SetPos(self.SetPosTo)
		self.SetPosTo = nil
		if self.SetAngTo then
			self:SetAngles(self.SetAngTo)
			self.SetAngTo = nil
		end
	end
	if self.ShouldRemoveOwner then
		self.Entity:SetOwner(nil)
	end
	if self.ChangeCollision then
		self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	end
	if CurTime() > self.lifetime then
		self:Remove()
	end
end


/*---------------------------------------------------------
   Name: ENT:PhysicsCollided()
---------------------------------------------------------*/
function ENT:PhysicsCollide(data, phys)
	
	local Ent = data.HitEntity
	if !(IsValid(Ent) or Ent:IsWorld()) then return end

	if Ent:IsWorld() then
			util.Decal("ManhackCut", data.HitPos + data.HitNormal, data.HitPos - data.HitNormal)

			if self.Entity:GetVelocity():Length() > 400 then
				self:EmitSound("npc/roller/blade_out.wav", 60)
				self.SetPosTo = data.HitPos - data.HitNormal * 10 
				self.SetAngTo = data.HitNormal:Angle()+ Angle(40,self:GetAngles().y,0)
				self:GetPhysicsObject():EnableMotion(false)
			else
				self:EmitSound(self.Hit)
			end
			self.ChangeCollision = true
	elseif Ent.Health then
		if not(Ent:IsPlayer() or Ent:IsNPC() or Ent:GetClass() == "prop_ragdoll") then 
			util.Decal("ManhackCut", data.HitPos + data.HitNormal, data.HitPos - data.HitNormal)
			self:EmitSound(self.Hit)
		end
		if(!self.DealtDamage) then
			Ent:TakeDamage(100, self:GetOwner())
			self.DealtDamage = true
		end
		if (Ent:IsPlayer() or Ent:IsNPC() or Ent:GetClass() == "prop_ragdoll") then 
			local effectdata = EffectData()
			effectdata:SetStart(data.HitPos)
			effectdata:SetOrigin(data.HitPos)
			effectdata:SetScale(1)
			util.Effect("BloodImpact", effectdata)

			self:EmitSound(self.FleshHit)
			self:Remove()
		end
	end

	self.ShouldRemoveOwner = true
end

/*---------------------------------------------------------
   Name: ENT:Use()
---------------------------------------------------------*/
function ENT:Use(activator, caller)

	self.Entity:Remove()

	if (activator:IsPlayer()) then
		if activator:GetWeapon(self.ParentWeapon) == NULL then
			activator:Give(self.ParentWeapon)
		else
			activator:GiveAmmo(1, "Xbowbolt")
		end
	end
end
