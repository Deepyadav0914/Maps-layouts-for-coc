// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:coc_app/Res/app_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:lottie/lottie.dart';
// import '../../generated/assets.dart';
// import 'Controller/building_controller.dart';
//
// class BuildingDetails extends StatelessWidget {
//   BuildingDetails({super.key});
//
//   final controller = Get.put(BuildingDetailsController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(color: Colors.black),
//         child: SafeArea(
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.r),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () => Get.back(),
//                       icon: Icon(
//                         Icons.arrow_back_ios,
//                         color: Colors.white,
//                         size: 28.r,
//                       ),
//                     ),
//                     Expanded(
//                       child: Text(
//                         controller.detailsData[0].name,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 18.r,
//                           overflow: TextOverflow.ellipsis,
//                           fontFamily: 'Supercell',
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: SizedBox(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 10.r),
//                       child: Column(
//                         children: [
//                           // Swiper
//                           SizedBox(
//                             height: 250.r,
//                             child: Swiper(
//                               itemBuilder: (BuildContext context, int index) {
//                                 return Stack(children: [
//                                   Center(
//                                       child: Lottie.asset(
//                                     Assets.lottiesSplashLight,
//                                     height: 200.r,
//                                   )),
//                                   Positioned(
//                                     child: Center(
//                                       child: CachedNetworkImage(
//                                         imageUrl:
//                                             controller.detailsData[0].mainimage,
//                                         fit: BoxFit.cover,
//                                         height: 120.r,
//                                         placeholder: (context, url) =>
//                                             LoadingAnimationWidget
//                                                 .threeArchedCircle(
//                                           color: Colors.white,
//                                           size: 30.r,
//                                         ),
//                                         errorWidget: (context, url, error) =>
//                                             Icon(Icons.error),
//                                       ),
//                                     ),
//                                   ),
//                                 ]);
//                               },
//                               onIndexChanged: (index) {
//                                 controller.detailIndex.value = index;
//                                 controller
//                                     .saveDetails(); // update the filtered list
//                               },
//                               indicatorLayout: PageIndicatorLayout.SCALE,
//                               itemCount:
//                                   controller.detailsData[0].details.length,
//                               pagination: SwiperPagination(
//                                 margin: EdgeInsets.zero,
//                                 builder: SwiperCustomPagination(
//                                   builder: (context, config) {
//                                     return ConstrainedBox(
//                                       constraints: const BoxConstraints.expand(
//                                           height: 50),
//                                       child: Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: DotSwiperPaginationBuilder(
//                                           color: Colors.white,
//                                           activeColor: Colors.blueGrey,
//                                           size: 12.0,
//                                           activeSize: 20.0,
//                                         ).build(context, config),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                           10.h.verticalSpace,
//
//                           // Description Card
//                           buildContainer().armyDetail(
//                             title: 'Description :',
//                             subtitle: controller.detailsData[0].description,
//                           ),
//
//                           10.h.verticalSpace,
//
//                           // Grid View showing only selected detail
//                           Obx(() {
//                             return GridView.builder(
//                               scrollDirection: Axis.vertical,
//                               physics: NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: controller.details.length,
//                               gridDelegate:
//                                   SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 2,
//                                 crossAxisSpacing: 10.r,
//                                 mainAxisSpacing: 10.r,
//                                 childAspectRatio: 2.4,
//                               ),
//                               itemBuilder: (context, index) {
//                                 final entry = controller.details[index];
//                                 return buildContainer().buildCard(
//                                   title: "${entry.key} : ${entry.value}",
//                                   fontSize: 13.r,
//                                   height: 50.r,
//                                   width: double.infinity,
//                                   borderRadius: 16.r,
//                                 );
//                               },
//                             );
//                           }),
//                           10.h.verticalSpace,
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

