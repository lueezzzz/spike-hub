import "package:flutter/material.dart";

import "../../models/agents.dart";

class AbilityCard extends StatelessWidget {
  final Ability ability;

  const AbilityCard({required this.ability, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.network(
              ability.displayIcon ?? '',
              fit: BoxFit.contain,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            ability.displayName ?? '',
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
