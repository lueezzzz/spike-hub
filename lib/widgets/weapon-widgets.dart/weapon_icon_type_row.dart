import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';
import 'package:spike_hub/widgets/weapon-widgets.dart/weapon_stats.dart';

class WeaponIconAndTypeRow extends StatelessWidget {
  final Weapon weapon;

  const WeaponIconAndTypeRow({required this.weapon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: WeaponStatsItem(
            label: "ICON",
            child: Container(
              child: weapon.displayIcon != null
                  ? CachedNetworkImage(
                      imageUrl: weapon.displayIcon!,
                      fit: BoxFit.contain,
                      width: 85,
                      color: Colors.white,
                    )
                  : const Icon(Icons.error, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: WeaponStatsItem(
            label: "GUN TYPE",
            value: weapon.category?.split("::").last ?? 'N/A',
          ),
        ),
        Expanded(
          child: WeaponStatsItem(
            label: "WALL PEN",
            value:
                weapon.weaponStats?.wallPenetration?.split("::").last ?? 'N/A',
          ),
        ),
      ],
    );
  }
}
