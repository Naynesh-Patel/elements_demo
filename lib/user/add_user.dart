import 'dart:convert';

import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/company_controller.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/user/select_company.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUser extends StatefulWidget {
  final bool isUpdate;
  final dynamic model;
  final bool isView;

  const AddUser(
      {super.key, this.isUpdate = false, this.model, this.isView = false});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool value = false;
  int index = 0;

  UserController controller = Get.find();
  CompanyController companyController = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.model != null) {
      controller.usersRoleTextEditingController.text =
          widget.model['user_type'] ?? '';
      controller.userNameTextEditingController.text =
          widget.model['name'] ?? '';
      controller.addressTextEditingController.text =
          widget.model['address'] ?? '';
      controller.contactNoTextEditingController.text =
          widget.model['contact_no'] ?? '';
      controller.fingerprintEditingController.text =
          widget.model['fingerprint'] ?? '';
      companyController.selectCompanyTextEditingController.text =
          widget.model['name'] ?? '';
      controller.base64Image = widget.model['photo'] ?? '';
    } else {
      controller.usersRoleTextEditingController.clear();
      controller.userNameTextEditingController.clear();
      controller.addressTextEditingController.clear();
      controller.contactNoTextEditingController.clear();
      controller.fingerprintEditingController.clear();
      companyController.selectCompanyTextEditingController.clear();
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
          onPressed: () {
            Get.back();
          },
          title: widget.isView
              ? "User View Deatils"
              : widget.model != null
                  ? "Update User Details"
                  : "Add User",
        ),
        body: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Add Profile :',
                      style: AppTextStyle.textStyleRegular16
                          .copyWith(color: AppColor.blackLightColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          widget.model != null
                              ? controller.imgFile == null ? controller.base64Image == "" ?Image.asset(
                        'assets/images/user_profile.png',color: Colors.black54,
                        height: 80,
                        width: 80,
                      ) :
                                  SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.memory(
                                          base64Decode(controller.base64Image),
                                          fit: BoxFit.cover,
                                          height: 80,
                                          width: 80,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: Image.file(
                                            controller.imgFile!,
                                            // controller.imgFile!,
                                            fit: BoxFit.cover,
                                          )))
                              : controller.imgFile == null
                                  ? Image.asset(
                                      'assets/images/camera.png',
                                      height: 80,
                                      width: 80,
                                    )
                                  : SizedBox(
                                      height: 80,
                                      width: 80,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
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
                                    // shape: BoxShape.circle,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                    verticalSpacing(),
                    WidgetDropDownFromField(
                      hintText: "Select User Role",
                      labelText: "User Role",
                      itemList: const ["Salesman", "Worker", "Manger"],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onTap: (value) {
                        controller.usersRoleTextEditingController.text = value;
                        _formKey.currentState?.validate();
                        debugPrint("Select => $value");
                        _formKey.currentState?.validate();
                      },
                    ),
                    verticalSpacing(),
                    CustomTextField(
                        // focusNode: FocusNode(),
                        // readOnly: true,
                        onTap: () {
                          Get.to(const SelectCompany());
                        },
                        hintText: "Select Company",
                        textEditingController: companyController
                            .selectCompanyTextEditingController,
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Company";
                          } else {
                            return null;
                          }
                        },
                        suffixFixIcon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                        )),
                    verticalSpacing(),
                    CustomTextField(
                      textEditingController:
                          controller.userNameTextEditingController,
                      hintText: "Name",
                      labelText: "User Name",
                      textCapitalization: TextCapitalization.words,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter User Name";
                        } else {
                          return null;
                        }
                      },
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      textEditingController:
                          controller.contactNoTextEditingController,
                      textInputType: const TextInputType.numberWithOptions(),
                      textCapitalization: TextCapitalization.words,
                      hintText: "99656 25693",
                      labelText: "Contact No.",
                      maxLength: 10,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Contact No";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      textEditingController:
                          controller.addressTextEditingController,
                      textCapitalization: TextCapitalization.words,
                      hintText: "Surat,Gujrat",
                      labelText: "Address",
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacing(),
                    InkWell(
                      onTap: () {
                        controller.getFingerPrint();
                      },
                      child: CustomTextField(
                        textEditingController:
                            controller.fingerprintEditingController,
                        hintText: "Upload Fingerprint",
                        labelText: "Upload Fingerprint",
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        textCapitalization: TextCapitalization.words,
                        enable: false,
                      ),
                    ),
                    verticalSpacing(),
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
                  isLoading: controller.isUserLoading,
                  buttonText: widget.model != null ? 'Update' : 'Add',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.model != null) {
                        controller.updateUser(widget.model['id']);
                      } else {
                        controller.addUser();
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
}
