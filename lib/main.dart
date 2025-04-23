import 'package:coc_app/Routes/name_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Routes/page_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppName.splashScreen,
          getPages: AppPages.routes,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,

            appBarTheme: AppBarTheme(
                centerTitle: true,
                backgroundColor: Colors.black,
                titleTextStyle: TextStyle(
                  fontSize: 18.r,
                  fontFamily: 'Supercell',
                  color: Colors.white,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                  size: 28.r,
                )),
          ),
        );
      },
    );
  }
}
