import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../Res/app_container.dart';
import 'Controller/attackstrategies_controller.dart';

class AttackStrategiesDetail extends StatelessWidget {
  AttackStrategiesDetail({super.key});

  final controller = Get.put((AttackStrategiesDetailController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.attacksData[0].name),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.attacksData.isEmpty) {
          return const Center(
              child: Text("No data available",
                  style: TextStyle(color: Colors.white)));
        }

        final data = controller.attacksData[0];

        return YoutubePlayerScaffold(
          controller: controller.youtubecontroller,
          builder: (context, player) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r),
              child: Column(
                children: [
                  player,
                  10.h.verticalSpace,
                  BuildContainer.buildCard(
                    title: "TownHall: ${data.townHall}",
                    fontSize: 15.r,
                    height: 50.r,
                    width: double.infinity,
                    borderRadius: 18.r,
                  ),
                  10.h.verticalSpace,
                  BuildContainer.buildCard(
                    title: "Trophies: ${data.trophies}",
                    fontSize: 15.r,
                    height: 50.r,
                    width: double.infinity,
                    borderRadius: 18.r,
                  ),
                  10.h.verticalSpace,
                  BuildContainer.buildCard(
                    title: "Author: ${data.author}",
                    fontSize: 15.r,
                    height: 50.r,
                    width: double.infinity,
                    borderRadius: 18.r,
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
