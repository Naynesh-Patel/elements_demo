import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
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
                hintText: "Select User Role",
                labelText: "User Role",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Name",
                labelText: "Contact No.",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "99656 25693",
                labelText: "Contact No.",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Surat,Gujrat",
                labelText: "Address",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Upload Fingerprint",
                labelText: "Upload Fingerprint",
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
