import 'package:dio/dio.dart';
import 'valorant_api.dart';
import '../models/agents.dart';

class AgentsApi extends ValorantApi{

  Future<Iterable<Agent>> getAgents({String? agentRole}) async {
    Iterable<Agent> agents = [];

    try{
      Response response = await super.dio.get("${super.url}v1/agents",
        queryParameters: {'isPlayableCharacter': true});

      List agentData = response.data['data'];
      agents = agentData.map((agent) => Agent.fromJson(agent));

      if (agentRole != null){
        agents = agents.where((agent) => agent.role!.displayName!.toLowerCase() == agentRole.toLowerCase());
      }

    } on DioException catch (err){
      print(err);
    }

    return agents;
  }

}

