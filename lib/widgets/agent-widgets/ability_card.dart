import 'package:flutter/material.dart';
import '../../models/agents.dart';
import 'ability_details.dart';

class AbilityCard extends StatelessWidget {
  final Ability ability;

  const AbilityCard({required this.ability, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.3,
              maxChildSize: 0.8,
              expand: false,
              builder: (context, scrollController) {
                return AbilityDetails(
                  ability: ability,
                  scrollController: scrollController,
                );
              },
            ),
          );
        },
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Color.fromRGBO(248, 248, 248, 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(
                ability.displayIcon ?? '',
                fit: BoxFit.contain,
                color: Color.fromRGBO(248, 248, 248, 1),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              ability.displayName ?? '',
              style: const TextStyle(
                color: Color.fromRGBO(248, 248, 248, 1),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
