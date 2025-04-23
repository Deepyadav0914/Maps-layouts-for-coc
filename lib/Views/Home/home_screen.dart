import 'package:coc_app/Routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import '../../generated/assets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.black),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Clash of Clans',
                    style: TextStyle(
                      fontSize: 18.r,
                      fontFamily: 'Supercell',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              10.h.verticalSpace,
              Expanded(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10.r),
                      child: Column(
                        children: [
                          MasonryGridView.count(
                            itemCount: ItemList.itemList.length,
                            crossAxisCount: 1,
                            mainAxisSpacing: 10.r,
                            crossAxisSpacing: 10.r,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.toNamed(AppName.mapScreen);
                                    } else if (index == 1) {
                                      Get.toNamed(AppName.attackStrategies);
                                    } else if (index == 2) {
                                      Get.toNamed(AppName.buildingsScreen);
                                    } else if (index == 3) {
                                      Get.toNamed(AppName.armyScreen);
                                    } else if (index == 4) {
                                      Get.toNamed(AppName.playerScreen);
                                    } else if (index == 5) {
                                      Get.toNamed(AppName.clanScreen);
                                    } else if (index == 6) {
                                      Get.toNamed(AppName.settingScreen);
                                    }
                                  },
                                  child: Container(
                                    height: 196.r,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blueGrey.shade500,
                                            Colors.blueGrey.shade300,
                                            Colors.blueGrey.shade900
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                ItemList.itemList[index].image),
                                            fit: BoxFit.cover)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            ItemList.itemList[index].name,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 14.r,
                                              overflow: TextOverflow.ellipsis,
                                              fontFamily: 'Supercell',
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildGrid {
  final String image;
  final String name;

  BuildGrid({required this.image, required this.name});
}

class ItemList {
  static final itemList = [
    BuildGrid(name: 'Maps', image: Assets.imagesMaps),
    BuildGrid(name: 'Attack Strategies', image: Assets.imagesAttackStrategies),
    BuildGrid(name: 'Buildings', image: Assets.imagesBuilding),
    BuildGrid(name: 'Army', image: Assets.imagesArmys),
    BuildGrid(name: 'Top Player', image: Assets.imagesTopplayer),
    BuildGrid(name: 'Top Clans', image: Assets.imagesTopclan),
    BuildGrid(name: 'Setting', image: Assets.imagesSetting),
  ];
}
