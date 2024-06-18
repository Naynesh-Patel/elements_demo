import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/machinery/add_machinery.dart';
import 'package:elements/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangeMachinery extends StatefulWidget {
  const MangeMachinery({super.key});

  @override
  State<MangeMachinery> createState() => _MangeMachineryState();
}

class _MangeMachineryState extends State<MangeMachinery> {
  bool value = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Manage Machinery Stock",
        onPressed: () {
          Get.back();
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  "Total Machinery Stock  : 20",
                  style: AppTextStyle.textStyleRegular14,
                )),
                _smallButton(
                    title: "Update",
                    onTap: () {},
                    textColor: AppColor.selectColor)
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xffE6E6E6), width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _keyValue(
                    "Machine Name",
                    "Containership",
                  ),
                  const SizedBox(height: 8),
                  _keyValue(
                    "Machine Type",
                    "Steel Cutting",
                  ),
                  const SizedBox(height: 8),
                  _keyValue(
                    "Qty",
                    "1",
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _smallButton(
                        title: " View ",
                        textColor: AppColor.selectColor,
                        onTap: () {},
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      _smallButton(
                          title: "  Edit  ",
                          onTap: () {},
                          textColor: const Color(0xff555555)),
                      const SizedBox(
                        width: 10,
                      ),
                      _smallButton(
                          title: "Delete",
                          onTap: () {},
                          textColor: const Color(0xffB50A0A)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Get.to(const AddMachinery());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Widget _keyValue(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$key : ",
          style: AppTextStyle.textStyleBold14,
        ),
        Flexible(
            child: Text(
          "$value",
          style: AppTextStyle.textStyleRegular14
              .copyWith(color: Color(0xff555555)),
        )),
      ],
    );
  }

  Widget _smallButton(
      {void Function()? onTap, required String title, Color? textColor}) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(5),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xffC9C9C9))),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Text(title,
              style: AppTextStyle.textStyleBold12
                  .copyWith(color: textColor ?? AppColor.blackColor))),
    );
  }
}
