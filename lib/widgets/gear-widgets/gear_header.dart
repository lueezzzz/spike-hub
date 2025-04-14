import 'package:flutter/material.dart';
import 'package:spike_hub/models/gears.dart';

class GearHeader extends StatelessWidget {
  final Gear gear;

  const GearHeader({required this.gear, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            gear.displayName!.toUpperCase(),
            style: const TextStyle(
              fontFamily: 'DrukWide',
              fontWeight: FontWeight.w800,
              fontSize: 20,
              letterSpacing: 1.2,
              color: Color.fromRGBO(31, 35, 38, 1),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 70, 86, 1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              gear.shopData!.cost!.toString(),
              style: const TextStyle(
                fontFamily: 'AkiraExpanded',
                fontWeight: FontWeight.bold,
                fontSize: 14,
                letterSpacing: 1.2,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
