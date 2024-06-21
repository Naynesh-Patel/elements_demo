import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/app bar/custom_appbar.dart';
import '../widget/button/custom_button.dart';
import '../widget/custom_text_field.dart';
import '../widget/dropdown/dropdown_fromfield.dart';

class CreateNewOrder extends StatefulWidget {
  const CreateNewOrder({super.key});

  @override
  State<CreateNewOrder> createState() => _CreateNewOrderState();
}

class _CreateNewOrderState extends State<CreateNewOrder> {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          // action: [
          //   Padding(
          //       padding: const EdgeInsets.only(right: 10),
          //       child: IconButton(
          //           onPressed: () {
          //             Get.to(const ViewOrderDetails());
          //           },
          //           icon: const Icon(
          //             Icons.add,
          //           )))
          // ],
          title: 'Create  New Order',
          onPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              WidgetDropDownFromField(
                hintText: "Select Customer/Company",
                labelText: "Customer/Company*",
                itemList: const ["Admin", "Usre", "Seller"],
                onTap: (value) {
                  debugPrint("Select => $value");
                },
              ),
              verticalSpacing(),
              CustomTextField(
                  hintText: "Select Machine Type*",
                  labelText: "Machine Type*",
                  enable: false,
                  focusNode: FocusNode(),
                  suffixFixIcon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: AppColor.blackColor,
                  )),
              verticalSpacing(),
              CustomTextField(
                  hintText: "Select Delivery Date",
                  labelText: "Delivery Date*",
                  enable: false,
                  focusNode: controller.deliveryDateFocusNode,
                  suffixFixIcon: const Icon(
                    Icons.date_range,
                    size: 22,
                  )),
              verticalSpacing(),
              CustomTextField(
                hintText: "Total Payment",
                labelText: "Total Payment",
                focusNode: controller.paymentFocusNode,
              ),
              verticalSpacing(),
              CustomTextField(
                hintText: "Advance Payment",
                labelText: "Advance Payment",
                textEditingController:
                    controller.advancePaymentTextEditingController,
                focusNode: controller.advancedPaymentFocusNode,
              ),
              verticalSpacing(),
              CustomTextField(
                  hintText: "Select Manager Role",
                  labelText: "Assigns Order*",
                  enable: false,
                  focusNode: FocusNode(),
                  suffixFixIcon: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: AppColor.blackColor,
                  )),
              verticalSpacing(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Done',
            onTap: () {
              Get.back();
            },
          ),
        ));
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }
}
