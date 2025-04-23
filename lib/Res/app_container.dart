import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BuildContainer {
  static buildCard(
      {required double borderRadius,
      required double height,
      required double width,
      required String title,
      required double fontSize}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'Supercell',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static armyDetail({required String title, required String subtitle}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [
            Colors.blueGrey.withOpacity(0.7),
            Colors.black87,
            Colors.blueGrey.withOpacity(0.9)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.r,
                fontFamily: 'Supercell',
                color: Colors.white,
              ),
            ),
            Divider(
              thickness: 2,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.r,
                fontFamily: 'Supercell',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static playerCard(
      {required double borderRadius,
      String? image,
      required double height,
      required double width,
      required String title,
      required double fontSize}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: image!,
              height: 60.r,
              fit: BoxFit.cover,
              placeholder: (context, url) => LoadingAnimationWidget.inkDrop(
                color: Colors.white,
                size: 20.r,
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'Supercell',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
