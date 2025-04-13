import 'package:flutter/material.dart';

class WeaponStatsItem extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? child;

  const WeaponStatsItem({
    required this.label,
    this.value,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color.fromRGBO(248, 248, 248, 1),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        if (child != null) child!,
        if (value != null)
          Text(
            value!,
            style: const TextStyle(
              color: Color.fromRGBO(248, 248, 248, 1),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }
}
