import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/widgets/agent-widgets/agent_details.dart';
import '../../models/agents.dart';

class AgentCard extends StatelessWidget {
  
  AgentCard({Key? key, required this.agent, required this.index})
      : super(key: key);

  Agent agent;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const AgentDetails())
      //   )
      // },
      child: SizedBox(
        width: 120,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Material(
              shape: BeveledRectangleBorder(
                side: BorderSide(color: Colors.black, width: 0.5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                ),
              ),
              child: Container(
                height: 120,
                padding: EdgeInsets.only(top: 60),
                alignment: Alignment.bottomCenter,
              ),
            ),
            Positioned(
              top: -7,
              left: 5,
              child: Hero(
                  tag: agent,
                  child: CachedNetworkImage(
                    imageUrl: agent.displayIconSmall!,
                    height: 115,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
