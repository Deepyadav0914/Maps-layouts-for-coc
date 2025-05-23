import 'dart:convert';

ArmyModel armyModelFromJson(String str) => ArmyModel.fromJson(json.decode(str));

String armyModelToJson(ArmyModel data) => json.encode(data.toJson());

class ArmyModel {
  List<Army> data;

  ArmyModel({
    required this.data,
  });

  factory ArmyModel.fromJson(Map<String, dynamic> json) => ArmyModel(
        data: List<Army>.from(json["data"].map((x) => Army.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Army {
  String thLevel;
  String image;
  String trophyLvl;
  String army;
  String execution;
  List<Detail> details;

  Army({
    required this.thLevel,
    required this.image,
    required this.trophyLvl,
    required this.army,
    required this.execution,
    required this.details,
  });

  factory Army.fromJson(Map<String, dynamic> json) => Army(
        thLevel: json["thLevel"],
        image: json["image"],
        trophyLvl: json["TrophyLvl"],
        army: json["army"],
        execution: json["execution"],
        details:
            List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "thLevel": thLevel,
        "image": image,
        "TrophyLvl": trophyLvl,
        "army": army,
        "execution": execution,
        "details": List<dynamic>.from(details.map((x) => x.toJson())),
      };
}

class Detail {
  String name;
  String image;
  String quantity;
  String minLvl;
  String housing;

  Detail({
    required this.name,
    required this.image,
    required this.quantity,
    required this.minLvl,
    required this.housing,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        name: json["name"],
        image: json["image"],
        quantity: json["quantity"],
        minLvl: json["minLvl"],
        housing: json["housing"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "quantity": quantity,
        "minLvl": minLvl,
        "housing": housing,
      };
}
