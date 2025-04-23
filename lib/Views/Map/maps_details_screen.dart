import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tab_container/tab_container.dart';
import '../../Res/app_dialogs.dart';
import 'Controller/maps_controller.dart';

class MapsDetails extends StatefulWidget {
  const MapsDetails({super.key});

  @override
  State<MapsDetails> createState() => _MapsDetailsState();
}

class _MapsDetailsState extends State<MapsDetails> {
  final controller = Get.put((MapsDetailController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.mapData[0].townhall.thname),
      ),
      body: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 10 / 8,
              child: TabContainer(
                // controller: controller._controller,
                tabEdge: TabEdge.top,
                tabsStart: 0,
                tabsEnd: 1,

                borderRadius: BorderRadius.circular(10),
                tabBorderRadius: BorderRadius.circular(10),
                childPadding: const EdgeInsets.all(14),
                selectedTextStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 14.r,
                ),
                unselectedTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 13.r,
                ),
                colors: [
                  Color(0xffA59D84),
                  Color(0xff708090),
                  Color(0xff848884),
                ],
                tabs: [
                  Text(
                    'Progress',
                    style: TextStyle(
                      fontFamily: 'Supercell',
                    ),
                  ),
                  Text(
                    'Trophy',
                    style: TextStyle(
                      fontFamily: 'Supercell',
                    ),
                  ),
                  Text(
                    'War',
                    style: TextStyle(
                      fontFamily: 'Supercell',
                    ),
                  ),
                ],
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Obx(() {
                          if (controller.isLoading.value) {
                            return Center(
                              child: LoadingAnimationWidget.hexagonDots(
                                color: Colors.white,
                                size: 40.r,
                              ),
                            );
                          }
                          final data = controller.mapData[0];
                          final progressEntries =
                              controller.progressData.entries.toList();

                          return MasonryGridView.count(
                            itemCount: progressEntries.length,
                            crossAxisCount: 1,
                            mainAxisSpacing: 14.r,
                            crossAxisSpacing: 18.r,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              final entry = progressEntries[index];

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: GestureDetector(
                                  onTap: () {
                                    showAlertDialog(context, entry.key,
                                        data.townhall.thname);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16.r),
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    child: Column(
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:
                                              entry.key, // Use the image key
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 25.r),
                                            child:
                                                LoadingAnimationWidget.inkDrop(
                                              color: Colors.grey,
                                              size: 25.r,
                                            ),
                                          ),
                                        ),
                                        5.h.verticalSpace,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CachedNetworkImage(
                                              imageUrl: data.townhall.image,
                                              height: 45.r,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) =>
                                                  LoadingAnimationWidget
                                                      .threeArchedCircle(
                                                color: Colors.grey,
                                                size: 20.r,
                                              ),
                                            ),
                                            20.w.horizontalSpace,
                                            Column(
                                              children: [
                                                Text(
                                                  data.townhall
                                                      .thname, // Use actual TH name
                                                  style: TextStyle(
                                                    fontSize: 14.r,
                                                    fontFamily: 'Supercell',
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  'Farming Base',
                                                  style: TextStyle(
                                                    fontSize: 14.r,
                                                    fontFamily: 'Supercell',
                                                    color: Colors.grey.shade400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        10.h.verticalSpace,
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Obx(() {
                          if (controller.isLoading.value) {
                            return Center(
                              child: LoadingAnimationWidget.hexagonDots(
                                color: Colors.white,
                                size: 40.r,
                              ),
                            );
                          }
                          final data = controller.mapData[0];
                          print('msg==${data.runtimeType}');
                          final trophyEntries =
                              controller.trophyData.entries.toList();

                          return MasonryGridView.count(
                            itemCount: trophyEntries.length,
                            crossAxisCount: 1,
                            mainAxisSpacing: 14.r,
                            crossAxisSpacing: 18.r,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              final entry = trophyEntries[index];

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: GestureDetector(
                                  onTap: () {
                                    showAlertDialog(context, entry.key,
                                        data.townhall.thname);
                                  },
                                  child: SingleChildScrollView(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: Colors.black.withOpacity(0.5)),
                                      child: Column(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: entry.key,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 25.r),
                                              child: LoadingAnimationWidget
                                                  .inkDrop(
                                                color: Colors.grey,
                                                size: 25.r,
                                              ),
                                            ),
                                          ),
                                          5.h.verticalSpace,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl: data.townhall.image,
                                                height: 45.r,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    LoadingAnimationWidget
                                                        .threeArchedCircle(
                                                  color: Colors.grey,
                                                  size: 20.r,
                                                ),
                                              ),
                                              20.w.horizontalSpace,
                                              Column(
                                                children: [
                                                  Text(
                                                    data.townhall.thname,
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                      fontFamily: 'Supercell',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Farming Base',
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                      fontFamily: 'Supercell',
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          10.h.verticalSpace,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Expanded(
                        child: Obx(() {
                          if (controller.isLoading.value) {
                            return Center(
                              child: LoadingAnimationWidget.hexagonDots(
                                color: Colors.white,
                                size: 40.r,
                              ),
                            );
                          }
                          final data = controller.mapData[0];
                          print('msg==${data.runtimeType}');
                          final warEntries =
                              controller.warData.entries.toList();

                          return MasonryGridView.count(
                            itemCount: warEntries.length,
                            crossAxisCount: 1,
                            mainAxisSpacing: 14.r,
                            crossAxisSpacing: 18.r,
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              final entry = warEntries[index];

                              return ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: GestureDetector(
                                  onTap: () {
                                    showAlertDialog(context, entry.key,
                                        data.townhall.thname);
                                  },
                                  child: SingleChildScrollView(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: Colors.black.withOpacity(0.5)),
                                      child: Column(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: entry.key,
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Center(
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 25.r),
                                                child: LoadingAnimationWidget
                                                    .inkDrop(
                                                  color: Colors.grey,
                                                  size: 25.r,
                                                ),
                                              ),
                                            ),
                                          ),
                                          5.h.verticalSpace,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl: data.townhall.image,
                                                height: 45.r,
                                                fit: BoxFit.cover,
                                                placeholder: (context, url) =>
                                                    LoadingAnimationWidget
                                                        .threeArchedCircle(
                                                  color: Colors.grey,
                                                  size: 20.r,
                                                ),
                                              ),
                                              20.w.horizontalSpace,
                                              Column(
                                                children: [
                                                  Text(
                                                    data.townhall.thname,
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                      fontFamily: 'Supercell',
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Farming Base',
                                                    style: TextStyle(
                                                      fontSize: 14.r,
                                                      fontFamily: 'Supercell',
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          10.h.verticalSpace,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
