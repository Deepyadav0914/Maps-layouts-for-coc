import 'dart:convert';

ResourcesModel resourcesModelFromJson(String str) => ResourcesModel.fromJson(json.decode(str));

String resourcesModelToJson(ResourcesModel data) => json.encode(data.toJson());

class ResourcesModel {
  List<Datum> data;

  ResourcesModel({
    required this.data,
  });

  factory ResourcesModel.fromJson(Map<String, dynamic> json) => ResourcesModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String name;
  String description;
  String cost;
  String role;
  String image;
  List<Detail> details;

  Datum({
    required this.name,
    required this.description,
    required this.cost,
    required this.role,
    required this.image,
    required this.details,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    description: json["description"],
    cost: json["cost"],
    role: json["role"],
    image: json["image"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "description": description,
    "cost": cost,
    "role": role,
    "image": image,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  int level;
  String image;
  dynamic capacity;
  String productionRate;
  dynamic hitpoints;
  dynamic boostCost;
  String timeToFill;
  dynamic buildCost;
  String buildTime;
  dynamic experienceGained;
  String catchUpPoint;
  dynamic townHallLevelRequired;
  String townHallImage;
  String storageCapacity;
  int troopCapacity;
  dynamic spellCapacity;
  dynamic siegeMachineCapacity;
  int laboratoryLevelCap;

  Detail({
    required this.level,
    required this.image,
    required this.capacity,
    required this.productionRate,
    required this.hitpoints,
    required this.boostCost,
    required this.timeToFill,
    required this.buildCost,
    required this.buildTime,
    required this.experienceGained,
    required this.catchUpPoint,
    required this.townHallLevelRequired,
    required this.townHallImage,
    required this.storageCapacity,
    required this.troopCapacity,
    required this.spellCapacity,
    required this.siegeMachineCapacity,
    required this.laboratoryLevelCap,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    level: json["Level"],
    image: json["image"],
    capacity: json["Capacity"],
    productionRate: json["Production Rate"],
    hitpoints: json["Hitpoints"],
    boostCost: json["Boost Cost"],
    timeToFill: json["Time to Fill"],
    buildCost: json["Build Cost"],
    buildTime: json["Build Time"],
    experienceGained: json["Experience Gained"],
    catchUpPoint: json["Catch-Up Point*"],
    townHallLevelRequired: json["Town Hall Level Required"],
    townHallImage: json["Town Hall Image"],
    storageCapacity: json["Storage Capacity"],
    troopCapacity: json["Troop Capacity"],
    spellCapacity: json["Spell Capacity"],
    siegeMachineCapacity: json["Siege Machine Capacity"],
    laboratoryLevelCap: json["Laboratory Level Cap†"],
  );

  Map<String, dynamic> toJson() => {
    "Level": level,
    "image": image,
    "Capacity": capacity,
    "Production Rate": productionRate,
    "Hitpoints": hitpoints,
    "Boost Cost": boostCost,
    "Time to Fill": timeToFill,
    "Build Cost": buildCost,
    "Build Time": buildTime,
    "Experience Gained": experienceGained,
    "Catch-Up Point*": catchUpPoint,
    "Town Hall Level Required": townHallLevelRequired,
    "Town Hall Image": townHallImage,
    "Storage Capacity": storageCapacity,
    "Troop Capacity": troopCapacity,
    "Spell Capacity": spellCapacity,
    "Siege Machine Capacity": siegeMachineCapacity,
    "Laboratory Level Cap†": laboratoryLevelCap,
  };
}

enum BoostCostEnum {
  N_A
}

final boostCostEnumValues = EnumValues({
  "N/A": BoostCostEnum.N_A
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
