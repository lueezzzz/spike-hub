import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/widgets/agent-widgets/ability_card.dart';

import '../../models/agents.dart';

class AgentDetails extends StatefulWidget {
  final Agent agent;

  const AgentDetails({
    required this.agent,
    super.key,
  });

  @override
  State<AgentDetails> createState() => _AgentDetailsState();
}

class _AgentDetailsState extends State<AgentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 70, 86, 1),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 170.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/block.png'),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          Stack(
            children: [
              Positioned(
                top: -80,
                right: -550,
                height: 1300,
                child: CachedNetworkImage(
                  imageUrl: widget.agent.fullPortrait ?? '',
                ),
              ),
            ],
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromRGBO(255, 70, 86, 1),
                    Color.fromRGBO(255, 70, 86, 0.9),
                    Color.fromRGBO(255, 70, 86, 0.5),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_left,
                      color: Color.fromRGBO(248, 248, 248, 1),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.agent.displayName?.toUpperCase() ?? '',
                      style: const TextStyle(
                        color: Color.fromRGBO(248, 248, 248, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              clipBehavior: Clip.antiAlias,
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(31, 35, 38, 1),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: widget.agent.role!.displayIcon!,
                          width: 15,
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.agent.role?.displayName?.toUpperCase() ??
                              'UNKNOWN ROLE',
                          style: const TextStyle(
                            color: Color.fromRGBO(248, 248, 248, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: widget.agent.abilities!
                          .where((ability) => ability.displayIcon != null)
                          .map((ability) => AbilityCard(ability: ability))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
