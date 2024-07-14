import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nassem_shop_app/const/colors.dart';
import 'package:nassem_shop_app/localization/local.dart';
import 'package:nassem_shop_app/view/splash/splash_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nassem Shop App',
        locale: Get.locale,
        translations: MyLocale(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            backgroundColor:  Colors.white
          ),
          primaryColor: primaryColor,
          fontFamily: 'Bahij_TheSansArabic',
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      );
    });
  }
}
