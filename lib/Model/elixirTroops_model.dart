import 'dart:convert';

ElixirTroopsModel elixirTroopsModelFromJson(String str) =>
    ElixirTroopsModel.fromJson(json.decode(str));

String elixirTroopsModelToJson(ElixirTroopsModel data) =>
    json.encode(data.toJson());

class ElixirTroopsModel {
  List<Datum> data;

  ElixirTroopsModel({
    required this.data,
  });

  factory ElixirTroopsModel.fromJson(Map<String, dynamic> json) =>
      ElixirTroopsModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String name;
  String mainimage;
  String description;
  List<Detail> details;

  Datum({
    required this.name,
    required this.mainimage,
    required this.description,
    required this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        mainimage: json["mainimage"],
        description: json["description"],
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mainimage": mainimage,
        "description": description,
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
  double? healingPerPulse;

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
        healingPerPulse: json["Healing per Pulse"]?.toDouble(),
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
