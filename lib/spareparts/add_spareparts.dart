import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/spareparts/spareparts_details.dart';
import 'package:elements/widget/custom_appbar.dart';
import 'package:elements/widget/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSpareparts extends StatefulWidget {
  final bool isUpdate;

  const AddSpareparts({super.key, this.isUpdate = false});

  @override
  State<AddSpareparts> createState() => _AddSparepartsState();
}

class _AddSparepartsState extends State<AddSpareparts> {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          action: [
            Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {
                      Get.to(const SparepartsDetails());
                    },
                    icon: const Icon(
                      Icons.add,
                    )))
          ],
          title: widget.isUpdate
              ? "Update Spareparts Details"
              : "Add Import Spareparts",
          onPressed: () {
            Get.back();
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              CustomTextField(
                hintText: "Steel Bolt",
                labelText: "Name*",
                focusNode: controller.sparepartsNameFocusNode,
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
                  textEditingController: TextEditingController(text: "10"),
                  focusNode: controller.sparepartsQtyFocusNode,
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
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
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
                const SizedBox(
                  height: 16.0,
                ),
                CustomTextField(
                  hintText: "Qty",
                  labelText: "Qty",
                  focusNode: controller.sparepartsQtyFocusNode,
                ),
              ],
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Add',
            onTap: () {},
          ),
        ));
  }
}
