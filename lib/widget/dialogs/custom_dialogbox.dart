import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constant/vars.dart';
import '../../splash.dart';

class CustomDialogBox {
  CustomDialogBox._();

  static showDeleteDialog({
    required BuildContext context,
    required String bodyText,
    required Function() onCancelTap,
    required Function() onDeleteTap,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          content: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Are You Sure Cancel?",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleBold16,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  bodyText,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleLight12
                      .copyWith(color: const Color(0xff949494)),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallButton(title: "Cancel", onTap: onCancelTap),
                    const SizedBox(
                      width: 16.0,
                    ),
                    SmallButton(
                        title: "Delete",
                        textColor: AppColor.whiteColor,
                        bodyColor: AppColor.selectColor,
                        onTap: onDeleteTap),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showLogoutDialog({
    required BuildContext context,
    required Function() onCancelTap,
    required Function() onLogoutTap,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          content: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Are You Sure Logout?",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleBold16,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  "Do you really want to Logout these App? This process cannot be undone.",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.textStyleLight12
                      .copyWith(color: const Color(0xff949494)),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallButton(title: "Cancel", onTap: onCancelTap),
                    const SizedBox(
                      width: 16.0,
                    ),
                    SmallButton(
                        title: "logout",
                        textColor: AppColor.whiteColor,
                        bodyColor: AppColor.selectColor,
                        onTap: () {
                          Navigator.pop(context);
                          GetStorage().write("isLogin", false);
                          isLogin = false;
                          Get.offUntil(GetPageRoute(page: () => const Splash()),
                              ModalRoute.withName('toNewLogin'));
                        }),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static showPasswordReset({required BuildContext context}) {
    return showDialog(
      barrierColor: const Color(0x00ffffff),
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return Container(
          color: Colors.black26,
          child: AlertDialog(
            backgroundColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: Get.height * 0.22,
                  width: Get.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: Get.width,
                        height: Get.height * 0.110,
                        decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                            child: Text(
                          "Password Reset Successfully",
                          style: AppTextStyle.textStyleRegular16,
                        )),
                      ),
                      Positioned(
                        top: 2,
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.buttonColor),
                            child: Image.asset(
                              "assets/images/check.png",
                              color: AppColor.whiteColor,
                              height: 10,
                              width: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
