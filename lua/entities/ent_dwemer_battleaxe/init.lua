AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

/*---------------------------------------------------------
   Name: ENT:Initialize()
---------------------------------------------------------*/
function ENT:Initialize()
	
	self:SetModel( "models/morrowind/dwemer/battleaxe/w_dwemerbattleaxe.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType(MOVETYPE_VPHYSICS)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	local phys = self.Entity:GetPhysicsObject()
	self.NextThink = CurTime() + 1

	self.Entity:DrawShadow(false)

	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(10)
	end

	util.PrecacheSound("weapons/axe/morrowind_axe_hitwall1.wav")
	util.PrecacheSound("weapons/axe/morrowind_axe_hit.wav")

	self.Hit = { 
	Sound("weapons/axe/morrowind_axe_hitwall1.wav")};

	self.FleshHit = { 
	Sound("weapons/axe/morrowind_axe_hit.wav")}

	self:GetPhysicsObject():SetMass(2)	

	self.Entity:SetUseType(SIMPLE_USE)
end

/*---------------------------------------------------------
   Name: ENT:Think()
---------------------------------------------------------*/
function ENT:Think()
	
	self.lifetime = self.lifetime or CurTime() + 20

	if CurTime() > self.lifetime then
		self:Remove()
	end
end

/*---------------------------------------------------------
   Name: ENT:Disable()
---------------------------------------------------------*/
function ENT:Disable()

	self.PhysicsCollide = function() end
	self.lifetime = CurTime() + 30

	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)
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
				self:SetPos(data.HitPos - data.HitNormal * 10)
				self:SetAngles(data.HitNormal:Angle() + Angle(40,self:GetAngles().y,0))
				self:GetPhysicsObject():EnableMotion(false)
			else
				self:EmitSound(self.Hit[math.random(1, #self.Hit)])
			end

			self:Disable()

	elseif Ent.Health then
		if not(Ent:IsPlayer() or Ent:IsNPC() or Ent:GetClass() == "prop_ragdoll") then 
			util.Decal("ManhackCut", data.HitPos + data.HitNormal, data.HitPos - data.HitNormal)
			self:EmitSound(self.Hit[math.random(1, #self.Hit)])
			self:Disable()
		end

		Ent:TakeDamage(100, self:GetOwner())

		if (Ent:IsPlayer() or Ent:IsNPC() or Ent:GetClass() == "prop_ragdoll") then 
			local effectdata = EffectData()
			effectdata:SetStart(data.HitPos)
			effectdata:SetOrigin(data.HitPos)
			effectdata:SetScale(1)
			util.Effect("BloodImpact", effectdata)

			self:EmitSound(self.FleshHit[math.random(1,#self.Hit)])
			self:Remove()
		end
	end

	self.Entity:SetOwner(NUL)
end

/*---------------------------------------------------------
   Name: ENT:Use()
---------------------------------------------------------*/
function ENT:Use(activator, caller)

	self.Entity:Remove()

	if (activator:IsPlayer()) then
		if activator:GetWeapon("morrowind_dwemer_battleaxe") == NULL then
			activator:Give("morrowind_dwemer_battleaxe")
		else
			activator:GiveAmmo(1, "Xbowbolt")
		end
	end
end
