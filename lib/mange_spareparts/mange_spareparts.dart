import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/mange_spareparts/add_spareparts.dart';
import 'package:elements/mange_spareparts/view_spareparts_details.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangeSpareparts extends StatefulWidget {
  const MangeSpareparts({super.key});

  @override
  State<MangeSpareparts> createState() => _MangeSparepartsState();
}

class _MangeSparepartsState extends State<MangeSpareparts> {
  bool value = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Mange Spareparts",
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
                SmallButton(
                    title: "Update",
                    onTap: () {},
                    textColor: AppColor.selectColor)
              ],
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                Get.to(const ViewSparepartsDetails());
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border:
                        Border.all(color: const Color(0xffE6E6E6), width: 1)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _keyValue("Name", "Steel Bolt"),
                          const SizedBox(height: 8),
                          _keyValue("Qty", "10"),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffC9C9C9)),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(
                              Icons.edit,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffC9C9C9)),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(
                              Icons.delete,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
            Get.to(const AddSpareparts());
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
              .copyWith(color: const Color(0xff555555)),
        )),
      ],
    );
  }
}
