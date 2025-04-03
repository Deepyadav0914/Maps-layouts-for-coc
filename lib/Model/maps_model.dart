// To parse this JSON data, do
//
//     final mapsModel = mapsModelFromJson(jsonString);

import 'dart:convert';

MapsModel mapsModelFromJson(String str) => MapsModel.fromJson(json.decode(str));

String mapsModelToJson(MapsModel data) => json.encode(data.toJson());

class MapsModel {
  List<MapListData> data;

  MapsModel({
    required this.data,
  });

  factory MapsModel.fromJson(Map<String, dynamic> json) => MapsModel(
    data: List<MapListData>.from(json["data"].map((x) => MapListData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MapListData {
  Townhall townhall;

  MapListData({
    required this.townhall,
  });

  factory MapListData.fromJson(Map<String, dynamic> json) => MapListData(
    townhall: Townhall.fromJson(json["townhall"]),
  );

  Map<String, dynamic> toJson() => {
    "townhall": townhall.toJson(),
  };
}

class Townhall {
  String thname;
  List<String> color;
  String image;
  List<Detail> details;

  Townhall({
    required this.thname,
    required this.color,
    required this.image,
    required this.details,
  });

  factory Townhall.fromJson(Map<String, dynamic> json) => Townhall(
    thname: json["thname"],
    color: List<String>.from(json["color"].map((x) => x)),
    image: json["image"],
    details: List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "thname": thname,
    "color": List<dynamic>.from(color.map((x) => x)),
    "image": image,
    "details": List<dynamic>.from(details.map((x) => x.toJson())),
  };
}

class Detail {
  String image;
  String cocUrl;
  List<Catagory> catagory;

  Detail({
    required this.image,
    required this.cocUrl,
    required this.catagory,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    image: json["image"],
    cocUrl: json["coc_url"],
    catagory: List<Catagory>.from(json["Catagory"].map((x) => catagoryValues.map[x]!)),
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "coc_url": cocUrl,
    "Catagory": List<dynamic>.from(catagory.map((x) => catagoryValues.reverse[x])),
  };
}

enum Catagory {
  CATAGORY_FARMING,
  CATAGORY_PROGRESS,
  FARMING,
  HYBRID,
  PROGESS,
  PROGRESS,
  TROPHY,
  WAR
}

final catagoryValues = EnumValues({
  "Farming": Catagory.CATAGORY_FARMING,
  " progress": Catagory.CATAGORY_PROGRESS,
  "farming": Catagory.FARMING,
  "Hybrid": Catagory.HYBRID,
  "progess": Catagory.PROGESS,
  "progress": Catagory.PROGRESS,
  "trophy": Catagory.TROPHY,
  "war": Catagory.WAR
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
