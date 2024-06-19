import 'package:elements/constant/app_colors.dart';
import 'package:elements/salsemen/salesmen_view_detail.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSalesmen extends StatefulWidget {
  const AddSalesmen({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9F9),
          title: const Text(
            "Add Salesmen",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(const SalsemenViewDetils());
                },
                icon: const Icon(
                  Icons.add,
                  size: 25,
                ))
          ],
        ),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Add Profile :',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff555555)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Image.asset(
                            'assets/images/camera.png',
                            height: 80,
                            width: 80,
                          ),
                          Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: const Color(0xff01959F),
                                  // shape: BoxShape.circle,
                                  borderRadius: BorderRadius.circular(15)),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 18,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    WidgetDropDownFromField(
                      hintText: "User Role",
                      itemList: const ["Admin", "Usre", "Seller"],
                      onTap: (value) {
                        debugPrint("Select => $value");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextField(
                      hintText: "worker",
                      labelText: "Work Type*",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextField(
                      hintText: "Dipesh Patel",
                      labelText: "Name*",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTextField(
                      hintText: "Name",
                      labelText: "Contact No.",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            )),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Add',
            onTap: () {},
          ),
        ));
  }

  void setLevelValue(String value) {
    selectLevel = value;
  }
}
