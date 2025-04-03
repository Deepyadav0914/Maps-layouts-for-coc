import 'dart:convert';

DarkElixirSpellsModel darkElixirSpellsModelFromJson(String str) => DarkElixirSpellsModel.fromJson(json.decode(str));

String darkElixirSpellsModelToJson(DarkElixirSpellsModel data) => json.encode(data.toJson());

class DarkElixirSpellsModel {
  List<Datum> data;

  DarkElixirSpellsModel({
    required this.data,
  });

  factory DarkElixirSpellsModel.fromJson(Map<String, dynamic> json) => DarkElixirSpellsModel(
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
  dynamic maxDamagePerSecond;
  String speedDecrease;
  String attackRateDecrease;
  String researchCost;
  String researchTime;
  String damage;
  String radius;
  dynamic speedIncrease;
  String spellDuration;
  dynamic skeletonsGenerated;
  dynamic batsGenerated;
  dynamic laboratoryLevelRequired;
  String duration;

  Detail({
    required this.level,
    required this.maxDamagePerSecond,
    required this.speedDecrease,
    required this.attackRateDecrease,
    required this.researchCost,
    required this.researchTime,
    required this.damage,
    required this.radius,
    required this.speedIncrease,
    required this.spellDuration,
    required this.skeletonsGenerated,
    required this.batsGenerated,
    required this.laboratoryLevelRequired,
    required this.duration,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    level: json["Level"],
    maxDamagePerSecond: json["Max damage per second"],
    speedDecrease: json["Speed Decrease"],
    attackRateDecrease: json["Attack Rate Decrease"],
    researchCost: json["Research Cost"],
    researchTime: json["Research Time"],
    damage: json["Damage"],
    radius: json["Radius"],
    speedIncrease: json["Speed Increase"],
    spellDuration: json["Spell Duration"],
    skeletonsGenerated: json["Skeletons generated"],
    batsGenerated: json["Bats generated"],
    laboratoryLevelRequired: json["Laboratory Level Required"],
    duration: json["Duration"],
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "Max damage per second": maxDamagePerSecond,
    "Speed Decrease": speedDecrease,
    "Attack Rate Decrease": attackRateDecrease,
    "Research Cost": researchCost,
    "Research Time": researchTime,
    "Damage": damage,
    "Radius": radius,
    "Speed Increase": speedIncrease,
    "Spell Duration": spellDuration,
    "Skeletons generated": skeletonsGenerated,
    "Bats generated": batsGenerated,
    "Laboratory Level Required": laboratoryLevelRequired,
    "Duration": duration,
  };
}

enum BatsGeneratedEnum {
  N_A
}

final batsGeneratedEnumValues = EnumValues({
  "N/A": BatsGeneratedEnum.N_A
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
