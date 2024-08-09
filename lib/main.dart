import 'package:elements/constant/app_colors.dart';
import 'package:elements/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'controller/binding_controller.dart';

Future<void> main() async {
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColor.bgAppBarColor, // Set the status bar color to white or any color you prefer
    statusBarIconBrightness: Brightness.dark, // Set the status bar icons to dark color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingController(),
      theme: ThemeData(
        fontFamily: "Kanit",
        // useMaterial3: true,
      ),
      home:  MediaQuery(
        data: MediaQueryData.fromView(View.of(context)).copyWith(
          textScaler: TextScaler.noScaling,  // Apply MediaQuery only where needed
        ),
        child: const Splash(),  // Or any other specific widget
      ),
    );
  }
}
