import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class CustomButton extends StatefulWidget {
  final String buttonText;
  final Function onTap;
  final Color? color;
  RxBool isLoading;

  CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.color,
      required this.isLoading });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: widget.color ?? Colors.black,
        borderRadius: BorderRadius.circular(4),
        child: Obx(
          () => widget.isLoading.value ?? false
              ? Container(
                  height: 50.0,
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: const SpinKitCircle(
                    color: AppColor.whiteColor,
                    size: 50.0,
                  ),
                )
              : InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {
                    widget.onTap();
                  },
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 50),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(6)),
                    child: Center(
                        child: Text(
                      widget.buttonText,
                      style: AppTextStyle.textStyleRegular18
                          .copyWith(color: AppColor.whiteColor),
                    )),
                  ),
                ),
        ));
  }
}
