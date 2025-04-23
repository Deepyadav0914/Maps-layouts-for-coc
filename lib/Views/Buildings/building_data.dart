// import 'package:animation_list/animation_list.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'Controller/building_controller.dart';
// import 'building_details.dart';
//
// class BuildingData extends StatelessWidget {
//   BuildingData({super.key});
//
//   final controller = Get.put((BuildingDataController()));
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
//                         'Details',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 18.r,
//                           fontFamily: 'Supercell',
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Obx(() {
//                   if (controller.isLoading.value) {
//                     return Center(
//                       child: LoadingAnimationWidget.hexagonDots(
//                         color: Colors.white,
//                         size: 40.r,
//                       ),
//                     );
//                   }
//                   final data = controller.listData.value;
//
//                   return Padding(
//                     padding:
//                         EdgeInsets.symmetric(vertical: 5.r, horizontal: 10.r),
//                     child: AnimationList(
//                       duration: 1600,
//                       children: List.generate(data.length, (index) {
//                         return Padding(
//                           padding: EdgeInsets.all(5.r),
//                           child: GestureDetector(
//                             onTap: () {
//                               Get.to(() => BuildingDetails(),
//                                   arguments: {"data": data
//                                   });
//                               print("data == ${data}");
//                               print("data == ${data.runtimeType}");
//                             },
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 5.r, vertical: 6.r),
//                               decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     Colors.blueGrey.withOpacity(0.7),
//                                     Colors.black87,
//                                     Colors.blueGrey.withOpacity(0.9),
//                                   ],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                 ),
//                                 borderRadius: BorderRadius.circular(18.r),
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   ClipRRect(
//                                     borderRadius: BorderRadius.circular(18.r),
//                                     child: CachedNetworkImage(
//                                       imageUrl: data[index].mainimage,
//                                       height: 60.r,
//                                       fit: BoxFit.cover,
//                                       placeholder: (context, url) =>
//                                           LoadingAnimationWidget
//                                               .threeArchedCircle(
//                                         color: Colors.grey,
//                                         size: 20.r,
//                                       ),
//                                       errorWidget: (context, url, error) =>
//                                           Icon(
//                                         Icons.error,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 170.r,
//                                     child: Text(
//                                       data[index].name,
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 15.r,
//                                         overflow: TextOverflow.ellipsis,
//                                         fontFamily: 'Supercell',
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                   Icon(
//                                     Icons.arrow_circle_right_outlined,
//                                     color: Colors.white,
//                                     size: 28.r,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   );
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
