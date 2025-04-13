import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';
import 'package:spike_hub/widgets/weapon-widgets/weapon_details.dart';

class WeaponDetailsPage extends StatelessWidget {
  final Weapon weapon;

  const WeaponDetailsPage({required this.weapon, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 70, 86, 1),
      appBar: AppBar(
        title: Text(
          weapon.displayName!.toUpperCase(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromRGBO(248, 248, 248, 1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color.fromRGBO(31, 35, 38, 1),
              Color.fromRGBO(31, 35, 38, 0.6),
              Colors.transparent,
            ],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: WeaponDetails(
              weapon: weapon,
              scrollController: ScrollController(),
            ),
          ),
        ),
      ),
    );
  }
}
