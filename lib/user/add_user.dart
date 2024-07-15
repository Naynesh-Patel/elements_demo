import 'dart:convert';

import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUser extends StatefulWidget {
  final bool isUpdate;
  final dynamic model;
  const AddUser({super.key, this.isUpdate = false, this.model});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool value = false;
  int index = 0;

  UserController controller = Get.find();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    if (widget.model != null) {
      controller.userRoleTextEditingController.text =
          widget.model['user_type'] ?? '';
      controller.userNameTextEditingController.text =
          widget.model['name'] ?? '';
      controller.addressTextEditingController.text =
          widget.model['address'] ?? '';
      controller.contactNoTextEditingController.text =
          widget.model['contact_no'] ?? '';
      controller.fingerprintEditingController.text =
          widget.model['fingerprint'] ?? '';
      controller.base64Image = widget.model['photo'] ?? '';
    } else {
      controller.userRoleTextEditingController.clear();
      controller.userNameTextEditingController.clear();
      controller.addressTextEditingController.clear();
      controller.contactNoTextEditingController.clear();
      controller.fingerprintEditingController.clear();
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
          title: widget.model != null ? "Update User Details" : "Add User",
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
                              ? controller.imgFile == null
                                  ? SizedBox(
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
                                  size: 18,
                                )),
                          )
                        ],
                      ),
                    ),
                    verticalSpacing(),
                    WidgetDropDownFromField(
                      hintText: "Select User Role",
                      labelText: "User Role",
                      itemList: const ["Admin", "User", "Seller"],
                      value: controller.userRoleTextEditingController.text,
                      // autovalidateMode: AutovalidateMode.onUserInteraction,
                      onTap: (value) {
                        controller.userRoleTextEditingController.text = value;
                        _formKey.currentState?.validate();
                        debugPrint("Select => $value");
                        _formKey.currentState?.validate();
                      },
                    ),
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
                        // validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return "Please Enter Fingerprint";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                    ),
                    verticalSpacing(),
                    // DropdownButtonFormField<String>(
                    //   isExpanded: true,
                    //
                    //   items: [
                    //     DropdownMenuItem(child: Text('Jack'),value: 'Jack',),
                    //     DropdownMenuItem(child: Text('Jay'),value: 'Jay',),
                    //     DropdownMenuItem(child: Text('Femil'),value: 'Femil',),
                    //     DropdownMenuItem(child: Text('Nehal'),value: 'Nehal',),
                    //   ],
                    //   onChanged: (value) {},
                    //
                    //   decoration: InputDecoration(
                    //     labelText: 'Naam',
                    //       floatingLabelBehavior: FloatingLabelBehavior.always,
                    //       labelStyle: TextStyle(
                    //         color: Colors.black
                    //       ),
                    //       hintText: 'User',
                    //       hintStyle: TextStyle(
                    //         color: Colors.grey
                    //       ),
                    //       contentPadding:
                    //       EdgeInsets.symmetric(vertical: 0.0, horizontal: 20),
                    //     errorBorder: OutlineInputBorder(
                    //         borderSide: const BorderSide(width: 1,color: Colors.red),
                    //         borderRadius: BorderRadius.circular(10)),
                    //     border: OutlineInputBorder(
                    //       borderSide: BorderSide(color: AppColor.borderColor),
                    //         // borderSide: BorderSide.none,
                    //         borderRadius: BorderRadius.all(Radius.circular(6.0))
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: AppColor.borderColor),
                    //         // borderSide: BorderSide.none,
                    //         borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: AppColor.borderColor),
                    //         // borderSide: BorderSide.none,
                    //         borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Select some role';
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
