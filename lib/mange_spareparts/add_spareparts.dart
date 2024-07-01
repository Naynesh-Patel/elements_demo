import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/spareparts_controller.dart';

class AddSpareparts extends StatefulWidget {
  final bool isUpdate;

  const AddSpareparts({super.key, this.isUpdate = false});

  @override
  State<AddSpareparts> createState() => _AddSparepartsState();
}

class _AddSparepartsState extends State<AddSpareparts> {
  HomeController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  SparepartsController sparepartsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          // action: [
          //   Padding(
          //       padding: const EdgeInsets.only(right: 10),
          //       child: IconButton(
          //           onPressed: () {
          //             Get.to(const ViewSparepartsDetails());
          //           },
          //           icon: const Icon(
          //             Icons.add,
          //           )))
          // ],
          title: widget.isUpdate
              ? "Update Import Spareparts "
              : "Add Import Spareparts",
          onPressed: () {
            Get.back();
          },
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                CustomTextField(
                  textEditingController:
                      sparepartsController.nameTextEditingController,
                  hintText: "Steel Bolt",
                  labelText: "Name*",
                  focusNode: sparepartsController.sparepartsNameFocusNode,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Name";
                    } else {
                      return null;
                    }
                  },
                ),
                if (widget.isUpdate) ...[
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Add Qty",
                        style: AppTextStyle.textStyleRegular18,
                      ),
                      IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // the '2023' part
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            size: 24,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomTextField(
                    hintText: "10",
                    labelText: "Qty",
                    textEditingController:
                        sparepartsController.qtyTypeTextEditingController,
                    focusNode: sparepartsController.sparepartsQtyFocusNode,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomTextField(
                    hintText: "New Qty",
                    labelText: "Add New Qty",
                    focusNode: controller.sparepartsNewQtyFocusNode,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Total Qty : 30",
                        style: AppTextStyle.textStyleLight14
                            .copyWith(color: AppColor.dropDownHintColor),
                      )),
                      OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            side: const BorderSide(
                              color: AppColor.borderColor,
                            ),
                          )),
                        ),
                        child: Text(
                          "Update",
                          style: AppTextStyle.textStyleLight14
                              .copyWith(color: AppColor.selectColor),
                        ),
                      )
                    ],
                  ),
                ] else ...[
                  verticalSpacing(),
                  CustomTextField(
                    textEditingController:
                        sparepartsController.qtyTypeTextEditingController,
                    hintText: "Qty",
                    labelText: "Qty",
                    textInputType: TextInputType.number,
                    focusNode: sparepartsController.sparepartsQtyFocusNode,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Qty";
                      } else {
                        return null;
                      }
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: widget.isUpdate ? 'Update' : 'Add',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                Get.back();
              }
              sparepartsController.addSpareparts();
              // Get.back();
            },
          ),
        ));
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }
}
