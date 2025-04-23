import 'package:animation_list/animation_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coc_app/Routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'Controller/resources_controller.dart';

class ResourcesScreen extends StatelessWidget {
  ResourcesScreen({super.key});

  final controller = Get.put((ResourcesController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
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
        final data = controller.resources.value!.data;
        return AnimationList(
            animationDirection: AnimationDirection.vertical,
            duration: 1600,
            children: data.map((item) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 10.r),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppName.resourcesDetail,
                        arguments: {'item': item});
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.r),
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
                          imageUrl: item.image,
                          height: 50.r,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              LoadingAnimationWidget.inkDrop(
                            color: Colors.grey,
                            size: 20.r,
                          ),
                          errorWidget: (context, url, error) => Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 190.r,
                          child: Text(
                            item.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.r,
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
            }).toList());
      }),
    );
  }
}
