import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/manage_customer/customer_view_detail.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
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
        appBar:CustomAppBar(
          title: "Add Customer/Company",
          onPressed:() {
           Get.back();
          },
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'Add Profile :',
                      style: AppTextStyle.textStyleRegular16,
                    ),
                    const SizedBox(
                      height: 20,
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
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "Enter Company",
                      labelText: "Company*",
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "Enter Owner Name",
                      labelText: "Owner Name*",
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "99656 25693",
                      labelText: "Contact No.*",
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "Enter Address",
                      labelText: "Address",
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "www.machinepro.com",
                      labelText: "Website",
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "L & T Pvt",
                      labelText: "Reference By",
                    ),
                    verticalSpacing(),
                    const CustomTextField(
                      hintText: "GD5456892098",
                      labelText: "GST No.",
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
            onTap: () {},
          ),
        ));
  }

  Widget verticalSpacing(){
    return const SizedBox(height: 26.0,);
  }

}
