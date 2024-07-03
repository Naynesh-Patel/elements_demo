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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: widget.isUpdate ? "Update User Details" : "Add User",
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    WidgetDropDownFromField(
                      hintText: "Select User Role",
                      labelText: "User Role",
                      itemList: const ["Admin", "User", "Seller"],
                      onTap: (value) {
                        controller.userRoleTextEditingController.text = value;
                        debugPrint("Select => $value");
                      },
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      textEditingController:
                          controller.userNameTextEditingController,
                      hintText: "Name",
                      labelText: "User Name",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter User Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      textEditingController:
                          controller.contactNoTextEditingController,
                      textInputType: const TextInputType.numberWithOptions(),
                      hintText: "99656 25693",
                      labelText: "Contact No.",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Contact No";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      textEditingController:
                          controller.addressTextEditingController,
                      hintText: "Surat,Gujrat",
                      labelText: "Address",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Address";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      textEditingController:
                          controller.fingerprintEditingController,
                      hintText: "Upload Fingerprint",
                      labelText: "Upload Fingerprint",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Fingerprint";
                        } else {
                          return null;
                        }
                      },
                    ),
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
            buttonText: 'Add',
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
