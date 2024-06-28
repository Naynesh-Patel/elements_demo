import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final Color? color;
  const CustomButton(
      {super.key, required this.buttonText, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.black,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          onTap();
        },
        child: Container(
          constraints: const BoxConstraints(maxHeight: 50),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
          child: Center(
              child: Text(
            buttonText,
            style: AppTextStyle.textStyleRegular18
                .copyWith(color: AppColor.whiteColor),
          )),
        ),
      ),
    );
  }
}
