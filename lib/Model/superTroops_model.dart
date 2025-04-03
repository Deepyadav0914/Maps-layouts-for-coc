import 'dart:convert';

SuperTroopsModel superTroopsModelFromJson(String str) => SuperTroopsModel.fromJson(json.decode(str));

String superTroopsModelToJson(SuperTroopsModel data) => json.encode(data.toJson());

class SuperTroopsModel {
  List<Datum> data;

  SuperTroopsModel({
    required this.data,
  });

  factory SuperTroopsModel.fromJson(Map<String, dynamic> json) => SuperTroopsModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String name;
  String requiredLevel;
  String description;
  String mainimage;
  List<Detail> details;

  Datum({
    required this.name,
    required this.requiredLevel,
    required this.description,
    required this.mainimage,
    required this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    requiredLevel: json["required level"],
    description: json["description"],
    mainimage: json["mainimage"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "required level": requiredLevel,
    "description": description,
    "mainimage": mainimage,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  int level;
  String image;
  int damagePerSecond;
  double damagePerAttack;
  dynamic hitpoints;

  Detail({
    required this.level,
    required this.image,
    required this.damagePerSecond,
    required this.damagePerAttack,
    required this.hitpoints,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    level: json["Level"],
    image: json["image"],
    damagePerSecond: json["Damage per Second"],
    damagePerAttack: json["Damage per Attack"]?.toDouble(),
    hitpoints: json["Hitpoints"],
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "image": image,
    "Damage per Second": damagePerSecond,
    "Damage per Attack": damagePerAttack,
    "Hitpoints": hitpoints,
  };
}
