import 'package:flutter/material.dart';
import 'package:spike_hub/models/agents.dart';
import 'package:spike_hub/models/gears.dart';
import 'package:spike_hub/models/maps.dart';
import 'package:spike_hub/models/weapons.dart';
import 'package:spike_hub/services/agents_api.dart';
import 'package:spike_hub/services/collapse_items.dart';
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
  bool showAll = false;
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
          Column(
            children: [
              if (showAll)
                CollapseItems(
                  onCollapse: () {
                    setState(() {
                      showAll = false;
                    });
                  },
                  title: "AGENTS",
                ),
              Expanded(
                child: FutureGridview<Agent>(
                  future:
                      AgentsApi().getAgents().then((agents) => agents.toList()),
                  itemBuilder: (context, agent, index) =>
                      AgentCard(agent: agent, index: index),
                  showAll: showAll,
                  limit: 8,
                ),
              ),
              if (!showAll)
                TextButton(
                  onPressed: () {
                    setState(() {
                      showAll = true;
                    });
                  },
                  child: const Text(
                    "SEE ALL",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
          Column(
            children: [
              if (showAll)
                CollapseItems(
                  onCollapse: () {
                    setState(() {
                      showAll = false;
                    });
                  },
                  title: "MAPS",
                ),
              Expanded(
                child: FutureGridview<Maps>(
                  future: MapApi().getMaps().then((maps) => maps.toList()),
                  itemBuilder: (context, map, index) =>
                      MapCard(map: map, index: index),
                  showAll: showAll,
                  limit: 8,
                ),
              ),
              if (!showAll)
                TextButton(
                  onPressed: () {
                    setState(() {
                      showAll = true;
                    });
                  },
                  child: const Text(
                    "SEE ALL",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
          Column(
            children: [
              if (showAll)
                CollapseItems(
                  onCollapse: () {
                    setState(() {
                      showAll = false;
                    });
                  },
                  title: "WEAPONS",
                ),
              Expanded(
                child: FutureGridview<Weapon>(
                  future: WeaponsApi()
                      .getWeapons()
                      .then((weapons) => weapons.toList()),
                  itemBuilder: (context, weapon, index) =>
                      WeaponCard(weapon: weapon, index: index),
                  showAll: showAll,
                  limit: 8,
                ),
              ),
              if (!showAll)
                TextButton(
                  onPressed: () {
                    setState(() {
                      showAll = true;
                    });
                  },
                  child: const Text(
                    "SEE ALL",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
            ],
          ),
          FutureGridview<Gear>(
              future: GearsApi().getGears().then((gears) => gears.toList()),
              itemBuilder: (context, gear, index) =>
                  GearCard(gear: gear, index: index))
        ]),
      ),
    );
  }
}
