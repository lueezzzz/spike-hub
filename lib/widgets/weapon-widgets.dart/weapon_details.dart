import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';
import 'package:spike_hub/widgets/weapon-widgets.dart/weapon_damage_stats_container.dart';
import 'package:spike_hub/widgets/weapon-widgets.dart/weapon_header.dart';
import 'package:spike_hub/widgets/weapon-widgets.dart/weapon_icon_type_row.dart';
import 'package:spike_hub/widgets/weapon-widgets.dart/weapon_stats_row.dart';

class WeaponDetails extends StatefulWidget {
  final Weapon weapon;
  final ScrollController scrollController;

  const WeaponDetails({
    required this.weapon,
    required this.scrollController,
    super.key,
  });

  @override
  State<WeaponDetails> createState() => _WeaponDetailsState();
}

class _WeaponDetailsState extends State<WeaponDetails> {
  @override
  Widget build(BuildContext context) {
    final weapon = widget.weapon;

    return Container(
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(15, 25, 35, 1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(70),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WeaponHeader(weapon: weapon),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          WeaponIconAndTypeRow(weapon: weapon),
                          const SizedBox(height: 40),
                          WeaponStatsRow(weapon: weapon),
                          const SizedBox(height: 20),
                          WeaponDamageStatsContainer(
                              damageRanges: weapon.weaponStats!.damageRanges!),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
