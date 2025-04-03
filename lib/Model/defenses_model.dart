import 'dart:convert';

DefensesModel defensesModelFromJson(String str) => DefensesModel.fromJson(json.decode(str));

String defensesModelToJson(DefensesModel data) => json.encode(data.toJson());

class DefensesModel {
  List<Datum> data;

  DefensesModel({
    required this.data,
  });

  factory DefensesModel.fromJson(Map<String, dynamic> json) => DefensesModel(
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
  COIN,
  DARK_ELIXIR
}

final costValues = EnumValues({
  "Coin": Cost.COIN,
  "Dark Elixir": Cost.DARK_ELIXIR
});

class Detail {
  int level;
  String image;
  dynamic damagePerSecond;
  dynamic damagePerShot;
  dynamic hitpoints;
  dynamic buildCost;
  String buildTime;
  dynamic experienceGained;
  int townHallLevelRequired;
  String townHallImage;

  Detail({
    required this.level,
    required this.image,
    required this.damagePerSecond,
    required this.damagePerShot,
    required this.hitpoints,
    required this.buildCost,
    required this.buildTime,
    required this.experienceGained,
    required this.townHallLevelRequired,
    required this.townHallImage,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    level: json["Level"],
    image: json["image"],
    damagePerSecond: json["Damage per Second"],
    damagePerShot: json["Damage per Shot"],
    hitpoints: json["Hitpoints"],
    buildCost: json["Build Cost"],
    buildTime: json["Build Time"],
    experienceGained: json["Experience Gained"],
    townHallLevelRequired: json["Town Hall Level Required"],
    townHallImage: json["Town Hall Image"],
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "image": image,
    "Damage per Second": damagePerSecond,
    "Damage per Shot": damagePerShot,
    "Hitpoints": hitpoints,
    "Build Cost": buildCost,
    "Build Time": buildTime,
    "Experience Gained": experienceGained,
    "Town Hall Level Required": townHallLevelRequired,
    "Town Hall Image": townHallImage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
