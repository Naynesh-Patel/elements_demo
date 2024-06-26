import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../import_spareparts_tab/add_spareparts_tab.dart';
import '../widget/button/small_button.dart';

class SparepartsTab extends StatefulWidget {
  const SparepartsTab({super.key});

  @override
  State<SparepartsTab> createState() => _SparepartsTabState();
}

class _SparepartsTabState extends State<SparepartsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HomeAppBar(
        title: "Spareparts Stocks",
        action: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
        // action: [
        //   SvgPicture.asset(
        //     'assets/svg/ic_notification.svg',
        //     height: 20,
        //     width: 20,
        //   ),
        //   const SizedBox(
        //     width: 16,
        //   ),
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    child: Text(
                  "Total Product Import  : 30",
                  style: AppTextStyle.textStyleRegular14,
                )),
                SmallButton(
                    title: "Update",
                    onTap: () {
                      Get.back();
                    },
                    textColor: AppColor.selectColor)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    'Spareparts ${index + 1}',
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
                          Get.to(const AddSparepartsTab(isUpdate: true));
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
            Get.to(const AddSparepartsTab());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
