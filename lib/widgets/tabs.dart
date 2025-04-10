import 'package:flutter/material.dart';
import 'package:flutter_tab_indicator_styler/flutter_tab_indicator_styler.dart';
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

class Tabs extends StatelessWidget {
  final bool showAll;
  final void Function(bool) onSeeAllChanged;

  const Tabs({
    super.key,
    required this.showAll,
    required this.onSeeAllChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          if (!showAll)
            Material(
              color: Color.fromRGBO(31, 35, 38, 1),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: TabBar(
                labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
                indicator: MaterialIndicator(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  tabPosition: TabPosition.bottom,
                  topLeftRadius: 25.0,
                  topRightRadius: 25.0,
                ),
                labelColor: Color.fromRGBO(248, 248, 248, 1),
                unselectedLabelColor: Color.fromRGBO(248, 248, 248, 0.3),
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
              children: [
                _buildTabContent<Agent>(
                  context: context,
                  title: "AGENTS",
                  future:
                      AgentsApi().getAgents().then((agents) => agents.toList()),
                  itemBuilder: (context, item, index) =>
                      AgentCard(agent: item, index: index),
                  limit: showAll
                      ? 999
                      : 6, // Display all when showAll is true, else 8
                ),
                _buildTabContent<Maps>(
                  context: context,
                  title: "MAPS",
                  future: MapApi().getMaps().then((maps) => maps.toList()),
                  itemBuilder: (context, item, index) =>
                      MapCard(map: item, index: index),
                  limit: showAll ? 999 : 4, // Display 4 maps when not expanded
                ),
                _buildTabContent<Weapon>(
                  context: context,
                  title: "WEAPONS",
                  future: WeaponsApi()
                      .getWeapons()
                      .then((weapons) => weapons.toList()),
                  itemBuilder: (context, item, index) =>
                      WeaponCard(weapon: item, index: index),
                  limit:
                      showAll ? 999 : 6, // Display 6 weapons when not expanded
                ),
                _buildTabContent<Gear>(
                  context: context,
                  title: "GEARS",
                  future: GearsApi().getGears().then((gears) => gears.toList()),
                  itemBuilder: (context, item, index) =>
                      GearCard(gear: item, index: index),
                  limit: showAll ? 999 : 5, // Display 5 gears when not expanded
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent<T>({
    required BuildContext context,
    required String title,
    required Future<List<T>> future,
    required Widget Function(BuildContext, T, int) itemBuilder,
    required int limit, // Accept limit parameter here
  }) {
    return Column(
      children: [
        if (showAll)
          CollapseItems(
            onCollapse: () => onSeeAllChanged(false),
            title: title,
          ),
        Expanded(
          child: FutureGridview<T>(
            future: future,
            itemBuilder: itemBuilder,
            showAll: showAll,
            limit: limit, // Pass the limit dynamically
          ),
        ),
        if (!showAll)
          TextButton(
            onPressed: () => onSeeAllChanged(true),
            child: const Text(
              "SEE ALL",
              style: TextStyle(
                  color: Color.fromRGBO(31, 35, 38, 1),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.6),
            ),
          ),
      ],
    );
  }
}
