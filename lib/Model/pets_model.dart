import 'dart:convert';

PetsModel petsModelFromJson(String str) => PetsModel.fromJson(json.decode(str));

String petsModelToJson(PetsModel data) => json.encode(data.toJson());

class PetsModel {
  List<Datum> data;

  PetsModel({
    required this.data,
  });

  factory PetsModel.fromJson(Map<String, dynamic> json) => PetsModel(
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
  double? damagePerHit;
  String hitpoints;
  String upgradeCost;
  String upgradeTime;
  String image;
  int petHouseLevelRequired;
  String? damageVsWalls;
  int? healingPerSecond;
  int? healingPerPulse;
  int? frostmitesPerSummon;
  int? maximumFrostmitesSummoned;
  String? stunDuration;
  int? poisonMaxDamagePerSecond;
  String? poisonSpeedDecrease;
  String? poisonAttackRateDecrease;
  String? reviveDuration;
  String? invisibilityDuration;
  String? brainwashDuration;

  Detail({
    required this.level,
    this.damagePerSecond,
    this.damagePerHit,
    required this.hitpoints,
    required this.upgradeCost,
    required this.upgradeTime,
    required this.image,
    required this.petHouseLevelRequired,
    this.damageVsWalls,
    this.healingPerSecond,
    this.healingPerPulse,
    this.frostmitesPerSummon,
    this.maximumFrostmitesSummoned,
    this.stunDuration,
    this.poisonMaxDamagePerSecond,
    this.poisonSpeedDecrease,
    this.poisonAttackRateDecrease,
    this.reviveDuration,
    this.invisibilityDuration,
    this.brainwashDuration,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    level: json["Level"],
    damagePerSecond: json["Damage per Second"],
    damagePerHit: json["Damage per Hit"]?.toDouble(),
    hitpoints: json["Hitpoints"],
    upgradeCost: json["Upgrade Cost"],
    upgradeTime: json["Upgrade Time"],
    image: json["image"],
    petHouseLevelRequired: json["Pet House Level Required"],
    damageVsWalls: json["Damage vs. Walls"],
    healingPerSecond: json["Healing per Second"],
    healingPerPulse: json["Healing per Pulse"],
    frostmitesPerSummon: json["Frostmites per Summon"],
    maximumFrostmitesSummoned: json["Maximum Frostmites Summoned"],
    stunDuration: json["Stun Duration"],
    poisonMaxDamagePerSecond: json["Poison Max Damage per Second"],
    poisonSpeedDecrease: json["Poison Speed Decrease"],
    poisonAttackRateDecrease: json["Poison Attack Rate Decrease"],
    reviveDuration: json["Revive Duration"],
    invisibilityDuration: json["Invisibility Duration"],
    brainwashDuration:json["Brainwash Duration"],
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "Damage per Second": damagePerSecond,
    "Damage per Hit": damagePerHit,
    "Hitpoints": hitpoints,
    "Upgrade Cost": upgradeCost,
    "Upgrade Time": upgradeTime,
    "image": image,
    "Pet House Level Required": petHouseLevelRequired,
    "Damage vs. Walls": damageVsWalls,
    "Healing per Second": healingPerSecond,
    "Healing per Pulse": healingPerPulse,
    "Frostmites per Summon": frostmitesPerSummon,
    "Maximum Frostmites Summoned": maximumFrostmitesSummoned,
    "Stun Duration": stunDuration,
    "Poison Max Damage per Second": poisonMaxDamagePerSecond,
    "Poison Speed Decrease": poisonSpeedDecrease,
    "Poison Attack Rate Decrease": poisonAttackRateDecrease,
    "Revive Duration": reviveDuration,
    "Invisibility Duration": invisibilityDuration,
    "Brainwash Duration": brainwashDuration,
  };
}
