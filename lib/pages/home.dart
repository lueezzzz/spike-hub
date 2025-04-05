import 'package:flutter/material.dart';
import 'package:spike_hub/models/agents.dart';
import 'package:spike_hub/services/agents_api.dart';
import 'package:spike_hub/widgets/agent-widgets/agent_card.dart';
import 'package:spike_hub/widgets/custom_search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Iterable<Agent>> futureAgents;

  @override
  void initState() {
    super.initState();
    futureAgents = AgentsApi().getAgents();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchBar(),
        
      ],
      // FutureBuilder<Iterable<Agent>>(
      //   future: futureAgents,
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(child: CircularProgressIndicator());
      //     }

      //     List<Agent> agents = snapshot.data!.toList();

      //     return GridView.builder(
      //       padding: EdgeInsets.all(10),
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 4,
      //         crossAxisSpacing: 10,
      //         mainAxisSpacing: 10,
      //         childAspectRatio: 3 / 4,
      //       ),
      //       itemCount: 8,
      //       itemBuilder: (context, index) {
      //         return AgentCard(agent: agents[index], index: index);
      //       },
      //     );
      //   },
      // ),
    );
  }
}
