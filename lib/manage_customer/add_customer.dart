import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9F9),
          title: const Text(
            "r/Company",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
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
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
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
                  const CustomTextField(
                    hintText: "Enter Company",
                    labelText: "Company*",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hintText: "Enter Owner Name",
                    labelText: "Owner Name*",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hintText: "99656 25693",
                    labelText: "Contact No.*",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hintText: "Enter Address",
                    labelText: "Address",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hintText: "www.machinepro.com",
                    labelText: "Website",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hintText: "L & T Pvt",
                    labelText: "Reference By",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hintText: "GD5456892098",
                    labelText: "GST No.",
                  ),
                ],
              ),
            ),
          ],
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
