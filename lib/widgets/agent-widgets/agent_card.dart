import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/widgets/agent-widgets/agent_details.dart';
import '../../models/agents.dart';

class AgentCard extends StatelessWidget {
  final Agent agent;
  final int index;
  const AgentCard({required this.agent, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AgentDetails(agent: agent)))
      },
      child: SizedBox(
        width: 100,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
                top: 110,
                child: Container(
                  width: 100,
                  child: Text(
                    agent.displayName!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromRGBO(15, 25, 35, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Positioned(
                top: 5,
                left: 5,
                child: Material(
                  color: Color.fromRGBO(255, 70, 86, 1),
                  shape: BeveledRectangleBorder(
                    side: BorderSide(
                        color: Color.fromRGBO(15, 25, 35, 1), width: 0.7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                    ),
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                  ),
                )),
            Material(
              color: Color.fromRGBO(15, 25, 35, 1),
              shape: BeveledRectangleBorder(
                side:
                    BorderSide(color: Color.fromRGBO(15, 25, 35, 1), width: 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                ),
              ),
              child: Hero(
                  tag: agent,
                  child: CachedNetworkImage(
                    imageUrl: agent.displayIconSmall!,
                    height: 100,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
