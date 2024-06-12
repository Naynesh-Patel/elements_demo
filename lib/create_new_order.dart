import 'package:elements/constant/app_colors.dart';
import 'package:flutter/material.dart';

import 'widget/custom_button.dart';
import 'widget/custom_text_field.dart';

class CreateNewOrder extends StatefulWidget {
  const CreateNewOrder({super.key});

  @override
  State<CreateNewOrder> createState() => _CreateNewOrderState();
}

class _CreateNewOrderState extends State<CreateNewOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9F9),
          title: const Text(
            "Create New Order",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          leading: InkWell(
              onTap: () {}, child: const Icon(Icons.arrow_back_ios_new)),
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
          child: Column(
            children: [
              CustomTextField(
                hintText: "Select Customer/Company ",
                labelText: "Customer/Company* ",
                suffixFixWidget: Image.asset(
                  "assets/images/down.png",
                  height: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Select Machine  Type",
                labelText: "Machine Type*",
                suffixFixWidget: Image.asset(
                  "assets/images/down.png",
                  height: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                  hintText: "Select Delivery Date",
                  labelText: "Delivery Date*",
                  suffixFixWidget: Icon(Icons.date_range)),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                hintText: "Total Payment",
                labelText: "Total Payment",
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                hintText: "Advance Payment",
                labelText: "Advance Payment",
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                hintText: "Select Manager role",
                labelText: "Assigns Order*",
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Done',
            onTap: () {},
          ),
        ));
  }
}
