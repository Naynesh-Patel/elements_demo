import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSpareparts extends StatefulWidget {
  final dynamic model;

  const AddSpareparts({
    super.key,
    this.model,
  });

  @override
  State<AddSpareparts> createState() => _AddSparepartsState();
}

class _AddSparepartsState extends State<AddSpareparts> {
  HomeController controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  SparepartsController sparepartsController = Get.find();
  int totalCount = 0;
  int sum = 0;

  void incrementSum() {
    setState(() {
      sum++;
    });
  }

  void decrementSum() {
    setState(() {
      sum--;
    });
  }

  @override
  void initState() {
    if (widget.model != null) {
      sparepartsController.nameTextEditingController.text =
          widget.model['name'] ?? '';
      sparepartsController.qtyTypeTextEditingController.text =
          widget.model['qty'] ?? '';
      sparepartsController.totalQtyTextEditingController.text =
          widget.model['qty'] ?? '';
    } else {
      sparepartsController.nameTextEditingController.clear();
      sparepartsController.qtyTypeTextEditingController.clear();
      sparepartsController.totalQtyTextEditingController.clear();
    }
    super.initState();
  }

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
          title: widget.model != null
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
                      return "Please Enter Name";
                    } else {
                      return null;
                    }
                  },
                ),
                if (widget.model != null) ...[
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
                      // IconButton(
                      //     padding: EdgeInsets.zero,
                      //     constraints: const BoxConstraints(),
                      //     style: const ButtonStyle(
                      //       tapTargetSize: MaterialTapTargetSize
                      //           .shrinkWrap, // the '2023' part
                      //     ),
                      //     onPressed: () {},
                      //     icon: const Icon(
                      //       Icons.add,
                      //       size: 24,
                      //     )),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomTextField(
                    hintText: "10",
                    labelText: "Qty",
                    enable: false,
                    textEditingController:
                        sparepartsController.qtyTypeTextEditingController,
                    focusNode: sparepartsController.sparepartsQtyFocusNode,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomTextField(
                    textInputType: TextInputType.number,
                    textEditingController:
                        sparepartsController.newqtyTypeTextEditingController,
                    hintText: "New Qty",
                    labelText: "Add New Qty",
                    onChange: (p0) {
                      if (p0.isEmpty) {
                        total(int.parse("0"));
                      } else {
                        total(int.parse(p0));
                      }
                    },
                    focusNode: controller.sparepartsNewQtyFocusNode,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Total Qty : ",
                        style: AppTextStyle.textStyleLight14
                            .copyWith(color: AppColor.dropDownHintColor),
                      ),
                      Expanded(
                          child: Text(
                        sparepartsController.totalQtyTextEditingController.text,
                        style: AppTextStyle.textStyleLight14
                            .copyWith(color: AppColor.dropDownHintColor),
                      )),
                      // OutlinedButton(
                      //   onPressed: () {},
                      //   style: ButtonStyle(
                      //     shape:
                      //         MaterialStateProperty.all(RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(4.0),
                      //       side: const BorderSide(
                      //         color: AppColor.borderColor,
                      //       ),
                      //     )),
                      //   ),
                      //   child: Text(
                      //     "Update",
                      //     style: AppTextStyle.textStyleLight14
                      //         .copyWith(color: AppColor.selectColor),
                      //   ),
                      // ),
                    ],
                  ),
                ] else ...[
                  verticalSpacing(),
                  CustomTextField(
                    textEditingController:
                        sparepartsController.qtyTypeTextEditingController,
                    hintText: "Qty",
                    labelText: "Qty",
                    // enable: false,
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
            buttonText: widget.model != null ? 'Update' : 'Add',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                if (widget.model != null) {
                  sparepartsController.updateSpareparts(widget.model['id']);
                } else {
                  sparepartsController.addSpareparts();
                }
              }
            },
          ),
        ));
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }

  total(int value) {
    sparepartsController.totalQtyTextEditingController.text =
        (int.parse(sparepartsController.qtyTypeTextEditingController.text) +
                value)
            .toString();
    setState(() {});
  }
}
