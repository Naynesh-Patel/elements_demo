import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddImportSpareparts extends StatefulWidget {
  const AddImportSpareparts({super.key});

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
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9F9),
          title: const Text(
            "Add Import Spareparts",
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
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 25,
                ))
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: const Column(
            children: [
              CustomTextField(
                hintText: "Tata steel Pvt",
                labelText: "Company Name*",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Steel Bolt",
                labelText: "Spareparts Name*",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "20",
                labelText: "Qty*",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
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
            buttonText: 'Add',
            onTap: () {},
          ),
        ));
  }
}
