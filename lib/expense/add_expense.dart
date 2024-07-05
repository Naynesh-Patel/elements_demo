import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/customer_controller.dart';
import '../controller/customer_controller.dart';
import '../controller/expense_controller.dart';

class AddExpense extends StatefulWidget {
  final bool isUpdate;
  const AddExpense({super.key, this.isUpdate = false});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  HomeController controller = Get.find();
  ExpenseController expenseController = Get.find();
  CustomerController customerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: widget.isUpdate ? "Update Expense Details" : "Add Expense",
          onPressed: () {
            Get.back();
          },
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: "",
                labelText: "Name",
                textEditingController: expenseController.nameTextEditingController,
                focusNode: controller.expenseNameFocusNode,
              ),
              verticalSpacing(),
              CustomTextField(
                textEditingController: expenseController.expenseTypeTextEditingController,
                hintText: "Tea",
                labelText: "Expense Type",
                focusNode: controller.expenseTypeFocusNode,
              ),
              verticalSpacing(),
              CustomTextField(
                textEditingController: expenseController.priceTextEditingController,
                hintText: "₹ 20 ",
                labelText: "Price",
                focusNode: controller.expensePriceFocusNode,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: widget.isUpdate ? 'Update' : 'Done',
            onTap: () {
              expenseController.addExpense();
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
