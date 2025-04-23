import 'package:coc_app/Routes/name_routes.dart';
import 'package:get/get.dart';
import '../Views/Army/army_details.dart';
import '../Views/Army/army_namelist_screen.dart';
import '../Views/Army/army_trophylevel_screen.dart';
import '../Views/AttackStrategies/attackstrategies_details.dart';
import '../Views/AttackStrategies/attackstrategies_screen.dart';
import '../Views/BuildingArmy/buildingarmy_details.dart';
import '../Views/BuildingArmy/buildingarmy_screen.dart';
import '../Views/Buildings/buildings_screen.dart';
import '../Views/Clans/find_clan.dart';
import '../Views/DarkSpells/darkspells_details.dart';
import '../Views/DarkSpells/darkspells_screen.dart';
import '../Views/DarkTroops/darktroops_details.dart';
import '../Views/DarkTroops/darktroops_screen.dart';
import '../Views/Defenses/defenses_details.dart';
import '../Views/Defenses/defenses_screen.dart';
import '../Views/ElixirSpells/elixirspells_details.dart';
import '../Views/ElixirSpells/elixirspells_screen.dart';
import '../Views/ElixirTroops/elixirtroops_details.dart';
import '../Views/ElixirTroops/elixirtroops_screen.dart';
import '../Views/Heroes/heroes_details.dart';
import '../Views/Heroes/heroes_screen.dart';
import '../Views/Home/home_screen.dart';
import '../Views/Map/maps_details_screen.dart';
import '../Views/Map/maps_screen.dart';
import '../Views/Pets/pets_details.dart';
import '../Views/Pets/pets_screen.dart';
import '../Views/Player/find_player.dart';
import '../Views/Player/player_details.dart';
import '../Views/Resources/resources_details.dart';
import '../Views/Resources/resources_screen.dart';
import '../Views/Setting/setting.dart';
import '../Views/SiegeMachines/siegemachines_details.dart';
import '../Views/SiegeMachines/siegemachines_screen.dart';
import '../Views/Splash/splash_screen.dart';
import '../Views/SuperTroops/supertroops_details.dart';
import '../Views/SuperTroops/supertroops_screen.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppName.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.mapScreen,
      page: () => MapsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.mapDetail,
      page: () => MapsDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.attackStrategies,
      page: () => AttackStrategies(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.attackStrategiesDetail,
      page: () => AttackStrategiesDetail(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.buildingsScreen,
      page: () => BuildingsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.buildingArmy,
      page: () => BuildingArmy(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.buildArmyDetail,
      page: () => BuildArmyDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.resourcesScreen,
      page: () => ResourcesScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.resourcesDetail,
      page: () => ResourcesDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.elixirTroopsScreen,
      page: () => ElixirTroopsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.elixirTroopsDetail,
      page: () => ElixirTroopsDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.elixirSpellsScreen,
      page: () => ElixirSpellsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.elixirSpellsDetail,
      page: () => ElixirSpellsDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.defensesScreen,
      page: () => DefensesScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.defensesDetail,
      page: () => DefensesDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.darkTroopsScreen,
      page: () => DarkTroopsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.darkTroopsDetail,
      page: () => DarkTroopsDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.darkSpellsScreen,
      page: () => DarkSpellsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.darkSpellsDetail,
      page: () => DarkSpellsDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.superTroopsScreen,
      page: () => SuperTroopsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.superTroopsDetail,
      page: () => SuperTroopsDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.heroesScreen,
      page: () => HeroesScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.heroesDetail,
      page: () => HeroesDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.siegeMachineScreen,
      page: () => SiegeMachineScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.siegeMachineDetail,
      page: () => SiegeMachineDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.petsScreen,
      page: () => PetsScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.petsDetail,
      page: () => PetsDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.armyScreen,
      page: () => ArmyScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.armyDetail,
      page: () => ArmyDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.trophyLevelScreen,
      page: () => TrophyLevelScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.settingScreen,
      page: () => SettingScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.playerScreen,
      page: () => PlayerScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.playerDetail,
      page: () => PlayerDetails(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppName.clanScreen,
      page: () => ClanScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
