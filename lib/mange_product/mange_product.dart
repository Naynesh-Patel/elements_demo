import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/mange_product/add_product.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MangeProduct extends StatefulWidget {
  const MangeProduct({super.key});

  @override
  State<MangeProduct> createState() => _MangeProductState();
}

class _MangeProductState extends State<MangeProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onPressed: () {
          Get.back();
        },
        title: 'Product Stock',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                      "Total Product Import : 20",
                      style: AppTextStyle.textStyleRegular14,
                    )),
                SmallButton(
                    title: "Update",
                    onTap: () {},
                    textColor: AppColor.selectColor)
              ],
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    'Product ${index + 1}',
                    style: AppTextStyle.textStyleRegular16
                        .copyWith(color: const Color(0xff555555)),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 115,
                        height: 42,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xffD1D1D1))),
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 13),
                              hintText: '20 piece',
                              helperStyle: AppTextStyle.textStyleLight16
                                  .copyWith(color: AppColor.dropDownHintColor),
                              hintStyle: AppTextStyle.textStyleLight14
                                  .copyWith(color: AppColor.dropDownHintColor)),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                        },
                        child: Container(
                            decoration: BoxDecoration(
                              // color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(4),
                                border:
                                Border.all(color: const Color(0xffD1D1D1))),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: SvgPicture.asset(
                              'assets/svg/ic_edit.svg',
                              height: 16,
                              width: 16,
                            )),
                      ),
                    ],
                  ),
                );
              },
            )
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
            Get.to(const AddProduct());
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
