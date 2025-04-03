import 'package:dio/dio.dart';
import '../models/weapons.dart';
import './valorant_api.dart';

class WeaponsApi extends ValorantApi {
  Future<Iterable<Weapon>> getWeapons() async {
    Iterable<Weapon> weapons = [];

    try {
      Response response = await super.dio.get("${super.url}v1/weapons");
      List weaponData = response.data['data'];
      weapons = weaponData.map((weapon) => Weapon.fromJson(weapon));
    } on DioException catch (err) {
      print(err);
    }

    return weapons;
  }
}
