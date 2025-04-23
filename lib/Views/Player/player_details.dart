import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import '../../Res/app_container.dart';
import '../../generated/assets.dart';
import 'Controller/find_player_controller.dart';

class PlayerDetails extends StatelessWidget {
  PlayerDetails({super.key});

  final controller = Get.put(PlayerDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: LoadingAnimationWidget.hexagonDots(
              color: Colors.white,
              size: 40.r,
            ),
          );
        }

        final player = controller.playerModel.value;

        if (player == null) {
          return Center(
            child: Text("No player data found."),
          );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Supercell',
                            fontSize: 15.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Tag: ${player.tag}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Name: ${player.name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Trophies: ${player.trophies}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'role: ${player.role}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Attack Wins: ${player.attackWins}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Builder Hall Level: ${player.builderHallLevel}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Best Trophies: ${player.bestTrophies}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Builder Hall Level: ${player.builderHallLevel}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Builder Base Trophies: ${player.builderBaseTrophies}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Best Builder Base Trophies: ${player.bestBuilderBaseTrophies}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                20.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'League Details',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Supercell',
                            fontSize: 15.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        SizedBox(
                          height: 130.r,
                          child: Stack(children: [
                            Lottie.asset(
                              Assets.lottiesSplashLight,
                              height: 125.r,
                            ),
                            Positioned(
                              left: 20.r,
                              top: 20.r,
                              child: CachedNetworkImage(
                                imageUrl: player.league.iconUrls.small,
                                height: 80.r,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    LoadingAnimationWidget.inkDrop(
                                  color: Colors.white,
                                  size: 20.r,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ]),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Id: ${player.league.id}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Name: ${player.league.name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                20.h.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Clan Details',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Supercell',
                            fontSize: 15.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        SizedBox(
                          height: 130.r,
                          child: Stack(children: [
                            Lottie.asset(
                              Assets.lottiesSplashLight,
                              height: 125.r,
                            ),
                            Positioned(
                              left: 20.r,
                              top: 20.r,
                              child: CachedNetworkImage(
                                imageUrl: player.clan.badgeUrls.small,
                                height: 80.r,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    LoadingAnimationWidget.inkDrop(
                                  color: Colors.white,
                                  size: 20.r,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                          ]),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Clan Level: ${player.clan.clanLevel}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Clan Tag: ${player.clan.tag}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                        10.h.verticalSpace,
                        Text(
                          'Clan Name: ${player.clan.name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Supercell',
                            fontSize: 11.r,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                20.h.verticalSpace,
                Column(
                  children: [
                    Text(
                      'Heroes',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Supercell',
                        fontSize: 15.r,
                      ),
                    ),
                    20.verticalSpace,
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: player.heroes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.r,
                        mainAxisSpacing: 10.r,
                        childAspectRatio: 2.4,
                      ),
                      itemBuilder: (context, index) {
                        final entry = player.heroes[index];
                        return BuildContainer.playerCard(
                          image:
                              "https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/player_troops/${entry.name}.webp",
                          title: "${entry.name}"
                              "\n"
                              "Level: ${entry.level}",
                          fontSize: 10.r,
                          height: 30.r,
                          width: double.infinity,
                          borderRadius: 16.r,
                        );
                      },
                    ),
                  ],
                ),
                10.h.verticalSpace,
                Column(
                  children: [
                    Text(
                      'Army',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Supercell',
                        fontSize: 15.r,
                      ),
                    ),
                    20.verticalSpace,
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: player.troops.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.r,
                        mainAxisSpacing: 10.r,
                        childAspectRatio: 2.4,
                      ),
                      itemBuilder: (context, index) {
                        final entry = player.troops[index];
                        return BuildContainer.playerCard(
                          image:
                              "https://miracocopepsi.com/admin/mayur/coc/pradip/ios/coc_deep/player_troops/${entry.name}.webp",
                          title: "${entry.name}"
                              "\n"
                              "Level: ${entry.level}",
                          fontSize: 10.r,
                          height: 30.r,
                          width: double.infinity,
                          borderRadius: 16.r,
                        );
                      },
                    ),
                  ],
                ),
                10.h.verticalSpace,
                Column(
                  children: [
                    Text(
                      'Achievements',
                      style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'Supercell',
                        fontSize: 15.r,
                      ),
                    ),
                    20.verticalSpace,
                    GridView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: player.achievements.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.r,
                        mainAxisSpacing: 10.r,
                        childAspectRatio: 2.4,
                      ),
                      itemBuilder: (context, index) {
                        final entry = player.achievements[index];
                        return BuildContainer.playerCard(
                          image: '',
                          title: "Level: ${entry.name}",
                          fontSize: 10.r,
                          height: 30.r,
                          width: double.infinity,
                          borderRadius: 16.r,
                        );
                      },
                    ),
                  ],
                ),
                10.h.verticalSpace,
              ],
            ),
          ),
        );
      }),
    );
  }
}
