import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  static TextStyle textStyleLight10 = TextStyle(
      fontSize: Get.width < 900 ? 10 : 12,
      color: AppColor.hintColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w400);

  static TextStyle textStyleRegular10 = TextStyle(
      fontSize: Get.width < 900 ? 10 : 12,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w500);

  static TextStyle textStyleBold10 = TextStyle(
      fontSize: Get.width < 900 ? 10 : 12,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w600);

  static TextStyle textStyleLight12 = TextStyle(
      fontSize: Get.width < 900 ? 12 : 14,
      color: AppColor.hintColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w400);

  static TextStyle textStyleRegular12 = TextStyle(
      fontSize: Get.width < 900 ? 12 : 14,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w500);

  static TextStyle textStyleBold12 = TextStyle(
      fontSize: Get.width < 900 ? 12 : 14,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w600);

  static TextStyle textStyleRegular13 = TextStyle(
      fontSize: Get.width < 900 ? 13 : 17,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w500);

  static TextStyle textStyleLight14 = TextStyle(
      fontSize: Get.width < 900 ? 14 : 18,
      color: AppColor.hintColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w400);

  static TextStyle textStyleRegular14 = TextStyle(
      fontSize: Get.width < 900 ? 14 : 18,
      color: AppColor.blackColor,
      //  // letterSpacing: 1.0,
      fontWeight: FontWeight.w500);

  static TextStyle textStyleBold14 = TextStyle(
      fontSize: Get.width < 900 ? 14 : 18,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w600);

  static TextStyle textStyleLight16 = TextStyle(
      fontSize: Get.width < 900 ? 16 : 20,
      color: AppColor.hintColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w400);

  static TextStyle textStyleRegular16 = TextStyle(
      fontSize: Get.width < 900 ? 16 : 20,
      color: AppColor.blackColor,
      // letterSpacing: 0.5,
      fontWeight: FontWeight.w500);

  static TextStyle textStyleBold15 = TextStyle(
      fontSize: Get.width < 900 ? 15 : 20,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w600);

  static TextStyle textStyleBold16 = TextStyle(
      fontSize: Get.width < 900 ? 16 : 20,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w600);

  static TextStyle textStyleBold13 = TextStyle(
      fontSize: Get.width < 900 ? 13 : 20,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w600);

  static TextStyle textStyleRegular18 = TextStyle(
      fontSize: Get.width < 900 ? 18 : 20,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w500);

  static TextStyle textStyleBold18 = TextStyle(
      fontSize: Get.width < 900 ? 18 : 22,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w600);

  static TextStyle textStyleLight20 = TextStyle(
      fontSize: Get.width < 900 ? 20 : 24,
      color: AppColor.hintColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w400);

  static TextStyle textStyleRegular20 = TextStyle(
      fontSize: Get.width < 900 ? 20 : 24,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w500);

  static TextStyle textStyleBold20 = TextStyle(
      fontSize: Get.width < 900 ? 20 : 24,
      color: AppColor.blackColor,
       // letterSpacing: 1.0,
      fontWeight: FontWeight.w600);

  static TextStyle appbarTextStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w800,
    color: AppColor.whiteColor,
    letterSpacing: 2.0,
  );

  static TextStyle subHeading = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.blackColor,
  );

  static TextStyle normal = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.blackColor,
  );
}
