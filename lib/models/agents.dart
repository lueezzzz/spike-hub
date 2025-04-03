class Agent {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? displayIconSmall;
  String? fullPortrait;
  bool? isPlayableCharacter;
  Role? role;
  List<Ability>? abilities;

  Agent({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.displayIconSmall,
    this.fullPortrait,
    this.isPlayableCharacter,
    this.role,
    this.abilities,
  });

  Agent.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    displayIconSmall = json['displayIconSmall'];
    fullPortrait = json['fullPortrait'];
    isPlayableCharacter = json['isPlayableCharacter'];
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    if (json['abilities'] != null) {
      abilities = <Ability>[];
      json['abilities'].forEach((v) {
        abilities!.add(Ability.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['description'] = description;
    data['displayIcon'] = displayIcon;
    data['displayIconSmall'] = displayIconSmall;
    data['fullPortrait'] = fullPortrait;
    data['isPlayableCharacter'] = isPlayableCharacter;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;

  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  Role.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['displayName'] = displayName;
    data['description'] = description;
    data['displayIcon'] = displayIcon;
    return data;
  }
}

class Ability {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Ability({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  Ability.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slot'] = slot;
    data['displayName'] = displayName;
    data['description'] = description;
    data['displayIcon'] = displayIcon;
    return data;
  }
}
