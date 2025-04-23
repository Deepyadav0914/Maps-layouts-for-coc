import 'dart:convert';

ElixirSpellsModel elixirSpellsModelFromJson(String str) =>
    ElixirSpellsModel.fromJson(json.decode(str));

String elixirSpellsModelToJson(ElixirSpellsModel data) =>
    json.encode(data.toJson());

class ElixirSpellsModel {
  List<Datum> data;

  ElixirSpellsModel({
    required this.data,
  });

  factory ElixirSpellsModel.fromJson(Map<String, dynamic> json) =>
      ElixirSpellsModel(
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
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
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
  dynamic damage;
  String researchCost;
  String researchTime;
  dynamic totalHealing;
  dynamic healingPerPulse;
  dynamic totalHealingOnHeroes;
  dynamic damageIncrease;
  dynamic speedIncrease;
  dynamic spellDuration;
  String? freezeTime;
  dynamic clonedCapacity;
  String duration;
  dynamic recalledCapacity;
  dynamic laboratoryLevelRequired;
  String? heroHeal;

  Detail({
    required this.level,
    required this.damage,
    required this.researchCost,
    required this.researchTime,
    this.totalHealing,
    this.healingPerPulse,
    this.totalHealingOnHeroes,
    required this.damageIncrease,
    required this.speedIncrease,
    this.spellDuration,
    this.freezeTime,
    required this.clonedCapacity,
    required this.duration,
    this.recalledCapacity,
    required this.laboratoryLevelRequired,
    this.heroHeal,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        level: json["Level"],
        damage: json["Damage"],
        researchCost: json["Research Cost"],
        researchTime: json["Research Time"],
        totalHealing: json["Total Healing"],
        healingPerPulse: json["Healing per Pulse"],
        totalHealingOnHeroes: json["Total Healing on Heroes"],
        damageIncrease: json["Damage Increase"],
        speedIncrease: json["Speed Increase"],
        spellDuration: json["Spell Duration"],
        freezeTime: json["Freeze Time"],
        clonedCapacity: json["Cloned Capacity"],
        duration: json["Duration"],
        recalledCapacity: json["Recalled Capacity"],
        laboratoryLevelRequired: json["Laboratory Level Required"],
        heroHeal: json["Hero Heal %"],
      );

  Map<String, dynamic> toJson() => {
        "Level": level,
        "Damage": damage,
        "Research Cost": researchCost,
        "Research Time": researchTime,
        "Total Healing": totalHealing,
        "Healing per Pulse": healingPerPulse,
        "Total Healing on Heroes": totalHealingOnHeroes,
        "Damage Increase": damageIncrease,
        "Speed Increase": speedIncrease,
        "Spell Duration": spellDuration,
        "Freeze Time": freezeTime,
        "Cloned Capacity": clonedCapacity,
        "Duration": duration,
        "Recalled Capacity": recalledCapacity,
        "Laboratory Level Required": laboratoryLevelRequired,
        "Hero Heal %": heroHeal,
      };
}
