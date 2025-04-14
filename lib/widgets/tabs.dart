import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
import 'package:spike_hub/models/agents.dart';
import 'package:spike_hub/models/gears.dart';
import 'package:spike_hub/models/maps.dart';
import 'package:spike_hub/models/weapons.dart';
import 'package:spike_hub/services/agents_api.dart';
import 'package:spike_hub/services/collapse_items.dart';
import 'package:spike_hub/services/future_build_view.dart';
import 'package:spike_hub/services/gears_api.dart';
import 'package:spike_hub/services/map_api.dart';
import 'package:spike_hub/services/weapons_api.dart';
import 'package:spike_hub/widgets/agent-widgets/agent_card.dart';
import 'package:spike_hub/widgets/gear-widgets/gear_card.dart';
import 'package:spike_hub/widgets/map-widgets/map_card.dart';
import 'package:spike_hub/widgets/weapon-widgets/weapon_card.dart';

class Tabs extends StatefulWidget {
  final bool showAll;
  final void Function(bool) onSeeAllChanged;
  final TabController controller;
  final void Function()? onReturnToHome;

  const Tabs({
    super.key,
    required this.showAll,
    required this.onSeeAllChanged,
    required this.controller,
    this.onReturnToHome,
  });

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with TickerProviderStateMixin {
  late Future<List<Agent>> cachedAgents;
  late Future<List<Maps>> cachedMaps;
  late Future<List<Weapon>> cachedWeapons;
  late Future<List<Gear>> cachedGears;
  final List<String> agentRoles = [
    'All',
    'Controller',
    'Duelist',
    'Initiator',
    'Sentinel'
  ];
  final List<String> gunType = [
    'All',
    'Heavy',
    'Rifle',
    'Shotgun',
    'Sidearm',
    'Sniper'
  ];
  TabController? controllerAgentRole;
  TabController? controllerGunType;

  @override
  void initState() {
    super.initState();
    cachedAgents = AgentsApi().getAgents().then((agents) => agents.toList());
    cachedMaps = MapApi().getMaps().then((maps) => maps.toList());
    cachedWeapons =
        WeaponsApi().getWeapons().then((weapons) => weapons.toList());
    cachedGears = GearsApi().getGears().then((gears) => gears.toList());
  }

  @override
  void dispose() {
    controllerAgentRole?.dispose();
    controllerGunType?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!widget.showAll)
          Material(
            color: const Color.fromRGBO(31, 35, 38, 1),
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: TabBar(
              controller: widget.controller,
              labelStyle: const TextStyle(
                fontFamily: 'FuturaCn',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                letterSpacing: 1.2,
              ),
              indicator: MaterialIndicator(
                color: const Color.fromRGBO(248, 248, 248, 1),
                tabPosition: TabPosition.bottom,
                topLeftRadius: 25.0,
                topRightRadius: 25.0,
              ),
              labelColor: const Color.fromRGBO(248, 248, 248, 1),
              unselectedLabelColor: const Color.fromRGBO(248, 248, 248, 0.3),
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: "AGENTS"),
                Tab(text: "MAPS"),
                Tab(text: "WEAPONS"),
                Tab(text: "GEARS"),
              ],
            ),
          ),
        Expanded(
          child: TabBarView(
            controller: widget.controller,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              widget.showAll
                  ? buildAgentRoleTabs(context)
                  : buildTabContent<Agent>(
                      context: context,
                      title: "AGENTS",
                      future: cachedAgents,
                      itemBuilder: (context, item, index) =>
                          AgentCard(agent: item, index: index),
                      limit: 6,
                      axisCount: 3,
                      axisSpacing: 30,
                      mainSpacing: 40,
                    ),
              buildTabContent<Maps>(
                context: context,
                title: "MAPS",
                future: cachedMaps,
                itemBuilder: (context, item, index) =>
                    MapCard(maps: item, index: index),
                limit: widget.showAll ? 999 : 4,
                axisCount: 1,
                axisSpacing: 0,
                mainSpacing: 25,
              ),
              widget.showAll
                  ? buildGunTypeTabs(context)
                  : buildTabContent<Weapon>(
                      context: context,
                      title: "WEAPONS",
                      future: cachedWeapons,
                      itemBuilder: (context, item, index) =>
                          WeaponCard(weapon: item, index: index),
                      limit: 6,
                      axisCount: 1,
                      axisSpacing: 0,
                      mainSpacing: 25,
                    ),
              buildTabContent<Gear>(
                context: context,
                title: "GEARS",
                future: cachedGears,
                itemBuilder: (context, item, index) =>
                    GearCard(gear: item, index: index),
                limit: widget.showAll ? 999 : 5,
                axisCount: 3,
                axisSpacing: 30,
                mainSpacing: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildAgentRoleTabs(BuildContext context) {
    controllerAgentRole ??=
        TabController(length: agentRoles.length, vsync: this);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollapseItems(
          onCollapse: () {
            widget.onSeeAllChanged(false);
            if (widget.onReturnToHome != null) {
              widget.onReturnToHome!();
            }
          },
          title: "AGENTS",
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          color: const Color.fromRGBO(31, 35, 38, 1),
          child: TabBar(
            controller: controllerAgentRole,
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            labelStyle: const TextStyle(
              fontFamily: 'FuturaCn',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.2,
            ),
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
            indicator: MaterialIndicator(
              color: const Color.fromRGBO(248, 248, 248, 1),
              tabPosition: TabPosition.bottom,
              topLeftRadius: 25.0,
              topRightRadius: 25.0,
            ),
            labelColor: const Color.fromRGBO(248, 248, 248, 1),
            unselectedLabelColor: const Color.fromRGBO(248, 248, 248, 0.3),
            dividerColor: Colors.transparent,
            tabs: agentRoles.map((role) {
              return Tab(text: role.toUpperCase());
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controllerAgentRole,
            children: agentRoles.map((role) {
              // Filter agents based on role
              final filteredAgentsFuture = cachedAgents.then((agents) {
                if (role == 'All') {
                  return agents
                      .where((agent) => agent.isPlayableCharacter == true)
                      .toList();
                }
                return agents
                    .where((agent) =>
                        agent.role?.displayName == role &&
                        agent.isPlayableCharacter == true)
                    .toList();
              });
              return FutureBuildView<Agent>(
                future: filteredAgentsFuture,
                itemBuilder: (context, agent, index) =>
                    AgentCard(agent: agent, index: index),
                showAll: true,
                limit: 999,
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 40,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildGunTypeTabs(BuildContext context) {
    controllerGunType ??= TabController(length: gunType.length, vsync: this);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CollapseItems(
          onCollapse: () {
            widget.onSeeAllChanged(false);
            if (widget.onReturnToHome != null) {
              widget.onReturnToHome!();
            }
          },
          title: "WEAPONS",
        ),
        Container(
          margin: const EdgeInsets.only(top: 5.0),
          color: const Color.fromRGBO(31, 35, 38, 1),
          child: TabBar(
            controller: controllerGunType,
            isScrollable: true,
            tabAlignment: TabAlignment.center,
            labelStyle: const TextStyle(
              fontFamily: 'FuturaCn',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 1.2,
            ),
            labelPadding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
            indicator: MaterialIndicator(
              color: const Color.fromRGBO(248, 248, 248, 1),
              tabPosition: TabPosition.bottom,
              topLeftRadius: 25.0,
              topRightRadius: 25.0,
            ),
            labelColor: const Color.fromRGBO(248, 248, 248, 1),
            unselectedLabelColor: const Color.fromRGBO(248, 248, 248, 0.3),
            dividerColor: Colors.transparent,
            tabs: gunType.map((type) {
              return Tab(text: type.toUpperCase());
            }).toList(),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controllerGunType,
            children: gunType.map((type) {
              // Filter weapons based on category
              final filteredWeaponsFuture = cachedWeapons.then((weapons) {
                if (type == 'All') {
                  return weapons.toList();
                }
                return weapons
                    .where(
                        (weapon) => weapon.category?.split("::").last == type)
                    .toList();
              });
              return FutureBuildView<Weapon>(
                future: filteredWeaponsFuture,
                itemBuilder: (context, weapon, index) =>
                    WeaponCard(weapon: weapon, index: index),
                showAll: true,
                limit: 999,
                crossAxisCount: 1,
                crossAxisSpacing: 0,
                mainAxisSpacing: 25,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildTabContent<T>({
    required BuildContext context,
    required String title,
    required Future<List<T>> future,
    required Widget Function(BuildContext, T, int) itemBuilder,
    required int limit,
    required int axisCount,
    required double axisSpacing,
    required double mainSpacing,
  }) {
    return Column(
      children: [
        if (widget.showAll)
          CollapseItems(
            onCollapse: () {
              widget.onSeeAllChanged(false);

              if (widget.onReturnToHome != null) {
                widget.onReturnToHome!();
              }
            },
            title: title,
          ),
        Expanded(
          child: FutureBuildView<T>(
            future: future,
            itemBuilder: itemBuilder,
            showAll: widget.showAll,
            limit: limit,
            crossAxisCount: axisCount,
            crossAxisSpacing: axisSpacing,
            mainAxisSpacing: mainSpacing,
          ),
        ),
        if (!widget.showAll)
          TextButton(
            onPressed: () => widget.onSeeAllChanged(true),
            child: const Text(
              "SEE ALL",
              style: TextStyle(
                fontFamily: 'AkiraExpanded',
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                shadows: [
                  Shadow(
                      color: Color.fromRGBO(31, 35, 38, 1),
                      offset: Offset(0.5, -5))
                ],
                color: Colors.transparent,
                decoration: TextDecoration.underline,
                decorationColor: Color.fromRGBO(31, 35, 38, 1),
                decorationThickness: 4,
              ),
            ),
          ),
      ],
    );
  }
}
