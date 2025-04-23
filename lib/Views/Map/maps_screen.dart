import 'package:cached_network_image/cached_network_image.dart';
import 'package:coc_app/Routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/maps_controller.dart';

class MapsScreen extends StatelessWidget {
  MapsScreen({super.key});

  final controller = Get.put((MapsController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
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
        if (controller.mapsModel == null ||
            controller.mapsModel.value!.data.isEmpty) {
          return Center(child: Text("No data found"));
        }

        final data = controller.mapsModel.value!.data;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Column(
              children: [
                MasonryGridView.count(
                  itemCount: data.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    final item = data[index];

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppName.mapDetail,
                              arguments: {'item': item});
                        },
                        child: Container(
                          height: 230.r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Colors.blueGrey.shade500,
                                Colors.blueGrey.shade300,
                                Colors.blueGrey.shade900
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CachedNetworkImage(
                                imageUrl: item.townhall.image,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    LoadingAnimationWidget.inkDrop(
                                  color: Colors.white,
                                  size: 20.r,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    item.townhall.thname,
                                    style: TextStyle(
                                      fontSize: 15.r,
                                      fontFamily: 'Supercell',
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
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
