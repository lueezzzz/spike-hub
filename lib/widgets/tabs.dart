import 'package:flutter/material.dart';
import 'package:spike_hub/models/agents.dart';
import 'package:spike_hub/models/gears.dart';
import 'package:spike_hub/models/maps.dart';
import 'package:spike_hub/models/weapons.dart';
import 'package:spike_hub/services/agents_api.dart';
import 'package:spike_hub/services/future_gridview.dart';
import 'package:spike_hub/services/gears_api.dart';
import 'package:spike_hub/services/map_api.dart';
import 'package:spike_hub/services/weapons_api.dart';
import 'package:spike_hub/widgets/agent-widgets/agent_card.dart';
import 'package:spike_hub/widgets/gear-widgets/gear_card.dart';
import 'package:spike_hub/widgets/map-widgets/map_card.dart';
import 'package:spike_hub/widgets/weapon-widgets.dart/weapon_card.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  late Future<Iterable<Agent>> fetchedAgents;

  @override
  void initState() {
    super.initState();
    fetchedAgents = AgentsApi().getAgents();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text("AGENTS", style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text("MAPS", style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text("WEAPONS", style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text("GEARS", style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          FutureGridview<Agent>(
              future: AgentsApi().getAgents().then((agents) => agents.toList()),
              itemBuilder: (context, agent, index) =>
                  AgentCard(agent: agent, index: index)),
          FutureGridview<Maps>(
              future: MapApi().getMaps().then((maps) => maps.toList()),
              itemBuilder: (context, map, index) =>
                  MapCard(map: map, index: index)),
          FutureGridview<Weapon>(
              future:
                  WeaponsApi().getWeapons().then((weapons) => weapons.toList()),
              itemBuilder: (context, weapon, index) =>
                  WeaponCard(weapon: weapon, index: index)),
          FutureGridview<Gear>(
              future: GearsApi().getGears().then((gears) => gears.toList()),
              itemBuilder: (context, gear, index) =>
                  GearCard(gear: gear, index: index))
        ]),
      ),
    );
  }
}
