import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/salesmen_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSalesmen extends StatefulWidget {
  final bool isUpdate;

  const AddSalesmen({super.key, this.isUpdate = false});

  @override
  State<AddSalesmen> createState() => _AddSalesmenState();
}

class _AddSalesmenState extends State<AddSalesmen> {
  bool value = false;
  int index = 0;

  String? selectLevel;
  final _formKey = GlobalKey<FormState>();
  SalesmenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: widget.isUpdate ? 'Update Salesmen' : 'Add Salesmen',
          onPressed: () {
            Get.back();
          },
        ),
        body: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                    // validator: (value) {
                    //   if(value!.isEmpty){
                    //     return "Enter Qty*";
                    //   }
                    //   else{
                    //     return null;
                    //   }
                    // },
                    hintText: "Select User Role",
                    labelText: "User Role",
                    itemList: const ["Admin", "User", "Seller"],
                    onTap: (value) {
                      debugPrint("Select => $value");
                    },
                  ),
                  verticalSpacing(),
                  CustomTextField(
                    textEditingController:
                        controller.workerTextEditingController,
                    hintText: "worker",
                    labelText: "Work Type",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Work Type";
                      } else {
                        return null;
                      }
                    },
                  ),
                  verticalSpacing(),
                  CustomTextField(
                    textEditingController:
                        controller.salesmenNameTextEditingController,
                    hintText: "Dipesh Patel",
                    labelText: "Name",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Name";
                      } else {
                        return null;
                      }
                    },
                  ),
                  verticalSpacing(),
                  CustomTextField(
                    textInputType: const TextInputType.numberWithOptions(),
                    textEditingController:
                        controller.contactNoTextEditingController,
                    hintText: "Name",
                    labelText: "Contact No.",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Contact No.*";
                      } else {
                        return null;
                      }
                    },
                  ),
                  verticalSpacing(),
                  CustomTextField(
                    hintText: "Address",
                    labelText: "Address",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: "Fingerprint",
                    labelText: "Fingerprint",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Fingerprint";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            isLoading: false.obs,
            buttonText: widget.isUpdate ? 'Update' : 'Add',
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

  void setLevelValue(String value) {
    selectLevel = value;
  }
}
