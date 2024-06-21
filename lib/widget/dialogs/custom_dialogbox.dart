import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:flutter/material.dart';

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
                        onTap: onLogoutTap),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
