import 'package:elements/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: Get.height * 0.75,
      width: Get.width,
      child: const SpinKitCircle(
        color: AppColor.buttonColor,
        size: 50.0,
      ),
    );
  }
}
