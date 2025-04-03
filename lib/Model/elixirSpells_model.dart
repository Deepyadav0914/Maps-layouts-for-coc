import 'dart:convert';

ElixirSpellsModel elixirSpellsModelFromJson(String str) => ElixirSpellsModel.fromJson(json.decode(str));

String elixirSpellsModelToJson(ElixirSpellsModel data) => json.encode(data.toJson());

class ElixirSpellsModel {
  List<Datum> data;

  ElixirSpellsModel({
    required this.data,
  });

  factory ElixirSpellsModel.fromJson(Map<String, dynamic> json) => ElixirSpellsModel(
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
  dynamic damage;
  String researchCost;
  String researchTime;
  dynamic totalHealing;
  dynamic healingPerPulse;
  dynamic totalHealingOnHeroes;
  DamageIncrease damageIncrease;
  dynamic speedIncrease;
  SpellDuration spellDuration;
  String freezeTime;
  dynamic clonedCapacity;
  Duration duration;
  dynamic recalledCapacity;
  dynamic laboratoryLevelRequired;
  String heroHeal;

  Detail({
    required this.level,
    required this.damage,
    required this.researchCost,
    required this.researchTime,
    required this.totalHealing,
    required this.healingPerPulse,
    required this.totalHealingOnHeroes,
    required this.damageIncrease,
    required this.speedIncrease,
    required this.spellDuration,
    required this.freezeTime,
    required this.clonedCapacity,
    required this.duration,
    required this.recalledCapacity,
    required this.laboratoryLevelRequired,
    required this.heroHeal,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    level: json["Level"],
    damage: json["Damage"],
    researchCost: json["Research Cost"],
    researchTime: json["Research Time"],
    totalHealing: json["Total Healing"],
    healingPerPulse: json["Healing per Pulse"],
    totalHealingOnHeroes: json["Total Healing on Heroes"],
    damageIncrease: damageIncreaseValues.map[json["Damage Increase"]]!,
    speedIncrease: json["Speed Increase"],
    spellDuration: spellDurationValues.map[json["Spell Duration"]]!,
    freezeTime: json["Freeze Time"],
    clonedCapacity: json["Cloned Capacity"],
    duration: durationValues.map[json["Duration"]]!,
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
    "Damage Increase": damageIncreaseValues.reverse[damageIncrease],
    "Speed Increase": speedIncrease,
    "Spell Duration": spellDurationValues.reverse[spellDuration],
    "Freeze Time": freezeTime,
    "Cloned Capacity": clonedCapacity,
    "Duration": durationValues.reverse[duration],
    "Recalled Capacity": recalledCapacity,
    "Laboratory Level Required": laboratoryLevelRequired,
    "Hero Heal %": heroHeal,
  };
}

enum ClonedCapacityEnum {
  N_A,
  THE_1100,
  THE_1210,
  THE_1320,
  THE_1430
}

final clonedCapacityEnumValues = EnumValues({
  "N/A": ClonedCapacityEnum.N_A,
  "1,100": ClonedCapacityEnum.THE_1100,
  "1,210": ClonedCapacityEnum.THE_1210,
  "1,320": ClonedCapacityEnum.THE_1320,
  "1,430": ClonedCapacityEnum.THE_1430
});

enum DamageIncrease {
  N_A,
  THE_130,
  THE_140,
  THE_150,
  THE_160,
  THE_170,
  THE_180
}

final damageIncreaseValues = EnumValues({
  "N/A": DamageIncrease.N_A,
  "130%": DamageIncrease.THE_130,
  "140%": DamageIncrease.THE_140,
  "150%": DamageIncrease.THE_150,
  "160%": DamageIncrease.THE_160,
  "170%": DamageIncrease.THE_170,
  "180%": DamageIncrease.THE_180
});

enum Duration {
  N_A,
  THE_375_S,
  THE_425_S,
  THE_45_S,
  THE_4_S
}

final durationValues = EnumValues({
  "N/A": Duration.N_A,
  "3.75s": Duration.THE_375_S,
  "4.25s": Duration.THE_425_S,
  "4.5s": Duration.THE_45_S,
  "4s": Duration.THE_4_S
});

enum SpellDuration {
  N_A,
  THE_100_SECONDS,
  THE_20_SECONDS,
  THE_40_SECONDS,
  THE_60_SECONDS,
  THE_80_SECONDS
}

final spellDurationValues = EnumValues({
  "N/A": SpellDuration.N_A,
  "100 seconds": SpellDuration.THE_100_SECONDS,
  "20 seconds": SpellDuration.THE_20_SECONDS,
  "40 seconds": SpellDuration.THE_40_SECONDS,
  "60 seconds": SpellDuration.THE_60_SECONDS,
  "80 seconds": SpellDuration.THE_80_SECONDS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
