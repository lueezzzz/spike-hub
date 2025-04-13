import 'package:flutter/material.dart';
import 'package:spike_hub/models/agents.dart';

class AbilityDetails extends StatefulWidget {
  final Ability ability;
  final ScrollController scrollController;

  const AbilityDetails({
    required this.ability,
    required this.scrollController,
    super.key,
  });

  @override
  State<AbilityDetails> createState() => _AbilityDetailsState();
}

class _AbilityDetailsState extends State<AbilityDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(248, 248, 248, 1),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 160,
                      color: Color.fromRGBO(15, 25, 35, 1),
                      alignment: Alignment.center,
                      child: Image.network(
                        widget.ability.displayIcon ?? '',
                        fit: BoxFit.contain,
                        width: 120,
                        height: 120,
                      ),
                    ),

                    Container(
                      color: Color.fromRGBO(248, 248, 248, 1),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.ability.displayName?.toUpperCase() ??
                                "ABILITY",
                            style: const TextStyle(
                              color: Color.fromRGBO(31, 35, 38, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.ability.description ??
                                "No description available.",
                            style: const TextStyle(
                              color: Color.fromRGBO(31, 35, 38, 1),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
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
