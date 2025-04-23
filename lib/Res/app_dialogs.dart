import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Views/Map/Controller/maps_controller.dart';

final controller = Get.put(MapsDetailController());
final GlobalKey shareKey = GlobalKey();

void showAlertDialog(BuildContext context, String image, String name) {
  Get.dialog(
    Center(
      child: AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 350.r,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Colors.white.withOpacity(0.6)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Supercell',
                      fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(height: 12.r),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      image,
                      height: 220.r,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.r),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => controller.launchURL(
                              controller.mapData[0].townhall.details[0].cocUrl,
                              context),
                          label: Text(
                            "Copy Base",
                            style: TextStyle(
                              fontFamily: 'Supercell',
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                side: BorderSide(color: Colors.white)),
                            padding: EdgeInsets.symmetric(vertical: 12.r),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.r),
                      Expanded(
                        child: ElevatedButton.icon(
                          key: shareKey,
                          onPressed: () =>
                              controller.onShareWithResult(context, shareKey),
                          label: Text(
                            "Share",
                            style: TextStyle(
                              fontFamily: 'Supercell',
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                side: BorderSide(color: Colors.white)),
                            padding: EdgeInsets.symmetric(vertical: 12.r),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
