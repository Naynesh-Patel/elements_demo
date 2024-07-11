import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EmptyView extends StatelessWidget {
  final String? emptyText;
  const EmptyView({super.key, this.emptyText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.75,
      child: Center(
        child: Text(emptyText ?? "No Data Found",style: AppTextStyle.textStyleRegular16,),
      ),
    );
  }
}
