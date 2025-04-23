import 'dart:convert';

DarkElixirTroopsModel darkElixirTroopsModelFromJson(String str) => DarkElixirTroopsModel.fromJson(json.decode(str));

String darkElixirTroopsModelToJson(DarkElixirTroopsModel data) => json.encode(data.toJson());

class DarkElixirTroopsModel {
  List<Datum> data;

  DarkElixirTroopsModel({
    required this.data,
  });

  factory DarkElixirTroopsModel.fromJson(Map<String, dynamic> json) => DarkElixirTroopsModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String name;
  String description;
  String mainimage;
  List<Detail> details;

  Datum({
    required this.name,
    required this.description,
    required this.mainimage,
    required this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    description: json["description"],
    mainimage: json["mainimage"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "mainimage": mainimage,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  int level;
  String image;
  int? damagePerSecond;
  double? damagePerAttack;
  int hitpoints;
  String researchCost;
  String researchTime;
  dynamic laboratoryLevelRequired;
  int? healingPerSecond;
  int? healingPerPulse;

  Detail({
    required this.level,
    required this.image,
    this.damagePerSecond,
    this.damagePerAttack,
    required this.hitpoints,
    required this.researchCost,
    required this.researchTime,
    required this.laboratoryLevelRequired,
    this.healingPerSecond,
    this.healingPerPulse,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    level: json["Level"],
    image: json["image"],
    damagePerSecond: json["Damage per Second"],
    damagePerAttack: json["Damage per Attack"]?.toDouble(),
    hitpoints: json["Hitpoints"],
    researchCost: json["Research Cost"],
    researchTime: json["Research Time"],
    laboratoryLevelRequired: json["Laboratory Level Required"],
    healingPerSecond: json["Healing per Second"],
    healingPerPulse: json["Healing per Pulse"],
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "image": image,
    "Damage per Second": damagePerSecond,
    "Damage per Attack": damagePerAttack,
    "Hitpoints": hitpoints,
    "Research Cost": researchCost,
    "Research Time": researchTime,
    "Laboratory Level Required": laboratoryLevelRequired,
    "Healing per Second": healingPerSecond,
    "Healing per Pulse": healingPerPulse,
  };
}
