import 'package:cached_network_image/cached_network_image.dart';
import 'package:coc_app/Views/Map/maps_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../generated/assets.dart';
import 'Controller/maps_controller.dart';

class MapsScreen extends StatelessWidget {
  MapsScreen({super.key});

  final controller = Get.put((MapsController()));

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
                      'Map',
                      style: TextStyle(
                        fontSize: 20.r,
                        fontFamily: 'Supercell',
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                10.h.verticalSpace,
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
                    final data = controller.mapsModel!.data;

                    return MasonryGridView.count(
                      itemCount: data.length,
                      crossAxisCount: 2,
                      mainAxisSpacing: 14.r,
                      crossAxisSpacing: 18.r,
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        final item = data[index];
                        int bgcolor = int.parse(item.townhall.color[0]);
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(16.r),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => MapsDetails(),
                                  arguments: {'item': item});

                              // print("msg == ${index}");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(bgcolor),
                                    Color(bgcolor),
                                  ],
                                ),
                              ),
                              child: Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    10.h.verticalSpace,
                                    CachedNetworkImage(
                                      imageUrl: item.townhall.image,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          LoadingAnimationWidget
                                              .threeArchedCircle(
                                        color: Colors.grey,
                                        size: 20.r,
                                      ),
                                    ),
                                    5.h.verticalSpace,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              item.townhall.thname,
                                              style: TextStyle(
                                                fontSize: 15.r,
                                                fontFamily: 'Supercell',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
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
          ),
        ),
      ),
    );
  }
}
