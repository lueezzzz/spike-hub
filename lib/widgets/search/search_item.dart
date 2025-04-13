import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spike_hub/pages/skin_details_page.dart';
import 'package:spike_hub/widgets/agent-widgets/agent_details.dart';
import 'package:spike_hub/pages/ability_details_page.dart';
import 'package:spike_hub/pages/gear_details_page.dart';
import 'package:spike_hub/pages/map_details_page.dart';
import 'package:spike_hub/pages/weapon_details_page.dart';
import 'package:spike_hub/widgets/weapon-widgets/weapon_skin_details.dart';
import '../../services/agents_api.dart';
import '../../services/map_api.dart';
import '../../services/gears_api.dart';
import '../../services/weapons_api.dart';
import '../../models/agents.dart';
import '../../models/gears.dart';
import '../../models/weapons.dart';
import '../../models/maps.dart';
import 'searchable_item.dart';

class SearchItem extends StatefulWidget {
  const SearchItem({super.key});

  @override
  State<SearchItem> createState() => _SearchItem();
}

class _SearchItem extends State<SearchItem> {
  late Future<List<Agent>> agents;
  late Future<List<Weapon>> weapons;
  late Future<List<Gear>> gears;
  late Future<List<Maps>> maps;

  List<SearchableItem> searchableItems = [];
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final agentsList =
          await AgentsApi().getAgents().then((agents) => agents.toList());
      final weaponsList =
          await WeaponsApi().getWeapons().then((weapons) => weapons.toList());
      final gearsList =
          await GearsApi().getGears().then((gears) => gears.toList());
      final mapsList = await MapApi().getMaps().then((maps) => maps.toList());

      List<SearchableItem> items = [];

      for (var agent in agentsList) {
        items.add(SearchableItem(
          id: agent.uuid ?? '',
          name: agent.displayName ?? '',
          type: 'Agent',
          iconUrl: agent.displayIconSmall ?? agent.displayIcon ?? '',
          data: agent,
          description: agent.description ?? '',
        ));

        if (agent.abilities != null) {
          for (var ability in agent.abilities!) {
            if (ability.displayName != null &&
                ability.displayName!.isNotEmpty) {
              items.add(SearchableItem(
                id: '${agent.uuid}-${ability.slot}',
                name: ability.displayName!,
                type: 'Ability',
                iconUrl: ability.displayIcon ?? '',
                data: ability,
                description: ability.description ?? '',
                parentName: agent.displayName,
                subtype: ability.slot ?? '',
              ));
            }
          }
        }
      }

      for (var weapon in weaponsList) {
        items.add(SearchableItem(
          id: weapon.uuid ?? '',
          name: weapon.displayName ?? '',
          type: 'Weapon',
          iconUrl: weapon.displayIcon ?? '',
          data: weapon,
          description: weapon.category ?? '',
        ));

        if (weapon.skins != null) {
          for (var skin in weapon.skins!) {
            if (skin.displayName != null &&
                skin.displayName!.isNotEmpty &&
                !skin.displayName!.toLowerCase().contains('standard') &&
                !skin.displayName!.toLowerCase().contains('default')) {
              items.add(SearchableItem(
                id: skin.uuid ?? '${weapon.uuid}-skin-${items.length}',
                name: skin.displayName!,
                type: 'Skin',
                iconUrl: skin.displayIcon ?? weapon.displayIcon ?? '',
                data: skin,
                description: 'Weapon Skin',
                parentName: weapon.displayName,
                subtype: 'weapon-skin',
              ));
            }
          }
        }
      }

      for (var gear in gearsList) {
        items.add(SearchableItem(
          id: gear.uuid ?? '',
          name: gear.displayName ?? '',
          type: 'Gear',
          iconUrl: gear.displayIcon ?? '',
          data: gear,
          description: gear.description ?? '',
        ));
      }

      for (var map in mapsList) {
        items.add(SearchableItem(
          id: map.uuid ?? '',
          name: map.displayName ?? '',
          type: 'Map',
          iconUrl: map.displayIcon ?? map.listViewIcon ?? '',
          data: map,
        ));
      }

      setState(() {
        searchableItems = items;
        isDataLoaded = true;
      });
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  void navigateToDetailPage(BuildContext context, SearchableItem item) {
    switch (item.type) {
      case 'Agent':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AgentDetails(agent: item.data)));
        break;
      case 'Ability':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AbilityDetailsPage(ability: item.data)));
        break;
      case 'Weapon':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WeaponDetailsPage(weapon: item.data)));
        break;
      case 'Skin':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SkinDetailsPage(skin: item.data)));
        break;
      case 'Gear':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GearDetailsPage(gear: item.data)));
        break;
      case 'Map':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MapDetailsPage(maps: item.data)));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final SearchController controller = SearchController();
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: SearchAnchor(
          searchController: controller,
          viewBackgroundColor: Color.fromRGBO(31, 35, 38, 1),
          viewLeading: IconButton(
            icon: const Icon(Icons.arrow_left),
            color: Color.fromRGBO(248, 248, 248, 1),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          viewTrailing: [
            IconButton(
              icon: const Icon(Icons.close),
              color: Color.fromRGBO(248, 248, 248, 1),
              onPressed: () {
                controller.clear();
                
              },
            ),
          ],
          dividerColor: Colors.transparent,
          headerTextStyle: TextStyle(
            color: Color.fromRGBO(248, 248, 248, 1),
          ),
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              controller: controller,
              backgroundColor: const WidgetStatePropertyAll<Color>(
                Color.fromRGBO(248, 248, 248, 1),
              ),
              keyboardType: TextInputType.text,
              padding: const WidgetStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 20.0),
              ),
              leading: const Icon(Icons.search),
              hintText: "SEARCH",
              hintStyle: const WidgetStatePropertyAll<TextStyle>(TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                color: Color.fromRGBO(31, 35, 38, 1),
              )),
              onTap: () => controller.openView(),
              onChanged: (_) => controller.openView(),
              shape: const WidgetStatePropertyAll(BeveledRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      bottomRight: Radius.circular(12.0)))),
            );
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            final query = controller.text.toLowerCase();

            if (!isDataLoaded) {
              return [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
              ];
            }

            if (query.isEmpty) {
              return [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Type to search for agents, abilities, weapons, gear, or maps',
                      style: TextStyle(
                        color: Color.fromRGBO(248, 248, 248, 1),
                      ),
                    ),
                  ),
                ),
              ];
            }

            final filteredItems = searchableItems.where((item) {
              return item.name.toLowerCase().contains(query);
            }).toList();

            if (filteredItems.isEmpty) {
              return [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('No results found'),
                  ),
                ),
              ];
            }

            final groupedResults = <String, List<SearchableItem>>{};
            for (var item in filteredItems) {
              if (!groupedResults.containsKey(item.type)) {
                groupedResults[item.type] = [];
              }
              groupedResults[item.type]!.add(item);
            }

            final resultWidgets = <Widget>[];

            groupedResults.forEach((type, items) {
              resultWidgets.add(
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    type.toUpperCase(),
                    style: const TextStyle(
                      color: Color.fromRGBO(255, 70, 86, 1),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              );

              for (var item in items) {
                resultWidgets.add(
                  ListTile(
                    leading: item.iconUrl.isNotEmpty && item.type == 'Ability'
                        ? ColorFiltered(
                            colorFilter: ColorFilter.mode(
                              Color.fromRGBO(248, 248, 248, 1),
                              BlendMode.srcIn,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: item.iconUrl,
                              width: 32,
                              height: 32,
                            ),
                          )
                        : item.iconUrl.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: item.iconUrl,
                                width: 32,
                                height: 32,
                              )
                            : Icon(
                                getIconForUnfetched(item.type),
                                color: Color.fromRGBO(255, 70, 86, 1),
                              ),
                    title: Text(
                      item.name,
                      style: TextStyle(
                        color: Color.fromRGBO(248, 248, 248, 1),
                      ),
                    ),
                    subtitle: item.type == 'Ability' && item.parentName != null
                        ? Text(
                            '${item.parentName} - ${getAbilityTypeText(item.subtype!)}',
                            style: TextStyle(
                              color: Color.fromRGBO(248, 248, 248, 0.7),
                            ),
                          )
                        : Text(
                            item.type,
                            style: TextStyle(
                              color: Color.fromRGBO(248, 248, 248, 0.7),
                            ),
                          ),
                    trailing:
                        item.description != null && item.description!.isNotEmpty
                            ? const Icon(
                                Icons.info_outline,
                                color: Color.fromRGBO(248, 248, 248, 1),
                              )
                            : null,
                    onTap: () {
                      controller.closeView(item.name);
                      navigateToDetailPage(context, item);
                    },
                    onLongPress: item.description != null &&
                            item.description!.isNotEmpty
                        ? () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    item.name.toUpperCase(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  content: Text(item.description!),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Close',
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 70, 86, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        controller.closeView(item.name);
                                        navigateToDetailPage(context, item);
                                      },
                                      child: const Text(
                                        'View Details',
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 70, 86, 1),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        : null,
                  ),
                );
              }
            });

            return resultWidgets;
          },
        ));
  }

  IconData getIconForUnfetched(String type) {
    switch (type) {
      case 'Agent':
        return Icons.person;
      case 'Ability':
        return Icons.auto_fix_high;
      case 'Weapon':
        return Icons.gps_fixed;
      case 'Skin':
        return Icons.style;
      case 'Gear':
        return Icons.shield;
      case 'Map':
        return Icons.map;
      default:
        return Icons.search;
    }
  }

  String getAbilityTypeText(String slot) {
    switch (slot.toUpperCase()) {
      case 'ABILITY1':
        return 'Basic Ability 1';
      case 'ABILITY2':
        return 'Basic Ability 2';
      case 'GRENADE':
        return 'Signature Ability';
      case 'ULTIMATE':
        return 'Ultimate';
      case 'PASSIVE':
        return 'Passive';
      default:
        return slot;
    }
  }
}
