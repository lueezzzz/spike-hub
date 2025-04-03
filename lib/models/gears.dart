class Gear {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  ShopData? shopData;

  Gear({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.shopData,
  });

  Gear.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    shopData =
        json['shopData'] != null ? ShopData.fromJson(json['shopData']) : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic> {};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['description'] = description;
    data['displayIcon'] = displayIcon;
    if (shopData != null){
      data['shopData'] = shopData!.toJson();
    }
    return data;

  }
}

class ShopData {
  dynamic cost;
  String? category;
  String? categoryText;
  bool? canBeTrashed;
  String? newImage;

  ShopData({
    this.cost,
    this.category,
    this.categoryText,
    this.canBeTrashed,
    this.newImage,
  });

  ShopData.fromJson(Map<String, dynamic> json) {
    cost = json['cost'];
    category = json['category'];
    categoryText = json['categoryText'];
    canBeTrashed = json['canBeTrashed'];
    newImage = json['newImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cost'] = cost;
    data['category'] = category;
    data['categoryText'] = categoryText;
    data['canBeTrashed'] = canBeTrashed;
    data['newImage'] = newImage;

    return data;
  }
}
