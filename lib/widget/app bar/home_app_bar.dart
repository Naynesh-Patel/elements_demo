import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final List<Widget>? action;

  HomeAppBar({Key? key,required this.title,this.action}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.bgAppBarColor,
      title:  Text(
          title,
          style: AppTextStyle.textStyleRegular20.copyWith(color: AppColor.blackColor)
      ),
      actions:action,
    );
  }

}
