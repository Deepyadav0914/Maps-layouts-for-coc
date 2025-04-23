import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Routes/name_routes.dart';
import 'Controller/army_controller.dart';

class TrophyLevelScreen extends StatelessWidget {
  TrophyLevelScreen({super.key});

  final controller = Get.put((LevelController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trophy level'),
      ),
      body: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: AnimationList(
              animationDirection: AnimationDirection.vertical,
              duration: 1600,
              children: controller.data.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.r),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppName.armyDetail,
                          arguments: {'item': item});
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.r, vertical: 10.r),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blueGrey.withOpacity(0.7),
                            Colors.black87,
                            Colors.blueGrey.withOpacity(0.9)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(18.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          10.w.horizontalSpace,
                          Expanded(
                            child: Text(
                              "Trophy Level: ${item.trophyLvl}",
                              style: TextStyle(
                                fontSize: 13.r,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Supercell',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.white,
                            size: 28.r,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList()),
        );
      }),
    );
  }
}
