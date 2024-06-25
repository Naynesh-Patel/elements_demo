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

  String dropdownvalue = 'User';
  String? selectLevel;
  var items = [
    'Admin',
    'User',
    'Seller',
  ];

  SalesmenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Add Salesmen',
          onPressed: () {
            Get.back();
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                        bool refresh = await controller.pickImageFromGallery();
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
                itemList: const ["Admin", "Usre", "Seller"],
                onTap: (value) {
                  debugPrint("Select => $value");
                },
              ),
              verticalSpacing(),
              const CustomTextField(
                hintText: "worker",
                labelText: "Work Type*",
              ),
              verticalSpacing(),
              const CustomTextField(
                hintText: "Dipesh Patel",
                labelText: "Name*",
              ),
              verticalSpacing(),
              const CustomTextField(
                hintText: "Name",
                labelText: "Contact No.",
              ),
              verticalSpacing(),
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

  void setLevelValue(String value) {
    selectLevel = value;
  }
}
