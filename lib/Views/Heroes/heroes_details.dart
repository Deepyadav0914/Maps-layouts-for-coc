import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:coc_app/Res/app_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import '../../generated/assets.dart';
import 'Controller/heroes_details.dart';

class HeroesDetails extends StatelessWidget {
  HeroesDetails({super.key});

  final controller = Get.put(HeroesDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.heroesData[0].name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r),
          child: Column(
            children: [
              // Swiper
              SizedBox(
                height: 240.r,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(children: [
                      Center(
                          child: Lottie.asset(
                        Assets.lottiesSplashLight,
                        height: 200.r,
                      )),
                      Positioned(
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: controller.heroesData[0].mainimage,
                            height: 120.r,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                LoadingAnimationWidget.threeArchedCircle(
                              color: Colors.grey,
                              size: 30.r,
                            ),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                    ]);
                  },
                  onIndexChanged: (index) {
                    controller.detailIndex.value = index;
                    controller.saveDetails(); // update the filtered list
                  },
                  indicatorLayout: PageIndicatorLayout.SCALE,
                  itemCount: controller.heroesData[0].details.length,
                  pagination: SwiperPagination(
                    margin: EdgeInsets.zero,
                    builder: SwiperCustomPagination(
                      builder: (context, config) {
                        return ConstrainedBox(
                          constraints: const BoxConstraints.expand(height: 50),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.blueGrey,
                              size: 12.0,
                              activeSize: 20.0,
                            ).build(context, config),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              10.h.verticalSpace,

              // Cost Card
              BuildContainer.buildCard(
                height: 60.r,
                width: double.infinity,
                title: controller.heroesData[0].cost,
                fontSize: 15.r,
                borderRadius: 16.r,
              ),

              10.h.verticalSpace,

              // Description Card
              BuildContainer.armyDetail(
                title: 'Description :',
                subtitle: controller.heroesData[0].description,
              ),

              10.h.verticalSpace,

              // Grid View showing only selected detail
              Obx(() {
                return GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.details.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.r,
                    mainAxisSpacing: 10.r,
                    childAspectRatio: 2.4,
                  ),
                  itemBuilder: (context, index) {
                    final entry = controller.details[index];
                    return BuildContainer.buildCard(
                      title: "${entry.key} : ${entry.value}",
                      fontSize: 13.r,
                      height: 50.r,
                      width: double.infinity,
                      borderRadius: 16.r,
                    );
                  },
                );
              }),
              10.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
