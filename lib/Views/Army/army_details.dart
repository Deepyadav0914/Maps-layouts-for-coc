import 'package:cached_network_image/cached_network_image.dart';
import 'package:coc_app/Res/app_container.dart';
import 'package:coc_app/Views/Army/Controller/army_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ArmyDetails extends StatelessWidget {
  ArmyDetails({super.key});

  final controller = Get.put((ArmyDetailController()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            controller.armyData[0].thLevel,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.r),
            child: Column(
              children: [
                BuildContainer.buildCard(
                    title: controller.armyData[0].army,
                    fontSize: 15.r,
                    height: 50.r,
                    width: double.infinity,
                    borderRadius: 18.r),
                10.h.verticalSpace,
                BuildContainer.buildCard(
                    title: 'Army :',
                    fontSize: 15.r,
                    height: 50.r,
                    width: double.infinity,
                    borderRadius: 18.r),
                10.h.verticalSpace,
                MasonryGridView.count(
                  itemCount: controller.armyData[0].details.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r,
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    final armydata = controller.armyData;
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueGrey.withOpacity(0.7),
                              Colors.black54,
                              Colors.blueGrey.withOpacity(0.9)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              imageUrl: armydata[0].details[index].image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Padding(
                                padding: EdgeInsets.only(top: 15.r),
                                child: LoadingAnimationWidget.inkDrop(
                                  color: Colors.grey,
                                  size: 20.r,
                                ),
                              ),
                            ),
                            5.h.verticalSpace,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  armydata[0].details[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13.r,
                                    fontFamily: 'Supercell',
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.r),
                                  child: Divider(
                                    thickness: 2,
                                  ),
                                ),
                                Text(
                                  'Level : ${armydata[0].details[index].minLvl}',
                                  style: TextStyle(
                                    fontSize: 13.r,
                                    fontFamily: 'Supercell',
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Housing : ${armydata[0].details[index].housing}',
                                  style: TextStyle(
                                    fontSize: 13.r,
                                    fontFamily: 'Supercell',
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Quantity : x${armydata[0].details[index].quantity}',
                                  style: TextStyle(
                                    fontSize: 13.r,
                                    fontFamily: 'Supercell',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            10.h.verticalSpace,
                          ],
                        ),
                      ),
                    );
                  },
                ),
                10.h.verticalSpace,
                BuildContainer.armyDetail(
                    title: 'Execution :',
                    subtitle: controller.armyData[0].execution),
                10.h.verticalSpace,
              ],
            ),
          ),
        ));
  }
}
