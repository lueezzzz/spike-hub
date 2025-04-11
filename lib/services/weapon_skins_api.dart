import 'package:dio/dio.dart';
import '../models/weapon_skins.dart';
import './valorant_api.dart';

class WeaponsApi extends ValorantApi {
  Future<Iterable<WeaponSkin>> getSkins() async {
    Iterable<WeaponSkin> weaponSkins = [];

    try {
      Response response = await super.dio.get("${super.url}v1/weapon/skins");
      List weaponSkinData = response.data['data'];
      weaponSkins = weaponSkinData.map((weaponSkin) => WeaponSkin.fromJson(weaponSkin));
    } on DioException catch (err) {
      print(err);
    }

    return weaponSkins;
  }
}
