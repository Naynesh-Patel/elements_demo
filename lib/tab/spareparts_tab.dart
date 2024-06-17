import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/spareparts/add_spareparts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        backgroundColor: AppColor.bgAppBarColor,
        title:  Text(
          'Spareparts Stocks',
            style: AppTextStyle.textStyleRegular20
        ),
        automaticallyImplyLeading: false,
        actions: [
          SvgPicture.asset(
            'assets/svg/ic_notification.svg',
            height: 20,
            width: 20,
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title:  Text(
                    'Spareparts ${index+1}',
                    style: AppTextStyle.textStyleBold14.copyWith(color: const Color(0xff555555)),
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
                        child:  TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 11
                              ),
                              hintText: '20 piece',
                              helperStyle: AppTextStyle.textStyleRegular16.copyWith(color: AppColor.dropDownHintColor),
                              hintStyle: const TextStyle(
                                  color: Color(0xff949494),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,)),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Get.to(const AddSpareparts(isUpdate: true));
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
            Get.to(const AddSpareparts());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
