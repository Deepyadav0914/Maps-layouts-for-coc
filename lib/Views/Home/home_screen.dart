import 'package:coc_app/Views/Army/army_screen.dart';
import 'package:coc_app/Views/Map/maps_screen.dart';
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplashBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Clash of Clans',
                      style: TextStyle(
                        fontSize: 20.r,
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
                      child: Column(
                        children: [
                          MasonryGridView.count(
                            itemCount: ItemList.itemList.length,
                            crossAxisCount: 2,
                            mainAxisSpacing: 14.r,
                            crossAxisSpacing: 18.r,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: GestureDetector(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(MapsScreen());
                                    } else if (index == 1) {
                                    } else if (index == 2) {

                                      Get.to(ArmyScreen());
                                    } else if (index == 3) {
                                    } else if (index == 4) {
                                    } else if (index == 5) {
                                    } else if (index == 6) {
                                    } else if (index == 7) {}
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        10.h.verticalSpace,
                                        Image.asset(
                                          ItemList.itemList[index].image,
                                          fit: BoxFit.cover,
                                        ),
                                        5.h.verticalSpace,
                                        Text(
                                          ItemList.itemList[index].name,
                                          style: TextStyle(
                                            fontSize: 15.r,
                                            fontFamily: 'Supercell',
                                            color: Colors.white,
                                          ),
                                        ),
                                        10.h.verticalSpace,
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
              ],
            ),
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
    BuildGrid(name: 'Layout', image: Assets.imagesLayout),
    BuildGrid(name: 'Buildings', image: Assets.imagesBuildings),
    BuildGrid(name: 'Army', image: Assets.imagesArmy),
    BuildGrid(name: 'Top Player', image: Assets.imagesPlayer),
    BuildGrid(name: 'Top Clans', image: Assets.imagesClans),
    BuildGrid(name: 'Setting', image: Assets.imagesPlayer),
  ];
}
