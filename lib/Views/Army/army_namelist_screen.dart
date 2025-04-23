import 'package:animation_list/animation_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../Model/army_model.dart';
import '../../Routes/name_routes.dart';
import 'Controller/army_controller.dart';

class ArmyScreen extends StatelessWidget {
  ArmyScreen({super.key});

  final controller = Get.put((ArmyController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Army'),
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
        final data = controller.armyModel!.data;

        final Map<String, List<Army>> groupedData = {};
        for (var item in data) {
          String level = item.thLevel;
          groupedData.putIfAbsent(level, () => []).add(item);
        }

        final uniqueData = groupedData.keys.toList();

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: AnimationList(
              animationDirection: AnimationDirection.vertical,
              duration: 1600,
              children: uniqueData.map((item) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.r),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppName.trophyLevelScreen, arguments: {
                        'item': item,
                        'data': groupedData[item],
                      });
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
                          CachedNetworkImage(
                            imageUrl: groupedData[item]!.first.image,
                            height: 40.r,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                LoadingAnimationWidget.inkDrop(
                              color: Colors.grey,
                              size: 25.r,
                            ),
                          ),
                          10.w.horizontalSpace,
                          Expanded(
                            child: Text(
                              item,
                              style: TextStyle(
                                fontSize: 14.r,
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
