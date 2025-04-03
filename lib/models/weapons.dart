class Weapon {
  String? uuid;
  String? displayName;
  String? displayIcon;
  String? defaultSkinUuid;
  String? category;
  Stats? weaponStats;
  ShopData? shopData;

  Weapon({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.defaultSkinUuid,
    this.category,
    this.weaponStats,
    this.shopData,
  });

  Weapon.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    defaultSkinUuid = json['defaultSkinUuid'];
    category = json['category'];
    weaponStats = json['weaponStats'] != null
        ? Stats.fromJson(json['weaponStats'])
        : null;
    shopData =
        json['shopData'] != null ? ShopData.fromJson(json['shopData']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['displayIcon'] = displayIcon;
    data['defaultSkinUuid'] = defaultSkinUuid;
    data['category'] = category;
    if (weaponStats != null) {
      data['weaponStats'] = weaponStats!.toJson();
    }
    if (shopData != null) {
      data['shopData'] = shopData!.toJson();
    }

    return data;
  }
}

class Stats {
  dynamic fireRate;
  dynamic magazineSize;
  dynamic reloadTimeSeconds;
  dynamic firstBulletAccuracy;
  String? altFireType;
  List<DamageRanges>? damageRanges;

  Stats(
      {this.fireRate,
      this.magazineSize,
      this.reloadTimeSeconds,
      this.firstBulletAccuracy,
      this.altFireType,
      this.damageRanges});

  Stats.fromJson(Map<String, dynamic> json) {
    fireRate = json['fireRate'];
    magazineSize = json['magazineSize'];
    reloadTimeSeconds = json['reloadTimeSeconds'];
    firstBulletAccuracy = json['firstBulletAccuracy'];
    altFireType = json['altFireType'];
    if (json['damageRanges'] != null) {
      damageRanges = <DamageRanges>[];
      json['damageRanges']
          .forEach((v) => damageRanges!.add(DamageRanges.fromJson(v)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fireRate'] = fireRate;
    data['magazineSize'] = magazineSize;
    data['reloadTimeSeconds'] = reloadTimeSeconds;
    data['firstBulletAccuracy'] = firstBulletAccuracy;
    data['altFireType'] = altFireType;

    return data;
  }
}

class DamageRanges {
  dynamic headDamage;
  dynamic bodyDamage;
  dynamic legDamage;

  DamageRanges({
    this.headDamage,
    this.bodyDamage,
    this.legDamage,
  });

  DamageRanges.fromJson(Map<String, dynamic> json) {
    headDamage = json['headDamage'];
    bodyDamage = json['bodyDamage'];
    legDamage = json['legDamage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['headDamage'] = headDamage;
    data['bodyDamage'] = bodyDamage;
    data['legDamage'] = legDamage;

    return data;
  }
}

class ShopData {
  dynamic cost;
  String? category;
  String? categoryText;
  String? newImage;
  bool? canBeTrashed;

  ShopData({
    this.cost,
    this.category,
    this.categoryText,
    this.newImage,
    this.canBeTrashed,
  });

  ShopData.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    category = json['category'];
    categoryText = json['categoryText'];
    newImage = json['newImage'];
    canBeTrashed = json['canBeTrashed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cost'] = cost;
    data['category'] = category;
    data['categoryText'] = categoryText;
    data['newImage'] = newImage;
    data['canBeTrashed'] = canBeTrashed;

    return data;
  }
}
