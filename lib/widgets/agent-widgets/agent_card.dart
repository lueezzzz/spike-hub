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
      child: null,
    
    );
  }
}
