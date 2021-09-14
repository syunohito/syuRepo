global function OnWeaponBulletHit_weapon_thermallmg
global function OnProjectileCollision_weapon_thermallmg

void function OnWeaponBulletHit_weapon_thermallmg( entity weapon, WeaponBulletHitParams hitParams )
{
	entity hitEnt = hitParams.hitEnt

	if ( IsValid( hitEnt ) )
	{
		#if SERVER
			BurnDamageSettings burnSettings
			burnSettings.preburnDuration 		= expect float( weapon.GetWeaponInfoFileKeyField( "preburn_duration" ) )
			burnSettings.burnDuration 			= expect float( weapon.GetWeaponInfoFileKeyField( "burn_duration" ) )
			burnSettings.burnDamage 			= expect int( weapon.GetWeaponInfoFileKeyField( "burn_damage" ) )
			burnSettings.burnTime 				= expect float( weapon.GetWeaponInfoFileKeyField( "burn_time" ) )
			burnSettings.burnTickRate 			= expect float( weapon.GetWeaponInfoFileKeyField( "burn_tick_rate" ) )
			burnSettings.soundBurnDamageTick_1P = expect string( weapon.GetWeaponInfoFileKeyField( "sound_burn_damage_tick_1p" ) )
			burnSettings.burnStackDebounce 		= expect float( weapon.GetWeaponInfoFileKeyField( "burn_stack_debounce" ) )
			burnSettings.burnStacksMax 			= expect int( weapon.GetWeaponInfoFileKeyField( "burn_stacks_max" ) )

			entity inflictor = CreateOncePerTickDamageInflictorHelper( burnSettings.burnDuration )

			TryApplyingBurnDamage( hitEnt, weapon.GetWeaponOwner(), inflictor, burnSettings )
		#endif	
	}
}

void function OnProjectileCollision_weapon_thermallmg( entity projectile, vector pos, vector normal, entity hitEnt, int hitbox, bool isCritical )
{
	if ( IsValid( hitEnt ) )
	{
		#if SERVER
			BurnDamageSettings burnSettings
			burnSettings.preburnDuration 		= expect float( projectile.ProjectileGetWeaponInfoFileKeyField( "preburn_duration" ) )
			burnSettings.burnDuration 			= expect float( projectile.ProjectileGetWeaponInfoFileKeyField( "burn_duration" ) )
			burnSettings.burnDamage 			= expect int( projectile.ProjectileGetWeaponInfoFileKeyField( "burn_damage" ) )
			burnSettings.burnTime 				= expect float( projectile.ProjectileGetWeaponInfoFileKeyField( "burn_time" ) )
			burnSettings.burnTickRate 			= expect float( projectile.ProjectileGetWeaponInfoFileKeyField( "burn_tick_rate" ) )
			burnSettings.soundBurnDamageTick_1P = expect string( projectile.ProjectileGetWeaponInfoFileKeyField( "sound_burn_damage_tick_1p" ) )
			burnSettings.burnStackDebounce 		= expect float( projectile.ProjectileGetWeaponInfoFileKeyField( "burn_stack_debounce" ) )
			burnSettings.burnStacksMax 			= expect int( projectile.ProjectileGetWeaponInfoFileKeyField( "burn_stacks_max" ) )

			entity inflictor = CreateOncePerTickDamageInflictorHelper( burnSettings.burnDuration )

			TryApplyingBurnDamage( hitEnt, projectile.GetOwner(), inflictor, burnSettings )
		#endif	
	}
}
