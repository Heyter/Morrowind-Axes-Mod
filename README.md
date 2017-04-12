# Morrowind-Axes-Mod
A modified version of Tesiii axe swep pack
Fixes:
- Lack of lag compensation for traces and a bad method of dealing damage with melee
- Lack of a base swep for weapons that are almost exactly the same minus the models/names/descriptions
- Lack of a base entity for thrown axes which are exactly the same aside from model and what weapon they give (Made 1 thrown axe and the weapons just set the model to the "parent" weapon's world model and set the class to the "parent" weapon's class)
- Exploits because of the bad method of dealing damage
- Errors in the thrown swep relating to changing physics rules inside a callback
- Not using predicted means of setting the next primary leading to bad things

# To change damage
- Go into the weapon file and put in a line `SWEP.Primary.Damage = ` and then the damage you want, by default all of them do 50 damage.

# To make an axe unthrowable (or all)
- To make a single axe unthrowable go into the weapon file for that axe and put `SWEP.Throwable = false`
- To make ALL AXES unthrowable go into the base axe file and change `SWEP.Throwable` to equal false
