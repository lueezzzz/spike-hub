class Maps {
  String? uuid;
  String? displayName;
  String? displayIcon;
  String? listViewIcon;
  String? splash;

  Maps(
      {this.uuid,
      this.displayName,
      this.displayIcon,
      this.listViewIcon,
      this.splash});

  Maps.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    displayIcon = json['displayIcon'];
    listViewIcon = json['listViewIcon'];
    splash = json['splash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['displayIcon'] = displayIcon;
    data['listViewIcon'] = listViewIcon;
    data['splash'] = splash;

    return data;
  }
}
