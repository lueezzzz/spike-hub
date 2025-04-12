import 'package:flutter/material.dart';
import 'package:spike_hub/models/weapons.dart';

class DamageRangeRow extends StatelessWidget {
  final DamageRanges range;

  const DamageRangeRow({required this.range, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DamageItem(label: "Head", value: range.headDamage),
          const SizedBox(width: 20),
          DamageItem(label: "Body", value: range.bodyDamage),
          const SizedBox(width: 20),
          DamageItem(label: "Leg", value: range.legDamage),
        ],
      ),
    );
  }
}

class DamageItem extends StatelessWidget {
  final String label;
  final dynamic value;

  const DamageItem({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$label: ${value is double ? value.toStringAsFixed(2) : value}",
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }
}
