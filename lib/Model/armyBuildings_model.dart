import 'dart:convert';

ArmyBuildingsModel armyBuildingsModelFromJson(String str) =>
    ArmyBuildingsModel.fromJson(json.decode(str));

String armyBuildingsModelToJson(ArmyBuildingsModel data) =>
    json.encode(data.toJson());

class ArmyBuildingsModel {
  List<Datum> data;

  ArmyBuildingsModel({
    required this.data,
  });

  factory ArmyBuildingsModel.fromJson(Map<String, dynamic> json) =>
      ArmyBuildingsModel(
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
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
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
  String image;
  dynamic troopCapacity;
  String unlockedUnit;
  dynamic hitpoints;
  String spellSUnlocked;
  dynamic spellStorageCapacity;
  dynamic buildCost;
  String buildTime;
  dynamic experienceGained;
  dynamic siegeMachineCapacity;
  dynamic townHallLevelRequired;
  String townHallImage;
  String? unlockedUnitImage;
  String? unlockedSpellImage;

  Detail({
    required this.level,
    required this.image,
    this.troopCapacity,
    required this.unlockedUnit,
    required this.hitpoints,
    required this.spellSUnlocked,
    required this.spellStorageCapacity,
    required this.buildCost,
    required this.buildTime,
    required this.experienceGained,
    required this.siegeMachineCapacity,
    required this.townHallLevelRequired,
    required this.townHallImage,
    this.unlockedUnitImage,
    this.unlockedSpellImage,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        level: json["Level"],
        image: json["image"],
        troopCapacity: json["Troop Capacity"],
        unlockedUnit: json["Unlocked Unit"],
        hitpoints: json["Hitpoints"],
        spellSUnlocked: json["Spell(s) Unlocked"],
        spellStorageCapacity: json["Spell Storage Capacity"],
        buildCost: json["Build Cost"],
        buildTime: json["Build Time"],
        experienceGained: json["Experience Gained"],
        siegeMachineCapacity: json["Siege Machine Capacity"],
        townHallLevelRequired: json["Town Hall Level Required"],
        townHallImage: json["Town Hall Image"],
        unlockedUnitImage: json["Unlocked Unit Image"],
        unlockedSpellImage: json["Unlocked Spell Image"],
      );

  Map<String, dynamic> toJson() => {
        "Level": level,
        "image": image,
        "Troop Capacity": troopCapacity,
        "Unlocked Unit": unlockedUnit,
        "Hitpoints": hitpoints,
        "Spell(s) Unlocked": spellSUnlocked,
        "Spell Storage Capacity": spellStorageCapacity,
        "Build Cost": buildCost,
        "Build Time": buildTime,
        "Experience Gained": experienceGained,
        "Siege Machine Capacity": siegeMachineCapacity,
        "Town Hall Level Required": townHallLevelRequired,
        "Town Hall Image": townHallImage,
        "Unlocked Unit Image": unlockedUnitImage,
        "Unlocked Spell Image": unlockedSpellImage,
      };
}
