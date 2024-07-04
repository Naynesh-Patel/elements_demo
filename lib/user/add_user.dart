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
  const AddUser({super.key, this.isUpdate = false});

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
                        debugPrint("Select => $value");
                      },
                      validator: (value) => value == null ? 'field required' : null,


                    ),
                    verticalSpacing(),
                    CustomTextField(
                      hintText: "Name",
                      labelText: "User Name",
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter User Name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      textInputType: const TextInputType.numberWithOptions(),
                      hintText: "99656 25693",
                      labelText: "Contact No.",
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
                    CustomTextField(
                      hintText: "Upload Fingerprint",
                      labelText: "Upload Fingerprint",
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Fingerprint";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacing(),


                    // Padding(
                    //   padding: const EdgeInsets.symmetric(vertical: 20),
                    //   child: Container(
                    //     height: 60,
                    //     width: double.maxFinite,
                    //     decoration: BoxDecoration(
                    //       borderRadius: const BorderRadius.all(Radius.circular(5)),
                    //       border: Border.all(color: AppColor.borderColor),
                    //     ),
                    //     child: DropdownButtonFormField<String>(
                    //       onChanged: (value) {
                    //
                    //       },
                    //       items: [
                    //         DropdownMenuItem(child:Text('Jay'),value: 'Jay',),
                    //         DropdownMenuItem(child:Text('jack'),value: 'jack',),
                    //         DropdownMenuItem(child:Text('j'),value: 'j',),
                    //         DropdownMenuItem(child:Text('a'),value: 'a',),
                    //       ],
                    //       hint: Text('Name '),
                    //
                    //       decoration: InputDecoration(
                    //         border: InputBorder.none,
                    //         contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    //         errorBorder: OutlineInputBorder(gapPadding: CircularProgressIndicator.strokeAlignCenter,
                    //             borderSide: const BorderSide(color: Colors.red),
                    //             borderRadius: BorderRadius.circular(10)),
                    //
                    //       ),
                    //
                    //       validator: (value) {
                    //         if (value == null || value.isEmpty) {
                    //           return 'Select some role';
                    //         } else {
                    //           return null;
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // )

                    // Positioned(
                    //  top: 0,
                    //   bottom: 0,
                    //   left: 0,
                    //   right: 0,
                    //   child: DropdownButtonFormField<String>(
                    //     onChanged: (value) {
                    //
                    //     },
                    //     items: [
                    //       DropdownMenuItem(child:Text('Jay'),value: 'Jay',),
                    //       DropdownMenuItem(child:Text('jack'),value: 'jack',),
                    //       DropdownMenuItem(child:Text('j'),value: 'j',),
                    //       DropdownMenuItem(child:Text('a'),value: 'a',),
                    //     ],
                    //     hint: Text('Name '),
                    //
                    //     decoration: InputDecoration(
                    //       labelText: 'Naam',labelStyle: TextStyle(
                    //         color: AppColor.blackColor
                    //     ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: AppColor.borderColor),
                    //           // borderSide: BorderSide.none,
                    //           borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    //       border: OutlineInputBorder(
                    //         borderSide: BorderSide(color: AppColor.borderColor)
                    //
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: AppColor.borderColor),
                    //         //   borderSide: BorderSide.none,
                    //           borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    //       contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    //       errorBorder: OutlineInputBorder(gapPadding: CircularProgressIndicator.strokeAlignCenter,
                    //           borderSide: const BorderSide(color: Colors.red),
                    //           borderRadius: BorderRadius.circular(10)),
                    //
                    //     ),
                    //     autovalidateMode: AutovalidateMode.onUserInteraction,
                    //     validator: (value) {
                    //       if (value == null || value.isEmpty) {
                    //         return 'Select some role';
                    //       } else {
                    //         return null;
                    //       }
                    //     },
                    //   ),
                    // ),


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
                Get.back();
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
