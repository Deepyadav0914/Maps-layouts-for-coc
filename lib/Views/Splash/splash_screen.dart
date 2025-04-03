import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import '../../generated/assets.dart';
import '../Home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.to(() => HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesSplashBg),
            fit: BoxFit.fill,
          ),


        ),
        child: Column(
          children: [
            const Spacer(),
            Stack(
              children: [
                Center(
                    child: Lottie.asset(
                  Assets.lottiesSplashLight,
                  height: 300.r,
                )),
                Positioned(
                  child: Image.asset(
                    Assets.imagesCocLogo,
                    fit: BoxFit.fill,
                    height: 400.r,
                  ),
                )
              ],
            ),
            const Spacer(),
            LoadingAnimationWidget.halfTriangleDot(
              color: Colors.white,
              size: 40.r,
            ),
            SizedBox(
              height: 50.r,
            )
          ],
        ),
      ),
    );
  }
}
