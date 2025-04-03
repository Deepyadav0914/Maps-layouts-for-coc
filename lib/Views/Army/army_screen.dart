// import 'package:animation_list/animation_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import '../../generated/assets.dart';
// import 'Controller/army_controller.dart';
//
// class ArmyScreen extends StatelessWidget {
//   ArmyScreen({super.key});
//
//   final List<Map<String, dynamic>> data = [
//     {
//       'title': '1111',
//       'backgroundColor': Colors.grey,
//     },
//     {
//       'title': '2222',
//       'backgroundColor': Colors.green,
//     },
//     {
//       'title': '3333',
//       'backgroundColor': Colors.yellow,
//     },
//     {
//       'title': '4444',
//       'backgroundColor': Colors.blue,
//     },
//     {
//       'title': '5555',
//       'backgroundColor': Colors.green,
//     },
//     {
//       'title': '6666',
//       'backgroundColor': Colors.orange,
//     },
//     {
//       'title': '7777',
//       'backgroundColor': Colors.brown,
//     },
//     {
//       'title': '8888',
//       'backgroundColor': Colors.purple,
//     },
//   ];
//
//   final controller = Get.put((ArmyController()));
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(Assets.imagesSplashBg),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       onPressed: () => Get.back(),
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                         size: 28.r,
//                       ),
//                     ),
//                     const Spacer(),
//                     Text(
//                       'Army',
//                       style: TextStyle(
//                         fontSize: 20.r,
//                         fontFamily: 'Supercell',
//                         color: Colors.white,
//                       ),
//                     ),
//                     const Spacer(),
//                   ],
//                 ),
//                 10.h.verticalSpace,
//                 Expanded(
//                   child: Obx(() {
//                     if (controller.isLoading.value) {
//                       return Center(
//                         child: LoadingAnimationWidget.hexagonDots(
//                           color: Colors.white,
//                           size: 40.r,
//                         ),
//                       );
//                     }
//                     // final data = controller.mapsModel!.data;
//
//                     return AnimationList(

//                         animationDirection: AnimationDirection.horizontal,
//                         duration: 1600,
//                         children:
//
//
//                         data.map((item) {
//                           return _buildTile(
//                               item['title'], item['backgroundColor']);
//                         }).toList());
//                   }),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Widget _buildTile(String? title, Color? backgroundColor) {
//   return Container(
//       height: 80,
//       margin: EdgeInsets.symmetric(horizontal: 2, vertical: 3),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(25)),
//         color: backgroundColor,
//       ));
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../generated/assets.dart';
import 'Controller/army_controller.dart';

class ArmyScreen extends StatelessWidget {
  ArmyScreen({super.key});

  final controller = Get.put((ArmyController()));

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
                      'Army',
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
                    final data = controller.armyModel!.data;
                    return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final item = data[index];

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.r, horizontal: 15.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  border: Border.all(
                                      width: 4.r, color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.r),
                                  child: ListTile(
                                    onTap: () {},
                                    //
                                    leading: Container(
                                      decoration: BoxDecoration(
                                        // colors: <Color>[
                                        //   Color(bgcolor),
                                        //   Color(bgcolor),
                                        // ]
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: item.image,
                                        height: 45.r,
                                        placeholder: (context, url) =>
                                            LoadingAnimationWidget
                                                .threeArchedCircle(
                                          color: Colors.grey,
                                          size: 20.r,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      item.thLevel,
                                      style: TextStyle(
                                        fontFamily: 'VarelaRound',
                                        fontSize: 19.r,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios,
                                        color: Colors.white, size: 25.r),
                                  ),
                                ),
                              ),
                            ],
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
