import 'dart:convert';
import 'package:dio/dio.dart';
import '../Model/armyBuildings_model.dart';
import '../Model/army_model.dart';
import '../Model/attackStrategies_model.dart';
import '../Model/darkElixirSpells_model.dart';
import '../Model/darkElixirTroops_model.dart';
import '../Model/defenses_model.dart';
import '../Model/elixirSpells_model.dart';
import '../Model/elixirTroops_model.dart';
import '../Model/heroes_model.dart';
import '../Model/maps_model.dart';
import '../Model/pets_model.dart';
import '../Model/player_model.dart';
import '../Model/resources_model.dart';
import '../Model/siegeMachines_model.dart';
import '../Model/superTroops_model.dart';

class ApiCall {
  Future<ArmyModel> armyData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/army.json');

      if (response.statusCode == 200) {
        print(response.data);
        return armyModelFromJson(json.encode(response.data));
      } else {
        print(response.data);

        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e);

      throw Exception('Error: $e');
    }
  }

  Future<ArmyBuildingsModel> armyBuildingsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/army_buildings.json');

      if (response.statusCode == 200) {
        return armyBuildingsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<AttackStrategiesModel>> attackStrategiesData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/attack_strategies.json');

      if (response.statusCode == 200) {
        return attackStrategiesModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<DarkElixirSpellsModel> darkElixirSpellsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/dark_elixir_spells.json');

      if (response.statusCode == 200) {
        return darkElixirSpellsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<DarkElixirTroopsModel> darkElixirTroopsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/dark_elixir_troops.json');

      if (response.statusCode == 200) {
        print(response.data);
        return darkElixirTroopsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<DefensesModel> defensesData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/defenses.json');

      if (response.statusCode == 200) {
        return defensesModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<ElixirSpellsModel> elixirSpellsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/elixir_spells.json');

      if (response.statusCode == 200) {
        return elixirSpellsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<ElixirTroopsModel> elixirTroopsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/elixir_troops.json');

      if (response.statusCode == 200) {
        return elixirTroopsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<HeroesModel> heroesData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/heroes.json');

      if (response.statusCode == 200) {
        return heroesModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<MapsModel> mapsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/coc_map.json');

      if (response.statusCode == 200) {
        print(response.data);
        return mapsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<PetsModel> petsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/pets.json');

      if (response.statusCode == 200) {
        return petsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<ResourcesModel> resourcesData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/resources.json');

      if (response.statusCode == 200) {
        return resourcesModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<SiegeMachinesModel> siegeMachinesData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/siege_machines.json');

      if (response.statusCode == 200) {
        return siegeMachinesModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<SuperTroopsModel> superTroopsData() async {
    try {
      var response = await Dio().get(
          'https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/super_troops.json');

      if (response.statusCode == 200) {
        return superTroopsModelFromJson(json.encode(response.data));
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<PlayerModel> playerData(playerId) async {
    try {
      var response = await Dio().post(
        'https://supercellapi.miracocopepsi.com/api/makeCall',
        queryParameters: {
          "type": "get",
          "url": "https://api.clashofclans.com/v1/players/%23$playerId"
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
        // Ensure the response data is a Map, not a String
        if (response.data is Map<String, dynamic>) {
          return PlayerModel.fromJson(response.data);
          // print("response.data");
        } else if (response.data is String) {
          // Manually decode if it's a raw JSON string
          return PlayerModel.fromJson(jsonDecode(response.data));
        } else {
          throw Exception("Unexpected data type: ${response.data.runtimeType}");
        }
      } else {
        throw Exception('Failed to load player data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future clanData(clanId) async {
    try {
      var response = await Dio().post(
        'https://supercellapi.miracocopepsi.com/api/makeCall',
        queryParameters: {
          "type": "get",
          "url": "https://api.clashofclans.com/v1/players/%23$clanId"
        },
      );

      if (response.statusCode == 200) {
        print(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
