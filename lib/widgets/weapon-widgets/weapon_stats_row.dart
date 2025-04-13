import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';
import 'package:spike_hub/widgets/weapon-widgets/weapon_stats.dart';

class WeaponStatsRow extends StatelessWidget {
  final Weapon weapon;

  const WeaponStatsRow({required this.weapon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: WeaponStatsItem(
            label: "FIRE RATE",
            value: weapon.weaponStats?.fireRate != null
                ? "${weapon.weaponStats!.fireRate}/s"
                : "N/A",
          ),
        ),
        Expanded(
          child: WeaponStatsItem(
            label: "RELOAD SPD",
            value: weapon.weaponStats?.reloadTimeSeconds != null
                ? "${weapon.weaponStats!.reloadTimeSeconds} Sec"
                : "N/A",
          ),
        ),
        Expanded(
          child: WeaponStatsItem(
            label: "MAG SIZE",
            value: weapon.weaponStats?.magazineSize?.toString() ?? 'N/A',
          ),
        ),
      ],
    );
  }
}
