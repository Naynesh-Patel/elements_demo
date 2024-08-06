import 'dart:convert';

import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/manage_customer/add_customer.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangeCustomer extends StatefulWidget {
  const MangeCustomer({super.key});

  @override
  State<MangeCustomer> createState() => _MangeCustomerState();
}

class _MangeCustomerState extends State<MangeCustomer> {
  CustomerController controller = Get.find();

  @override
  void initState() {
    setState(() {
      controller.getCustomer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: CustomAppBar(
        title: "Manage Customer/Company",
        onPressed: () {
          Get.back();
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Obx(
          () => controller.isGetCustomerLoading.value
              ? const CustomLoader()
              : controller.customerList.isEmpty
                  ? const EmptyView()
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.customerList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Get.to(AddCustomer(
                                    isView: true,
                                    model: controller
                                        .customerList[index], name: controller.customerList[index]["company"]??"",));
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
                                      Row(
                                        children: [
                                          controller.customerList[index]
                                          ['photo'] ==
                                              ""
                                              ? Image.asset(
                                            'assets/images/user_profile.png',
                                            color: Colors.black54,
                                            height: 80,
                                            width: 80,
                                          )
                                              : SizedBox(
                                            height: 80,
                                            width: 80,
                                            child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    50.0),
                                                child: Image.memory(
                                                  base64Decode(controller
                                                      .customerList[
                                                  index]['photo']),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          SizedBox(width: 40,),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              _keyValue(
                                                  "Name",
                                                  controller.customerList[index]
                                                  ['company'] ??
                                                      ''),
                                              verticalSpacing(),
                                              _keyValue(
                                                  "Contact No",
                                                  controller.customerList[index]
                                                  ['contact'] ??
                                                      ''),
                                              verticalSpacing(),
                                              _keyValue(
                                                  "Reference By",
                                                  controller.customerList[index]
                                                  ['reference'] ??
                                                      ''),
                                              verticalSpacing(),
                                            ],
                                          ),
                                          const Spacer(),
                                        ],
                                      ),
                                      verticalSpacing(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SmallButton(
                                            title: "  View  ",
                                            textColor: AppColor.selectColor,
                                            onTap: () {
                                              Get.to(AddCustomer(
                                                  isView: true,
                                                  model: controller
                                                      .customerList[index], name: controller.customerList[index]["company"]??"",));
                                            },
                                          ),
                                          const SizedBox(
                                            width: 12.0,
                                          ),
                                          SmallButton(
                                            title: "  Edit  ",
                                            onTap: () {
                                              Get.to(AddCustomer(
                                                model: controller
                                                    .customerList[index], name: '',
                                              ));
                                            },
                                          ),
                                          const SizedBox(
                                            width: 12.0,
                                          ),
                                          SmallButton(
                                            title: "Delete",
                                            textColor: AppColor.cancelColor,
                                            onTap: () {
                                              CustomDialogBox.showDeleteDialog(
                                                context: context,
                                                bodyText:
                                                "Do you really want to cancel these records? This process cannot be undone.",
                                                onCancelTap: () {
                                                  Get.back();
                                                },
                                                onDeleteTap: () {
                                                  controller.deleteCustomer(
                                                      index: index);
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 16,
                              );
                            },
                          ),
                          SizedBox(
                            height: Get.height * 0.120,
                          ),
                        ],
                      ),
                    ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Get.to( AddCustomer(name: '',));
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
          style: AppTextStyle.textStyleRegular14,
        ),
        Flexible(
            child: Text(
          "$value",
          style: AppTextStyle.textStyleRegular14
              .copyWith(color: AppColor.blackLightColor),
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
