import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:elements/mange_spareparts/add_spareparts.dart';
import 'package:elements/mange_spareparts/view_spareparts_details.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangeSpareparts extends StatefulWidget {
  const MangeSpareparts({super.key});

  @override
  State<MangeSpareparts> createState() => _MangeSparepartsState();
}

class _MangeSparepartsState extends State<MangeSpareparts> {
  SparepartsController controller = Get.find();
  bool value = false;
  int index = 0;

  @override
  void initState() {
    setState(() {
      controller.getSpareparts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Manage Spareparts",
        onPressed: () {
          Get.back();
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Obx(() => controller.isGetSparepartsLoading.value
            ? const CustomLoader()
            : ListView.builder(
                itemCount: controller.sparepartsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Flexible(
                      //         child: Text(
                      //       "Total Machinery Stock  : 20",
                      //       style: AppTextStyle.textStyleRegular14,
                      //     )),
                      //     SmallButton(
                      //         title: "Update",
                      //         onTap: () {
                      //           Get.to(const AddSpareparts(
                      //             isUpdate: true,
                      //           ));
                      //         },
                      //         textColor: AppColor.selectColor)
                      //   ],
                      // ),
                      const SizedBox(height: 16),
                      InkWell(
                        onTap: () {
                          Get.to(const ViewSparepartsDetails());
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: const Color(0xffE6E6E6), width: 1)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _keyValue(
                                        "Name",
                                        controller.sparepartsList[index]
                                                ['name'] ??
                                            ''),
                                    verticalSpacing(),
                                    _keyValue(
                                        "Qty",
                                        controller.sparepartsList[index]
                                                ['qty'] ??
                                            ''),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(const AddSpareparts(
                                        isUpdate: true,
                                      ));
                                    },
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffC9C9C9)),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Color(0xff555555),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      CustomDialogBox.showDeleteDialog(
                                        context: context,
                                        bodyText:
                                            "Do you really want to cancel these records? This process cannot be undone.",
                                        onCancelTap: () {
                                          Get.back();
                                        },
                                        onDeleteTap: () {
                                          controller.deleteSpareparts(controller
                                              .sparepartsList[index]["id"]);
                                          Get.back();
                                          setState(() {});
                                        },
                                      );
                                    },
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color(0xffC9C9C9)),
                                          borderRadius:
                                              BorderRadius.circular(5)),
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
                  );
                },
              )),
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
          style: AppTextStyle.textStyleRegular16,
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

  Widget verticalSpacing() {
    return const SizedBox(
      height: 6.0,
    );
  }
}
