//このファイルは.txtの部分を削除してお使いください

global function OnWeaponPrimaryAttack_ability_tp
global function OnWeaponChargeBegin_ability_tp

var function OnWeaponPrimaryAttack_ability_tp( entity weapon, WeaponPrimaryAttackParams attackParams )
{
	entity player = weapon.GetWeaponOwner()
	return weapon.GetWeaponSettingInt( eWeaponVar.ammo_per_shot )
}

bool function OnWeaponChargeBegin_ability_tp( entity weapon )
{
	entity player = weapon.GetWeaponOwner()
	#if SERVER
		vector origin = GetPlayerCrosshairOrigin( player )
		player.SetOrigin( origin )
		PlayerUsedOffhand( player, weapon )
	#endif
	return true
}