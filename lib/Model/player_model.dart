import 'dart:convert';

PlayerModel playerModelFromJson(String str) =>
    PlayerModel.fromJson(json.decode(str));

String playerModelToJson(PlayerModel data) => json.encode(data.toJson());

class PlayerModel {
  String tag;
  String name;
  int townHallLevel;
  int townHallWeaponLevel;
  int expLevel;
  int trophies;
  int bestTrophies;
  int warStars;
  int attackWins;
  int defenseWins;
  int builderHallLevel;
  int builderBaseTrophies;
  int bestBuilderBaseTrophies;
  String role;
  String warPreference;
  int donations;
  int donationsReceived;
  int clanCapitalContributions;
  Clan clan;
  League league;
  BuilderBaseLeague builderBaseLeague;
  LegendStatistics legendStatistics;
  List<Achievement> achievements;
  PlayerHouse playerHouse;
  List<Label> labels;
  List<HeroEquipment> troops;
  List<HeroEquipment> heroes;
  List<HeroEquipment> heroEquipment;
  List<HeroEquipment> spells;

  PlayerModel({
    required this.tag,
    required this.name,
    required this.townHallLevel,
    required this.townHallWeaponLevel,
    required this.expLevel,
    required this.trophies,
    required this.bestTrophies,
    required this.warStars,
    required this.attackWins,
    required this.defenseWins,
    required this.builderHallLevel,
    required this.builderBaseTrophies,
    required this.bestBuilderBaseTrophies,
    required this.role,
    required this.warPreference,
    required this.donations,
    required this.donationsReceived,
    required this.clanCapitalContributions,
    required this.clan,
    required this.league,
    required this.builderBaseLeague,
    required this.legendStatistics,
    required this.achievements,
    required this.playerHouse,
    required this.labels,
    required this.troops,
    required this.heroes,
    required this.heroEquipment,
    required this.spells,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        tag: json["tag"],
        name: json["name"],
        townHallLevel: json["townHallLevel"],
        townHallWeaponLevel: json["townHallWeaponLevel"],
        expLevel: json["expLevel"],
        trophies: json["trophies"],
        bestTrophies: json["bestTrophies"],
        warStars: json["warStars"],
        attackWins: json["attackWins"],
        defenseWins: json["defenseWins"],
        builderHallLevel: json["builderHallLevel"],
        builderBaseTrophies: json["builderBaseTrophies"],
        bestBuilderBaseTrophies: json["bestBuilderBaseTrophies"],
        role: json["role"],
        warPreference: json["warPreference"],
        donations: json["donations"],
        donationsReceived: json["donationsReceived"],
        clanCapitalContributions: json["clanCapitalContributions"],
        clan: Clan.fromJson(json["clan"]),
        league: League.fromJson(json["league"]),
        builderBaseLeague:
            BuilderBaseLeague.fromJson(json["builderBaseLeague"]),
        legendStatistics: LegendStatistics.fromJson(json["legendStatistics"]),
        achievements: List<Achievement>.from(
            json["achievements"].map((x) => Achievement.fromJson(x))),
        playerHouse: PlayerHouse.fromJson(json["playerHouse"]),
        labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        troops: List<HeroEquipment>.from(
            json["troops"].map((x) => HeroEquipment.fromJson(x))),
        heroes: List<HeroEquipment>.from(
            json["heroes"].map((x) => HeroEquipment.fromJson(x))),
        heroEquipment: List<HeroEquipment>.from(
            json["heroEquipment"].map((x) => HeroEquipment.fromJson(x))),
        spells: List<HeroEquipment>.from(
            json["spells"].map((x) => HeroEquipment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "name": name,
        "townHallLevel": townHallLevel,
        "townHallWeaponLevel": townHallWeaponLevel,
        "expLevel": expLevel,
        "trophies": trophies,
        "bestTrophies": bestTrophies,
        "warStars": warStars,
        "attackWins": attackWins,
        "defenseWins": defenseWins,
        "builderHallLevel": builderHallLevel,
        "builderBaseTrophies": builderBaseTrophies,
        "bestBuilderBaseTrophies": bestBuilderBaseTrophies,
        "role": role,
        "warPreference": warPreference,
        "donations": donations,
        "donationsReceived": donationsReceived,
        "clanCapitalContributions": clanCapitalContributions,
        "clan": clan.toJson(),
        "league": league.toJson(),
        "builderBaseLeague": builderBaseLeague.toJson(),
        "legendStatistics": legendStatistics.toJson(),
        "achievements": List<dynamic>.from(achievements.map((x) => x.toJson())),
        "playerHouse": playerHouse.toJson(),
        "labels": List<dynamic>.from(labels.map((x) => x.toJson())),
        "troops": List<dynamic>.from(troops.map((x) => x.toJson())),
        "heroes": List<dynamic>.from(heroes.map((x) => x.toJson())),
        "heroEquipment":
            List<dynamic>.from(heroEquipment.map((x) => x.toJson())),
        "spells": List<dynamic>.from(spells.map((x) => x.toJson())),
      };
}

class Achievement {
  String name;
  int stars;
  int value;
  int target;
  String info;
  String? completionInfo;
  Village village;

  Achievement({
    required this.name,
    required this.stars,
    required this.value,
    required this.target,
    required this.info,
    required this.completionInfo,
    required this.village,
  });

  factory Achievement.fromJson(Map<String, dynamic> json) => Achievement(
        name: json["name"],
        stars: json["stars"],
        value: json["value"],
        target: json["target"],
        info: json["info"],
        completionInfo: json["completionInfo"],
        village: villageValues.map[json["village"]]!,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "stars": stars,
        "value": value,
        "target": target,
        "info": info,
        "completionInfo": completionInfo,
        "village": villageValues.reverse[village],
      };
}

enum Village { BUILDER_BASE, CLAN_CAPITAL, HOME }

final villageValues = EnumValues({
  "builderBase": Village.BUILDER_BASE,
  "clanCapital": Village.CLAN_CAPITAL,
  "home": Village.HOME
});

class BuilderBaseLeague {
  int id;
  String name;

  BuilderBaseLeague({
    required this.id,
    required this.name,
  });

  factory BuilderBaseLeague.fromJson(Map<String, dynamic> json) =>
      BuilderBaseLeague(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Clan {
  String tag;
  String name;
  int clanLevel;
  BadgeUrls badgeUrls;

  Clan({
    required this.tag,
    required this.name,
    required this.clanLevel,
    required this.badgeUrls,
  });

  factory Clan.fromJson(Map<String, dynamic> json) => Clan(
        tag: json["tag"],
        name: json["name"],
        clanLevel: json["clanLevel"],
        badgeUrls: BadgeUrls.fromJson(json["badgeUrls"]),
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "name": name,
        "clanLevel": clanLevel,
        "badgeUrls": badgeUrls.toJson(),
      };
}

class BadgeUrls {
  String small;
  String large;
  String medium;

  BadgeUrls({
    required this.small,
    required this.large,
    required this.medium,
  });

  factory BadgeUrls.fromJson(Map<String, dynamic> json) => BadgeUrls(
        small: json["small"],
        large: json["large"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
        "medium": medium,
      };
}

class HeroEquipment {
  String name;
  int level;
  int maxLevel;
  Village village;
  List<HeroEquipment>? equipment;
  bool? superTroopIsActive;

  HeroEquipment({
    required this.name,
    required this.level,
    required this.maxLevel,
    required this.village,
    this.equipment,
    this.superTroopIsActive,
  });

  factory HeroEquipment.fromJson(Map<String, dynamic> json) => HeroEquipment(
        name: json["name"],
        level: json["level"],
        maxLevel: json["maxLevel"],
        village: villageValues.map[json["village"]]!,
        equipment: json["equipment"] == null
            ? []
            : List<HeroEquipment>.from(
                json["equipment"]!.map((x) => HeroEquipment.fromJson(x))),
        superTroopIsActive: json["superTroopIsActive"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "level": level,
        "maxLevel": maxLevel,
        "village": villageValues.reverse[village],
        "equipment": equipment == null
            ? []
            : List<dynamic>.from(equipment!.map((x) => x.toJson())),
        "superTroopIsActive": superTroopIsActive,
      };
}

class Label {
  int id;
  String name;
  LabelIconUrls iconUrls;

  Label({
    required this.id,
    required this.name,
    required this.iconUrls,
  });

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        id: json["id"],
        name: json["name"],
        iconUrls: LabelIconUrls.fromJson(json["iconUrls"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconUrls": iconUrls.toJson(),
      };
}

class LabelIconUrls {
  String small;
  String medium;

  LabelIconUrls({
    required this.small,
    required this.medium,
  });

  factory LabelIconUrls.fromJson(Map<String, dynamic> json) => LabelIconUrls(
        small: json["small"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
      };
}

class League {
  int id;
  String name;
  LeagueIconUrls iconUrls;

  League({
    required this.id,
    required this.name,
    required this.iconUrls,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"],
        name: json["name"],
        iconUrls: LeagueIconUrls.fromJson(json["iconUrls"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "iconUrls": iconUrls.toJson(),
      };
}

class LeagueIconUrls {
  String small;
  String tiny;
  String medium;

  LeagueIconUrls({
    required this.small,
    required this.tiny,
    required this.medium,
  });

  factory LeagueIconUrls.fromJson(Map<String, dynamic> json) => LeagueIconUrls(
        small: json["small"],
        tiny: json["tiny"],
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "tiny": tiny,
        "medium": medium,
      };
}

class LegendStatistics {
  int legendTrophies;
  Season previousSeason;
  Season bestSeason;
  Season bestBuilderBaseSeason;
  CurrentSeason currentSeason;

  LegendStatistics({
    required this.legendTrophies,
    required this.previousSeason,
    required this.bestSeason,
    required this.bestBuilderBaseSeason,
    required this.currentSeason,
  });

  factory LegendStatistics.fromJson(Map<String, dynamic> json) =>
      LegendStatistics(
        legendTrophies: json["legendTrophies"],
        previousSeason: Season.fromJson(json["previousSeason"]),
        bestSeason: Season.fromJson(json["bestSeason"]),
        bestBuilderBaseSeason: Season.fromJson(json["bestBuilderBaseSeason"]),
        currentSeason: CurrentSeason.fromJson(json["currentSeason"]),
      );

  Map<String, dynamic> toJson() => {
        "legendTrophies": legendTrophies,
        "previousSeason": previousSeason.toJson(),
        "bestSeason": bestSeason.toJson(),
        "bestBuilderBaseSeason": bestBuilderBaseSeason.toJson(),
        "currentSeason": currentSeason.toJson(),
      };
}

class Season {
  String id;
  int rank;
  int trophies;

  Season({
    required this.id,
    required this.rank,
    required this.trophies,
  });

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        id: json["id"],
        rank: json["rank"],
        trophies: json["trophies"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rank": rank,
        "trophies": trophies,
      };
}

class CurrentSeason {
  int rank;
  int trophies;

  CurrentSeason({
    required this.rank,
    required this.trophies,
  });

  factory CurrentSeason.fromJson(Map<String, dynamic> json) => CurrentSeason(
        rank: json["rank"],
        trophies: json["trophies"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "trophies": trophies,
      };
}

class PlayerHouse {
  List<Element> elements;

  PlayerHouse({
    required this.elements,
  });

  factory PlayerHouse.fromJson(Map<String, dynamic> json) => PlayerHouse(
        elements: List<Element>.from(
            json["elements"].map((x) => Element.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "elements": List<dynamic>.from(elements.map((x) => x.toJson())),
      };
}

class Element {
  String type;
  int id;

  Element({
    required this.type,
    required this.id,
  });

  factory Element.fromJson(Map<String, dynamic> json) => Element(
        type: json["type"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
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
