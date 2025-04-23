// To parse this JSON data, do
//
//     final attackStrategiesModel = attackStrategiesModelFromJson(jsonString);

import 'dart:convert';

List<AttackStrategiesModel> attackStrategiesModelFromJson(String str) => List<AttackStrategiesModel>.from(json.decode(str).map((x) => AttackStrategiesModel.fromJson(x)));

String attackStrategiesModelToJson(List<AttackStrategiesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttackStrategiesModel {
  String name;
  String author;
  dynamic townHall;
  dynamic trophies;
  String videoUrl;

  AttackStrategiesModel({
    required this.name,
    required this.author,
    required this.townHall,
    required this.trophies,
    required this.videoUrl,
  });

  factory AttackStrategiesModel.fromJson(Map<String, dynamic> json) => AttackStrategiesModel(
    name: json["name"],
    author: json["author"],
    townHall: json["townHall"],
    trophies: json["trophies"],
    videoUrl: json["video_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "author": author,
    "townHall": townHall,
    "trophies": trophies,
    "video_url": videoUrl,
  };
}
