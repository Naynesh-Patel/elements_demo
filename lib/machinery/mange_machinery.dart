import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/machinery/add_machinery.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangeMachinery extends StatefulWidget {
  final dynamic model;
  const MangeMachinery({super.key, this.model});

  @override
  State<MangeMachinery> createState() => _MangeMachineryState();
}

class _MangeMachineryState extends State<MangeMachinery> {
  @override
  void initState() {
    setState(() {
      controller.getMachinery();
    });
    super.initState();
  }

  MachineryController controller = Get.find();

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
        child: Obx(() => controller.isGetMachineryLoading.value
            ? const CustomLoader()
            : controller.addMachineryList.isEmpty
                ? const EmptyView()
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          reverse: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.addMachineryList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(AddMachinery(
                                    isView: true,
                                    model: controller
                                        .addMachineryList[index]));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: const Color(0xffE6E6E6),
                                        width: 1)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _keyValue(
                                      "Machine Name",
                                      controller.addMachineryList[index]
                                              ['machine_name'] ??
                                          '',
                                    ),
                                    verticalSpacing(),
                                    _keyValue(
                                        "Machine Type",
                                        controller.addMachineryList[index]
                                                ['machine_type'] ??
                                            ''),
                                    verticalSpacing(),
                                    _keyValue(
                                      "Manufacture Days",
                                      controller.addMachineryList[index]
                                              ['manufacture_duration'] ??
                                          '',
                                    ),
                                    verticalSpacing(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SmallButton(
                                          title: " View ",
                                          textColor: AppColor.selectColor,
                                          onTap: () {
                                            Get.to(AddMachinery(
                                                isView: true,
                                                model: controller
                                                    .addMachineryList[index]));
                                          },
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SmallButton(
                                            title: "Edit",
                                            onTap: () {
                                              Get.to(AddMachinery(
                                                model: controller
                                                    .addMachineryList[index],
                                              ));
                                            },
                                            textColor: const Color(0xff555555)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        SmallButton(
                                            title: "Delete",
                                            onTap: () {
                                              CustomDialogBox.showDeleteDialog(
                                                context: context,
                                                bodyText:
                                                    "Do you really want to cancel these records? This process cannot be undone.",
                                                onCancelTap: () {
                                                  Get.back();
                                                },
                                                onDeleteTap: () {
                                                  setState(() {
                                                    controller.deleteMachinery(
                                                        controller
                                                                .addMachineryList[
                                                            index]['id']);
                                                    controller.addMachineryList
                                                        .removeAt(index);
                                                    Get.back();
                                                  });
                                                },
                                              );
                                            },
                                            textColor: const Color(0xffB50A0A)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.120,
                        ),
                      ],
                    ),
                  )),
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
