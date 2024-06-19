import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
   final void Function()? onPressed;
   final String title;
   final List<Widget>? action;

   CustomAppBar({Key? key,required this.title,this.onPressed,this.action}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

   @override
   final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColor.bgAppBarColor,
      surfaceTintColor: Colors.transparent,
      titleSpacing: 0,
      leading: IconButton(
        onPressed:onPressed,
        icon: const Icon(Icons.arrow_back_ios_new_rounded,size: 20,color: AppColor.blackColor,),
      ),
      title:  Text(
          title,
          style: AppTextStyle.textStyleRegular20.copyWith(color: AppColor.blackColor)
      ),
      actions:action,
    );
  }

}
