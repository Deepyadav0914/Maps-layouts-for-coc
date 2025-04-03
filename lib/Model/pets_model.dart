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
  Cost cost;
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
    cost: costValues.map[json["cost"]]!,
    description: json["description"],
    mainimage: json["mainimage"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "cost": costValues.reverse[cost],
    "description": description,
    "mainimage": mainimage,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

enum Cost {
  PURPLE_ELIXIR
}

final costValues = EnumValues({
  "Purple Elixir": Cost.PURPLE_ELIXIR
});

class Detail {
  int level;
  int damagePerSecond;
  double damagePerHit;
  String hitpoints;
  String upgradeCost;
  String upgradeTime;
  String image;
  int petHouseLevelRequired;
  String damageVsWalls;
  int healingPerSecond;
  int healingPerPulse;
  int frostmitesPerSummon;
  int maximumFrostmitesSummoned;
  StunDuration stunDuration;
  int poisonMaxDamagePerSecond;
  PoisonSpeedDecrease poisonSpeedDecrease;
  PoisonAttackRateDecrease poisonAttackRateDecrease;
  ReviveDuration reviveDuration;
  InvisibilityDuration invisibilityDuration;
  BrainwashDuration brainwashDuration;

  Detail({
    required this.level,
    required this.damagePerSecond,
    required this.damagePerHit,
    required this.hitpoints,
    required this.upgradeCost,
    required this.upgradeTime,
    required this.image,
    required this.petHouseLevelRequired,
    required this.damageVsWalls,
    required this.healingPerSecond,
    required this.healingPerPulse,
    required this.frostmitesPerSummon,
    required this.maximumFrostmitesSummoned,
    required this.stunDuration,
    required this.poisonMaxDamagePerSecond,
    required this.poisonSpeedDecrease,
    required this.poisonAttackRateDecrease,
    required this.reviveDuration,
    required this.invisibilityDuration,
    required this.brainwashDuration,
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
    stunDuration: stunDurationValues.map[json["Stun Duration"]]!,
    poisonMaxDamagePerSecond: json["Poison Max Damage per Second"],
    poisonSpeedDecrease: poisonSpeedDecreaseValues.map[json["Poison Speed Decrease"]]!,
    poisonAttackRateDecrease: poisonAttackRateDecreaseValues.map[json["Poison Attack Rate Decrease"]]!,
    reviveDuration: reviveDurationValues.map[json["Revive Duration"]]!,
    invisibilityDuration: invisibilityDurationValues.map[json["Invisibility Duration"]]!,
    brainwashDuration: brainwashDurationValues.map[json["Brainwash Duration"]]!,
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
    "Stun Duration": stunDurationValues.reverse[stunDuration],
    "Poison Max Damage per Second": poisonMaxDamagePerSecond,
    "Poison Speed Decrease": poisonSpeedDecreaseValues.reverse[poisonSpeedDecrease],
    "Poison Attack Rate Decrease": poisonAttackRateDecreaseValues.reverse[poisonAttackRateDecrease],
    "Revive Duration": reviveDurationValues.reverse[reviveDuration],
    "Invisibility Duration": invisibilityDurationValues.reverse[invisibilityDuration],
    "Brainwash Duration": brainwashDurationValues.reverse[brainwashDuration],
  };
}

enum BrainwashDuration {
  THE_25_S,
  THE_30_S,
  THE_35_S
}

final brainwashDurationValues = EnumValues({
  "25s": BrainwashDuration.THE_25_S,
  "30s": BrainwashDuration.THE_30_S,
  "35s": BrainwashDuration.THE_35_S
});

enum InvisibilityDuration {
  THE_35_S,
  THE_3_S,
  THE_4_S
}

final invisibilityDurationValues = EnumValues({
  "3.5s": InvisibilityDuration.THE_35_S,
  "3s": InvisibilityDuration.THE_3_S,
  "4s": InvisibilityDuration.THE_4_S
});

enum PoisonAttackRateDecrease {
  THE_35,
  THE_45,
  THE_50
}

final poisonAttackRateDecreaseValues = EnumValues({
  "35%": PoisonAttackRateDecrease.THE_35,
  "45%": PoisonAttackRateDecrease.THE_45,
  "50%": PoisonAttackRateDecrease.THE_50
});

enum PoisonSpeedDecrease {
  THE_26,
  THE_34,
  THE_38
}

final poisonSpeedDecreaseValues = EnumValues({
  "26%": PoisonSpeedDecrease.THE_26,
  "34%": PoisonSpeedDecrease.THE_34,
  "38%": PoisonSpeedDecrease.THE_38
});

enum ReviveDuration {
  THE_6_S,
  THE_7_S,
  THE_8_S
}

final reviveDurationValues = EnumValues({
  "6s": ReviveDuration.THE_6_S,
  "7s": ReviveDuration.THE_7_S,
  "8s": ReviveDuration.THE_8_S
});

enum StunDuration {
  THE_25_S,
  THE_2_S,
  THE_3_S
}

final stunDurationValues = EnumValues({
  "2.5s": StunDuration.THE_25_S,
  "2s": StunDuration.THE_2_S,
  "3s": StunDuration.THE_3_S
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
