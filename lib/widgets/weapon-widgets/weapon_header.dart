import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';

class WeaponHeader extends StatelessWidget {
  final Weapon weapon;

  const WeaponHeader({required this.weapon, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            weapon.displayName!.toUpperCase(),
            style: const TextStyle(
              color: Color.fromRGBO(248, 248, 248, 1),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 70, 86, 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              weapon.shopData!.cost!.toString(),
              style: const TextStyle(
                color: Color.fromRGBO(248, 248, 248, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
