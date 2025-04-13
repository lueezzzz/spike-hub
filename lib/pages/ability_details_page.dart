import 'package:flutter/material.dart';
import 'package:spike_hub/models/agents.dart';
import 'package:spike_hub/widgets/agent-widgets/ability_details.dart';

class AbilityDetailsPage extends StatelessWidget {
  final Ability ability;

  const AbilityDetailsPage({required this.ability, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 70, 86, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Color.fromRGBO(248, 248, 248, 1),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_left,
                color: Color.fromRGBO(248, 248, 248, 1),
              ),
              const SizedBox(width: 5),
              Text(
                ability.displayName?.toUpperCase() ?? '',
                style: const TextStyle(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        leadingWidth: double.infinity,
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
            child: AbilityDetails(
              ability: ability,
              scrollController: ScrollController(),
            ),
          ),
        ),
      ),
    );
  }
}
