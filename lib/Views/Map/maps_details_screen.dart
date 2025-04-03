import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tab_container/tab_container.dart';
import '../../generated/assets.dart';
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
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 28.r,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      controller.mapData[0].townhall.thname,
                      style: TextStyle(
                        fontSize: 20.r,
                        fontFamily: 'Supercell',
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                5.h.verticalSpace,
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 10 / 8,
                    child: TabContainer(
                      // controller: controller._controller,
                      tabEdge: TabEdge.top,
                      tabsStart: 0,
                      tabsEnd: 1,
                      tabMaxLength: 150,
                      borderRadius: BorderRadius.circular(10),
                      tabBorderRadius: BorderRadius.circular(10),
                      childPadding: const EdgeInsets.all(14),
                      selectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14.r,
                      ),
                      unselectedTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 13.r,
                      ),
                      colors: [
                        Color(0xffFFC0CB),
                        Color(0xff708090),
                        Color(0xff848884),
                      ],
                      tabs: [
                        Text(
                          'Progress',
                          style: TextStyle(
                            fontSize: 14.r,
                            fontFamily: 'Supercell',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Trophy',
                          style: TextStyle(
                            fontSize: 14.r,
                            fontFamily: 'Supercell',
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'War',
                          style: TextStyle(
                            fontSize: 14.r,
                            fontFamily: 'Supercell',
                            color: Colors.white,
                          ),
                        ),
                      ],
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Container(
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

                                  return MasonryGridView.count(
                                    itemCount: controller.progressData.length,
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 14.r,
                                    crossAxisSpacing: 18.r,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder: (context, index) {
                                      final item = data.townhall;

                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: SingleChildScrollView(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r),
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                              child: Column(
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl: item
                                                        .details[index].image,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        LoadingAnimationWidget
                                                            .threeArchedCircle(
                                                      color: Colors.grey,
                                                      size: 20.r,
                                                    ),
                                                  ),
                                                  5.h.verticalSpace,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl: item.image,
                                                        height: 45.r,
                                                        fit: BoxFit.cover,
                                                        placeholder: (context,
                                                                url) =>
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
                                                            item.thname,
                                                            style: TextStyle(
                                                              fontSize: 15.r,
                                                              fontFamily:
                                                                  'Supercell',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Farming Base',
                                                            style: TextStyle(
                                                              fontSize: 15.r,
                                                              fontFamily:
                                                                  'Supercell',
                                                              color: Colors
                                                                  .green
                                                                  .shade300,
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
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: Container(
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

                                  return MasonryGridView.count(
                                    itemCount: controller.trophyData.length,
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 14.r,
                                    crossAxisSpacing: 18.r,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder: (context, index) {
                                      final item = data.townhall;

                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: SingleChildScrollView(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r),
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                              child: Column(
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl: item
                                                        .details[index].image,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        LoadingAnimationWidget
                                                            .threeArchedCircle(
                                                      color: Colors.grey,
                                                      size: 20.r,
                                                    ),
                                                  ),
                                                  5.h.verticalSpace,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl: item.image,
                                                        height: 45.r,
                                                        fit: BoxFit.cover,
                                                        placeholder: (context,
                                                                url) =>
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
                                                            item.thname,
                                                            style: TextStyle(
                                                              fontSize: 15.r,
                                                              fontFamily:
                                                                  'Supercell',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Farming Base',
                                                            style: TextStyle(
                                                              fontSize: 15.r,
                                                              fontFamily:
                                                                  'Supercell',
                                                              color: Colors
                                                                  .green
                                                                  .shade300,
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
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Expanded(
                              child: Container(
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

                                  return MasonryGridView.count(
                                    itemCount: controller.warData.length,
                                    crossAxisCount: 1,
                                    mainAxisSpacing: 14.r,
                                    crossAxisSpacing: 18.r,
                                    shrinkWrap: true,
                                    primary: false,
                                    itemBuilder: (context, index) {
                                      final item = data.townhall;

                                      return ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: GestureDetector(
                                          onTap: () {},
                                          child: SingleChildScrollView(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.r),
                                                  color: Colors.black
                                                      .withOpacity(0.5)),
                                              child: Column(
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl: item
                                                        .details[index].image,
                                                    fit: BoxFit.cover,
                                                    placeholder: (context,
                                                            url) =>
                                                        LoadingAnimationWidget
                                                            .threeArchedCircle(
                                                      color: Colors.grey,
                                                      size: 20.r,
                                                    ),
                                                  ),
                                                  5.h.verticalSpace,
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CachedNetworkImage(
                                                        imageUrl: item.image,
                                                        height: 45.r,
                                                        fit: BoxFit.cover,
                                                        placeholder: (context,
                                                                url) =>
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
                                                            item.thname,
                                                            style: TextStyle(
                                                              fontSize: 15.r,
                                                              fontFamily:
                                                                  'Supercell',
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Farming Base',
                                                            style: TextStyle(
                                                              fontSize: 15.r,
                                                              fontFamily:
                                                                  'Supercell',
                                                              color: Colors
                                                                  .green
                                                                  .shade300,
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
                            ),
                          ],
                        ),
                      ],
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
