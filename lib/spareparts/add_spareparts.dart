import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSpareparts extends StatefulWidget {
  const AddSpareparts({super.key});

  @override
  State<AddSpareparts> createState() => _AddSparepartsState();
}

class _AddSparepartsState extends State<AddSpareparts> {
  bool value = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9F9),
          title: Text(
            "Add Spareparts",
             style: AppTextStyle.textStyleRegular20
          ),
          leading:IconButton(
            icon: Icon(Icons.arrow_back_ios_new,size: 24,),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 24,
                ))
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: const Column(
            children: [
              CustomTextField(
                hintText: "Steel Bolt",
                labelText: "Name*",
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "10",
                labelText: "Qty",
              ),
              SizedBox(
                height: 20,
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
