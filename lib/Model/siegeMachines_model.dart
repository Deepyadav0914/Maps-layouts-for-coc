import 'dart:convert';

SiegeMachinesModel siegeMachinesModelFromJson(String str) => SiegeMachinesModel.fromJson(json.decode(str));

String siegeMachinesModelToJson(SiegeMachinesModel data) => json.encode(data.toJson());

class SiegeMachinesModel {
  List<Datum> data;

  SiegeMachinesModel({
    required this.data,
  });

  factory SiegeMachinesModel.fromJson(Map<String, dynamic> json) => SiegeMachinesModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String name;
  String cost;
  String description;
  String mainimage;
  List<Detail> details;

  Datum({
    required this.name,
    required this.cost,
    required this.description,
    required this.mainimage,
    required this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    cost: json["cost"],
    description: json["description"],
    mainimage: json["mainimage"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cost": cost,
    "description": description,
    "mainimage": mainimage,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  int level;
  int? damagePerSecond;
  dynamic damagePerHit;
  String? damageVsWalls;
  String hitpoints;
  String researchCost;
  String researchTime;
  String image;
  dynamic laboratoryLevelRequired;
  dynamic damagePerAttack;
  dynamic damageWhenDestroyed;
  int? pEKKASpawned;
  int? wizardsSpawned;
  String? pointBlankDamage;
  String? lifetime;
  int? flameMaximumDps;

  Detail({
    required this.level,
    this.damagePerSecond,
    this.damagePerHit,
    this.damageVsWalls,
    required this.hitpoints,
    required this.researchCost,
    required this.researchTime,
    required this.image,
    required this.laboratoryLevelRequired,
    this.damagePerAttack,
    this.damageWhenDestroyed,
    this.pEKKASpawned,
    this.wizardsSpawned,
    this.pointBlankDamage,
    this.lifetime,
    this.flameMaximumDps,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    level: json["Level"],
    damagePerSecond: json["Damage per Second"],
    damagePerHit: json["Damage per Hit"],
    damageVsWalls: json["Damage vs. Walls"],
    hitpoints: json["Hitpoints"],
    researchCost: json["Research Cost"],
    researchTime: json["Research Time"],
    image: json["image"],
    laboratoryLevelRequired: json["Laboratory Level Required"],
    damagePerAttack: json["Damage per Attack"],
    damageWhenDestroyed: json["Damage when Destroyed"],
    pEKKASpawned: json["P.E.K.K.A. Spawned"],
    wizardsSpawned: json["Wizards Spawned"],
    pointBlankDamage: json["Point-Blank Damage*"],
    lifetime: json["Lifetime"],
    flameMaximumDps: json["Flame Maximum DPS"],
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "Damage per Second": damagePerSecond,
    "Damage per Hit": damagePerHit,
    "Damage vs. Walls": damageVsWalls,
    "Hitpoints": hitpoints,
    "Research Cost": researchCost,
    "Research Time": researchTime,
    "image": image,
    "Laboratory Level Required": laboratoryLevelRequired,
    "Damage per Attack": damagePerAttack,
    "Damage when Destroyed": damageWhenDestroyed,
    "P.E.K.K.A. Spawned": pEKKASpawned,
    "Wizards Spawned": wizardsSpawned,
    "Point-Blank Damage*": pointBlankDamage,
    "Lifetime": lifetime,
    "Flame Maximum DPS": flameMaximumDps,
  };
}
