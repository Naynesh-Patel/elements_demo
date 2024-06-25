import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddImportSpareparts extends StatefulWidget {
  final bool isUpdate;
  const AddImportSpareparts({
    super.key,
    this.isUpdate = false,
  });

  @override
  State<AddImportSpareparts> createState() => _AddImportSparepartsState();
}

class _AddImportSparepartsState extends State<AddImportSpareparts> {
  bool value = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: widget.isUpdate
              ? "Update Import Spareparts "
              : "Add Import Spareparts",
          onPressed: () {
            Get.back();
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              const CustomTextField(
                hintText: "Tata steel Pvt",
                labelText: "Company Name*",
              ),
              verticalSpacing(),
              const CustomTextField(
                hintText: "Steel Bolt",
                labelText: "Spareparts Name*",
              ),
              verticalSpacing(),
              const CustomTextField(
                hintText: "20",
                labelText: "Qty*",
              ),
              verticalSpacing(),
              const CustomTextField(
                hintText: "Medium",
                labelText: "Type*",
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: widget.isUpdate ? 'Update' : 'Add',
            onTap: () {},
          ),
        ));
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }
}
