import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class SmallButton extends StatefulWidget {
  final String title;
  final Function() onTap;
  final Color? textColor;
  final Color? bodyColor;
  const SmallButton({Key? key,required this.title,required this.onTap,this.bodyColor,this.textColor}) : super(key: key);

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        widget.onTap();
      },
      borderRadius: BorderRadius.circular(5),
      child: Container(
          decoration: BoxDecoration(
              borderRadius:
              BorderRadius.circular(5),
              color:widget.bodyColor??Colors.transparent,
              border: Border.all(
                  color:
                  const Color(0xffC9C9C9))),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 10),
          child: Text(
              widget.title,
              style: AppTextStyle.textStyleRegular14.copyWith(color: widget.textColor ?? AppColor.blackColor)
          )),
    );
  }
}

