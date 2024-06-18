import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_text_field.dart';

class AddBillHistory extends StatefulWidget {
  const AddBillHistory({super.key});

  @override
  State<AddBillHistory> createState() => _AddBillHistoryState();
}

class _AddBillHistoryState extends State<AddBillHistory>
    with TickerProviderStateMixin {
  bool value = false;
  int index = 0;
  late TabController tabController;
  int currentIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9F9),
          title: const Text(
            "Create Bill Invoice",
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
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              CustomTextField(
                hintText: "Invoice Bill",
                labelText: "Bill Type",
                suffixFixWidget: Image.asset(
                  "assets/images/down.png",
                  height: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: "Select Company Name",
                labelText: "Customer/Company Name*",
                suffixFixWidget: Image.asset(
                  "assets/images/down.png",
                  height: 20,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: "Select Machine Type",
                labelText: "Machine Type*",
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: "2",
                labelText: "Qty*",
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: "99656 25693",
                labelText: "Mobile No.*",
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: "₹ 2000 ",
                labelText: "Price*",
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: "Shipping Address....",
                labelText: "Shipping Address*",
              ),
              const SizedBox(
                height: 15,
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
