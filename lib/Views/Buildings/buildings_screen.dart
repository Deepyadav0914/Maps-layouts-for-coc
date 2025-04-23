import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:coc_app/Routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';

class BuildingsScreen extends StatelessWidget {
  BuildingsScreen({super.key});

  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: SizedBox(
              height: 540.r,
              width: 300.r,
              child: AppinioSwiper(
                backgroundCardCount: 3,
                controller: controller,
                cardCount: CardList.cardList.length,
                loop: true,
                cardBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Get.toNamed(AppName.buildingArmy);
                      } else if (index == 1) {
                        Get.toNamed(AppName.resourcesScreen);
                      } else if (index == 2) {
                        Get.toNamed(AppName.elixirTroopsScreen);
                      } else if (index == 3) {
                        Get.toNamed(AppName.elixirSpellsScreen);
                      } else if (index == 4) {
                        Get.toNamed(AppName.defensesScreen);
                      } else if (index == 5) {
                        Get.toNamed(AppName.darkTroopsScreen);
                      } else if (index == 6) {
                        Get.toNamed(AppName.darkSpellsScreen);
                      } else if (index == 7) {
                        Get.toNamed(AppName.superTroopsScreen);
                      } else if (index == 8) {
                        Get.toNamed(AppName.heroesScreen);
                      } else if (index == 9) {
                        Get.toNamed(AppName.siegeMachineScreen);
                      } else if (index == 10) {
                        Get.toNamed(AppName.petsScreen);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueGrey.shade800,
                            Colors.blueGrey.shade300,
                            Colors.blueGrey.shade900
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            CardList.cardList[index].image,
                            fit: BoxFit.fill,
                          ),
                          Text(
                            CardList.cardList[index].name,
                            style: TextStyle(
                              fontSize: 18.r,
                              fontFamily: 'Supercell',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          GestureDetector(
            onTap: () => controller.unswipe(),
            child: Container(
              height: 30.r,
              width: 30.r,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(Assets.imagesBackbtn),
                      fit: BoxFit.cover)),
            ),
          ),
          // onPressed: () => ,
        ],
      ),
    );
  }
}

class BuildCard {
  final String image;
  final String name;

  BuildCard({required this.image, required this.name});
}

class CardList {
  static final cardList = [
    BuildCard(name: 'Army', image: Assets.imagesArmy),
    BuildCard(name: 'Resources', image: Assets.imagesResources),
    BuildCard(name: 'Elixir Troops', image: Assets.imagesElixirtroops),
    BuildCard(name: 'Elixir Spells', image: Assets.imagesElixirspells),
    BuildCard(name: 'Defenses', image: Assets.imagesDefenses),
    BuildCard(name: 'Dark Troops', image: Assets.imagesDarktroops),
    BuildCard(name: 'Dark Spells', image: Assets.imagesDarkspells),
    BuildCard(name: 'Super Troops', image: Assets.imagesSupertroops),
    BuildCard(name: 'Heroes', image: Assets.imagesHeroes),
    BuildCard(name: 'Siege Machines', image: Assets.imagesSiegemachines),
    BuildCard(name: 'Pets', image: Assets.imagesPets),
  ];
}
