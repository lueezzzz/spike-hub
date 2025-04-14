import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';
import 'package:spike_hub/widgets/weapon-widgets/weapon_damage_range_row.dart';

class WeaponDamageStatsContainer extends StatelessWidget {
  final List<DamageRanges> damageRanges;

  const WeaponDamageStatsContainer({required this.damageRanges, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(248, 248, 248, 0.05),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: const Text(
              "DAMAGE",
              style: TextStyle(
                fontFamily: 'FuturaCn',
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color.fromRGBO(248, 248, 248, 1),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ...damageRanges.map(
            (range) => DamageRangeRow(range: range),
          ),
        ],
      ),
    );
  }
}
