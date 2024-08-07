import 'dart:convert';
import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class AddCustomer extends StatefulWidget {
  final bool isUpdate;
  final bool isView;
  String name;


  final dynamic model;


   AddCustomer(
      {super.key, this.isUpdate = false, this.isView = false, this.model,required this.name});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  CustomerController controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // controller.updateCustomer(widget.model['id']);
    if (widget.model != null) {
      controller.companyTextEditingController.text =
          widget.model['company'] ?? '';
      controller.contactTextEditingController.text =
          widget.model['contact'] ?? '';
      controller.referenceTextEditingController.text =
          widget.model['reference'] ?? '';
      controller.ownerTextEditingController.text = widget.model['owner'] ?? '';
      controller.addressTextEditingController.text =
          widget.model['address'] ?? '';
      controller.websiteTextEditingController.text =
          widget.model['website'] ?? '';
      controller.gstinTextEditingController.text = widget.model['gstin'] ?? '';
      controller.base64Image = widget.model['photo'] ?? '';
    } else {
      controller.companyTextEditingController.clear();
      controller.contactTextEditingController.clear();
      controller.referenceTextEditingController.clear();
      controller.ownerTextEditingController.clear();
      controller.addressTextEditingController.clear();
      controller.websiteTextEditingController.clear();
      controller.gstinTextEditingController.clear();
      controller.base64Image = "";
      controller.imgFile = null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: widget.isView
              ? widget.name
              : widget.model != null
                  ? "Update Customer/Company Details"
                  : "Add Customer/Company",
          onPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: widget.isView ? viewOnly() : addEdit(),
        ),
        bottomNavigationBar: widget.isView
            ? const SizedBox.shrink()
            : Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CustomButton(
                  color: AppColor.buttonColor,
                  isLoading: controller.isCustomerLoading,
                  buttonText: widget.model != null ? 'Update' : 'Add',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.model != null) {
                        controller.updateCustomer(widget.model['id']);
                      } else {
                        controller.addCustomer();
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

  Widget addEdit() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   widget.model != null || widget.isView
                //       ? 'Profile :'
                //       : 'Add Profile :',
                //   style: AppTextStyle.textStyleRegular16
                //       .copyWith(color: AppColor.blackLightColor),
                // ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      widget.model != null
                          ? controller.imgFile == null
                              ? SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(60.0),
                                    child: Image.memory(
                                      base64Decode(controller.base64Image),
                                      fit: BoxFit.cover,
                                      height: 120,
                                      width: 120,
                                    ),
                                  ),
                                )
                              : SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.file(
                                        controller.imgFile!,
                                        // controller.imgFile!,
                                        fit: BoxFit.cover,
                                      )))
                          : controller.imgFile == null
                              ? Image.asset(
                                  'assets/images/camera.png',
                                  height: 120,
                                  width: 120,
                                )
                              : SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.file(
                                        controller.imgFile!,
                                        // controller.imgFile!,
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
                CustomTextField(
                  textEditingController:
                      controller.companyTextEditingController,
                  textCapitalization: TextCapitalization.words,
                  hintText: "Enter Company",
                  labelText: "Company",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Company*";
                    } else {
                      return null;
                    }
                  },
                ),
                verticalSpacing(),
                CustomTextField(
                  textEditingController: controller.ownerTextEditingController,
                  hintText: "Enter Owner Name",
                  labelText: "Owner Name",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Owner Name";
                    } else {
                      return null;
                    }
                  },
                ),
                verticalSpacing(),
                CustomTextField(
                  textEditingController:
                      controller.contactTextEditingController,
                  maxLength: 10,
                  hintText: "99656 25693",
                  labelText: "Contact No",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Contact No";
                    } else {
                      return null;
                    }
                  },
                  textInputType: const TextInputType.numberWithOptions(),
                  suffixFixIcon:  widget.isView
                      ?  const Icon(
                    Icons.phone,
                    size: 20,
                  )
                      : const SizedBox.shrink(),
                  ),
                verticalSpacing(),
                CustomTextField(
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  textEditingController:
                      controller.addressTextEditingController,
                  hintText: "Enter Address",
                  labelText: "Address",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Address";
                    } else {
                      return null;
                    }
                  },
                  suffixFixIcon: widget.isView
                      ? const Icon(
                    color: Colors.black,
                          Icons.location_on_outlined,
                          size: 20,
                        )
                      : const SizedBox.shrink(),
                ),
                verticalSpacing(),
                CustomTextField(
                  textEditingController:
                      controller.websiteTextEditingController,
                  hintText: "www.machinepro.com",
                  labelText: "Website",
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Enter Website";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                  suffixFixIcon:widget.isView
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
                CustomTextField(
                  textEditingController:
                      controller.referenceTextEditingController,
                  hintText: "L & T Pvt",
                  labelText: "Reference By",
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Enter Reference";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
                verticalSpacing(),
                CustomTextField(
                  textInputType: TextInputType.number,
                  textEditingController: controller.gstinTextEditingController,
                  hintText: "GD5456892098",
                  labelText: "GST No",
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return "Enter GST No";
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget viewOnly() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Profile :',
              //   style: AppTextStyle.textStyleRegular16
              //       .copyWith(color: AppColor.blackLightColor),
              // ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: widget.model['photo'] == ""
                    ? Image.asset(
                        'assets/images/user_profile.png',
                        height: 120,
                        width: 120,
                      )
                    : SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60.0),
                          child: Image.memory(
                            base64Decode(controller.base64Image),
                            fit: BoxFit.cover,
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
              ),
              verticalSpacing(),
              CustomTextField(
                textEditingController: controller.companyTextEditingController,
                labelText: "Company",
                enable: false,
              ),
              verticalSpacing(),
              CustomTextField(
                textEditingController: controller.ownerTextEditingController,
                labelText: "Owner Name",
                enable: false,
              ),
              verticalSpacing(),
              // Stack(
              //   alignment: Alignment.centerRight,
              //   children: [
              //     InkWell(
              //       child: const Icon(
              //         Icons.phone,
              //         size: 20,
              //         color: AppColor.blackColor,
              //       ),
              //       onTap: (){
              //         controller.makePhoneCall("7359085239");
              //
              //       },
              //     ),
              //     CustomTextField(
              //         textEditingController:
              //         controller.contactTextEditingController,
              //         labelText: "Contact No",
              //         // enable: false,
              //         // suffixFixIcon: InkWell(
              //         //   child: const Icon(
              //         //     Icons.phone,
              //         //     size: 20,
              //         //     color: AppColor.blackColor,
              //         //   ),
              //         //   onTap: (){
              //         //     controller.makePhoneCall("7359085239");
              //         //
              //         //   },
              //         // ),
              //     ),
              //   ],
              // ),
              CustomTextField(
                  textEditingController:
                      controller.contactTextEditingController,
                  labelText: "Contact No",
                  // enable: false,
                  suffixFixIcon: InkWell(
                    child: const Icon(
                      Icons.phone,
                      size: 20,
                      color: AppColor.blackColor,
                    ),
                    onTap: (){
                      controller.makePhoneCall("7359085239");

                    },
                  )),
              verticalSpacing(),
              CustomTextField(
                textEditingController: controller.addressTextEditingController,
                labelText: "Address",
                // enable: false,
                suffixFixIcon: InkWell(
                  child: const Icon(
                    color: Colors.black,
                    Icons.location_on_outlined,
                    size: 20,
                  ),
                  onTap: (){
                    controller.launchMap();
                  },
                )
              ),

              verticalSpacing(),
              CustomTextField(
                  textEditingController:
                      controller.websiteTextEditingController,
                  labelText: "Website",
                  // enable: false,
                  suffixFixIcon: InkWell(
                    onTap: (){
                    controller.webURL();
                  },
                    child: Container(
                      padding: const EdgeInsets.all(14.0),
                      child: Image.asset(
                        "assets/images/world_wide_web.png",
                        height: 16,
                        width: 5,
                        fit: BoxFit.cover,
                        color: AppColor.blackColor,
                      ),
                    ),
                  )
              ),
              verticalSpacing(),
              CustomTextField(
                textEditingController: controller.referenceTextEditingController,
                labelText: "Reference By",
                enable: false,
              ),
              verticalSpacing(),
              CustomTextField(
                  enable: false,
                  textEditingController: controller.gstinTextEditingController,
                  labelText: "GST No"),
              verticalSpacing(),
            ],
          ),
        ),
      ],
    );
  }
}
