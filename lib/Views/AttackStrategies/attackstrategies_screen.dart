import 'package:animation_list/animation_list.dart';
import 'package:coc_app/Routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/attackstrategies_controller.dart';

class AttackStrategies extends StatelessWidget {
  AttackStrategies({super.key});

  final controller = Get.put((AttackStrategiesController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AttackStrategies'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Obx(() {
          if (controller.isLoading.value) {
            return Center(
              child: LoadingAnimationWidget.hexagonDots(
                color: Colors.white,
                size: 40.r,
              ),
            );
          }
          final data = controller.attacks!;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: AnimationList(
                animationDirection: AnimationDirection.vertical,
                duration: 1600,
                children: data.map((item) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.r),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppName.attackStrategiesDetail,
                            arguments: {'item': item});
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.r, vertical: 12.r),
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
                          children: [
                            10.w.horizontalSpace, // Add some spacing
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name: ${item.name.toString()} ",
                                    style: TextStyle(
                                      fontSize: 15.r,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Supercell',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "Trophies: ${item.trophies.toString()}",
                                    style: TextStyle(
                                      fontSize: 12.r,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Supercell',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
