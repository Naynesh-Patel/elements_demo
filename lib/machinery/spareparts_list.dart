import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_colors.dart';

class SparepartList extends StatefulWidget {
  const SparepartList({
    super.key,
  });

  @override
  State<SparepartList> createState() => _SparepartListState();
}

class _SparepartListState extends State<SparepartList> {
  @override
  void initState() {
    super.initState();
    sparepartsController.getSpareparts();
  }

  SparepartsController sparepartsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Sparepart',
        onPressed: () {
          Get.back();
        },
      ),
      body: Obx(() => sparepartsController.isGetSparepartsLoading.value
          ? const CustomLoader()
          : sparepartsController.sparepartsList.isEmpty
              ? const EmptyView()
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: sparepartsController.sparepartsList.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                  sparepartsController.sparepartsList[index]
                                          ['name'] ??
                                      ''.toString(),
                                  style:
                                      AppTextStyle.textStyleRegular16.copyWith(
                                    color: const Color(0xff272727),
                                  )),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(6.0),
                              onTap: () {
                                if (sparepartsController.sparepartsList[index]
                                        ['isSelect'] ==
                                    null) {
                                  sparepartsController.sparepartsList[index]
                                      ['isSelect'] = true;
                                } else if (sparepartsController
                                        .sparepartsList[index]['isSelect'] ==
                                    true) {
                                  sparepartsController.sparepartsList[index]
                                      ['isSelect'] = false;
                                } else {
                                  sparepartsController.sparepartsList[index]
                                      ['isSelect'] = true;
                                }
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4.0, vertical: 4.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.dropDownHintColor),
                                    borderRadius: BorderRadius.circular(6.0)),
                                child: Obx(() => Icon(
                                      Icons.check_rounded,
                                      size: 14,
                                      color: sparepartsController
                                                      .sparepartsList[index]
                                                  ['isSelect'] ??
                                              false
                                          ? AppColor.blackColor
                                          : Colors.transparent,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20.0,
                    );
                  },
                )),
      bottomNavigationBar: CustomButton(
          color: AppColor.buttonColor,
          buttonText: "Done",
          onTap: () {
            sparepartsController.selectSparepartsList.value =
                sparepartsController.sparepartsList
                    .where((item) => item['isSelect'] == true)
                    .toList();
            Get.back();
          },
          isLoading: false.obs),
    );
  }
}
