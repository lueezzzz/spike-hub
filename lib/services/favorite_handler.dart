import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:spike_hub/models/agents.dart';

class FavoriteHandler {
  static const String agentKey = "favorite_agents";

  Future<bool> addAgentToFave(Agent agent) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteAgents = prefs.getStringList(agentKey) ?? [];

    final agentJson = json.encode({
      'uuid': agent.uuid,
      'displayName': agent.displayName,
      'displayIcon': agent.displayIcon,
      'fullPortrait': agent.fullPortrait,
      'role': {
        'displayName': agent.role?.displayName,
        'displayIcon': agent.role?.displayIcon,
      },
      'abilities': agent.abilities
          ?.map((ability) => {
                'slot': ability.slot,
                'displayName': ability.displayName,
                'description': ability.description,
                'displayIcon': ability.displayIcon,
              })
          .toList(),
    });

    if (!favoriteAgents.contains(agentJson)) {
      favoriteAgents.add(agentJson);
      return await prefs.setStringList(agentKey, favoriteAgents);
    }

    return true;
  }

  Future<bool> removeAgentFromFave(String uuid) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteAgents = prefs.getStringList(agentKey) ?? [];

    favoriteAgents.removeWhere((agentJson) {
      final agent = json.decode(agentJson);
      return agent['uuid'] == uuid;
    });

    return await prefs.setStringList(agentKey, favoriteAgents);
  }

  Future<bool> isAgentFavorite(String uuid) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteAgents = prefs.getStringList(agentKey) ?? [];

    return favoriteAgents.any((agentJson) {
      final agent = json.decode(agentJson);
      return agent['uuid'] == uuid;
    });
  }

  Future<List<Agent>> getFavoriteAgents() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoriteAgents = prefs.getStringList(agentKey) ?? [];

    return favoriteAgents.map((agentJson) {
      final Map<String, dynamic> agentMap = json.decode(agentJson);
      return Agent.fromJson(agentMap);
    }).toList();
  }
}
