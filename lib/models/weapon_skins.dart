class WeaponSkin {
  String? uuid;
  String? displayName;
  String? displayIcon;
  String? wallpaper;

  WeaponSkin({
    this.uuid,
    this.displayName,
    this.displayIcon,
    this.wallpaper,
  });

  WeaponSkin.fromJson(Map<String, dynamic> json){
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    wallpaper = json['wallpaper'];
  }

  Map<String, dynamic> toJson(){

    final Map<String, dynamic> data = <String, dynamic> {};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['displayIcon'] = displayIcon;
    data['wallpaper'] = wallpaper;

    return data;
  }

}