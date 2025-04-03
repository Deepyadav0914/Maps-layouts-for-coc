import 'dart:convert';

HeroesModel heroesModelFromJson(String str) => HeroesModel.fromJson(json.decode(str));

String heroesModelToJson(HeroesModel data) => json.encode(data.toJson());

class HeroesModel {
  List<Datum> data;

  HeroesModel({
    required this.data,
  });

  factory HeroesModel.fromJson(Map<String, dynamic> json) => HeroesModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String name;
  String cost;
  String mainimage;
  String description;
  List<Detail> details;

  Datum({
    required this.name,
    required this.cost,
    required this.mainimage,
    required this.description,
    required this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    cost: json["cost"],
    mainimage: json["mainimage"],
    description: json["description"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cost": cost,
    "mainimage": mainimage,
    "description": description,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  int level;
  int damagePerSecond;
  double damagePerHit;
  dynamic hitpoints;
  dynamic healthRecovery;
  String regenTime;
  String upgradeCost;
  String upgradeTime;
  int heroHallLevelRequired;
  dynamic abilityLevel;
  int builderHallLevelRequired;

  Detail({
    required this.level,
    required this.damagePerSecond,
    required this.damagePerHit,
    required this.hitpoints,
    required this.healthRecovery,
    required this.regenTime,
    required this.upgradeCost,
    required this.upgradeTime,
    required this.heroHallLevelRequired,
    required this.abilityLevel,
    required this.builderHallLevelRequired,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    level: json["Level"],
    damagePerSecond: json["Damage per Second"],
    damagePerHit: json["Damage per Hit"]?.toDouble(),
    hitpoints: json["Hitpoints"],
    healthRecovery: json["Health Recovery"],
    regenTime: json["Regen Time"],
    upgradeCost: json["Upgrade Cost"],
    upgradeTime: json["Upgrade Time"],
    heroHallLevelRequired: json["Hero Hall Level Required"],
    abilityLevel: json["Ability Level"],
    builderHallLevelRequired: json["Builder Hall Level Required"],
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "Damage per Second": damagePerSecond,
    "Damage per Hit": damagePerHit,
    "Hitpoints": hitpoints,
    "Health Recovery": healthRecovery,
    "Regen Time": regenTime,
    "Upgrade Cost": upgradeCost,
    "Upgrade Time": upgradeTime,
    "Hero Hall Level Required": heroHallLevelRequired,
    "Ability Level": abilityLevel,
    "Builder Hall Level Required": builderHallLevelRequired,
  };
}
