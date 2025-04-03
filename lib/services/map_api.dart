import 'package:dio/dio.dart';
import '../models/maps.dart';
import 'valorant_api.dart';

class MapApi extends ValorantApi {
  Future<Iterable<Maps>> getMaps() async {
    Iterable<Maps> maps = [];

    try {
      Response response = await super.dio.get("${super.url}/v1/maps");
      List mapData = response.data['data'];
      maps = mapData.map((map) => Maps.fromJson(map));
    } on DioException catch (err) {
      print(err);
    }

    return maps;
  }
}
