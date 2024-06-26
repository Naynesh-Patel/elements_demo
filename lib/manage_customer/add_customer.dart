import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomer extends StatefulWidget {
  final bool isUpdate;
  final bool isView;
  const AddCustomer({super.key, this.isUpdate = false, this.isView = false});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  CustomerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: widget.isUpdate
              ? "Update Customer/Company Details"
              : widget.isView
                  ? "View Customer/Company Details"
                  : "Add Customer/Company",
          onPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.isUpdate || widget.isView
                          ? 'Profile :'
                          : 'Add Profile :',
                      style: AppTextStyle.textStyleRegular16
                          .copyWith(color: AppColor.blackLightColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          controller.imgFile == null
                              ? Image.asset(
                                  'assets/images/camera.png',
                                  height: 80,
                                  width: 80,
                                )
                              : SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.file(
                                        controller.imgFile!,
                                        fit: BoxFit.cover,
                                      ))),
                          InkWell(
                            onTap: () async {
                              bool refresh =
                                  await controller.pickImageFromGallery();
                              if (refresh) {
                                setState(() {});
                              }
                            },
                            child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: const Color(0xff01959F),
                                    // shape: BoxShape.circle,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                )),
                          )
                        ],
                      ),
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "Enter Company",
                      labelText: "Company*",
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "Enter Owner Name",
                      labelText: "Owner Name*",
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      hintText: "99656 25693",
                      labelText: "Contact No.*",
                      suffixFixIcon: widget.isView
                          ? const Icon(
                              Icons.phone,
                              size: 20,
                            )
                          : const SizedBox.shrink(),
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      hintText: "Enter Address",
                      labelText: "Address",
                      suffixFixIcon: widget.isView
                          ? const Icon(
                              Icons.location_on_outlined,
                              size: 20,
                            )
                          : SizedBox.shrink(),
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      hintText: "www.machinepro.com",
                      labelText: "Website",
                      suffixFixIcon: widget.isView
                          ? Container(
                              padding: const EdgeInsets.all(14.0),
                              child: Image.asset(
                                "assets/images/world_wide_web.png",
                                height: 16,
                                width: 5,
                                fit: BoxFit.cover,
                                color: AppColor.blackColor,
                              ))
                          : const SizedBox.shrink(),
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "L & T Pvt",
                      labelText: "Reference By",
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "GD5456892098",
                      labelText: "GST No.",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: widget.isView
            ? const SizedBox.shrink()
            : Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CustomButton(
                  color: AppColor.buttonColor,
                  buttonText: widget.isUpdate ? 'Update' : 'Add',
                  onTap: () {
                    Get.back();
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
