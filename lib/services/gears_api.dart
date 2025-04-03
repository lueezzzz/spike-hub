import 'package:dio/dio.dart';
import './valorant_api.dart';
import '../models/gears.dart';

class GearsApi extends ValorantApi {
  Future<Iterable<Gear>> getGears() async {
    Iterable<Gear> gears = [];

    try {
      Response response = await super.dio.get("${super.url}v1/gear");
      List gearData = response.data['data'];
      gears = gearData.map((gear) => Gear.fromJson(gear));
    } on DioException catch (err) {
      print(err);
    }

    return gears;
  }
}
