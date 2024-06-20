import 'package:elements/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/binding_controller.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

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
      home: const Splash(),
    );
  }
}
