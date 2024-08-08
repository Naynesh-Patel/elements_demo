import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/expense_controller.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/expense/expense_list.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpense extends StatefulWidget {
  final dynamic model;
  const AddExpense({super.key, this.model});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  HomeController controller=Get.find();
  ExpenseController expenseController = Get.find();
  CustomerController customerController = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // controller.updateCustomer(widget.model['id']);
    if (widget.model != null) {
      expenseController.nameTextEditingController.text =
          widget.model['name'] ?? '';
      expenseController.expenseTypeTextEditingController.text =
          widget.model['expense_type'] ?? '';
      expenseController.priceTextEditingController.text =
          widget.model['price'] ?? '';
    } else {
      expenseController.expenseTypeTextEditingController.clear();
      expenseController.nameTextEditingController.clear();
      expenseController.priceTextEditingController.clear();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title:widget.model != null ? "Update Expense Details" : "Add Expense",
          onPressed: () {
            Get.back();
          },
        ),
        body: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomTextField(
                //   hintText: "Name",
                //   labelText: "Name",
                //   textEditingController:
                //       expenseController.nameTextEditingController,
                //   autoValidateMode: AutovalidateMode.onUserInteraction,
                //   validator: (p0) {
                //     if (p0!.isEmpty) {
                //       return "Please enter the name";
                //     }
                //     return null;
                //   },
                // ),
                // verticalSpacing(),
                // CustomTextField(
                //   textEditingController:
                //       expenseController.expenseTypeTextEditingController,
                //   hintText: "Tea",
                //   labelText: "Expense Type",
                //   autoValidateMode: AutovalidateMode.onUserInteraction,
                //   validator: (p0) {
                //     if (p0!.isEmpty) {
                //       return "Please enter the type";
                //     }
                //     return null;
                //   },
                // ),
                CustomTextField(
                    onTap: () async {
                      var result = await Get.to(const ExpenseTypeList());
                      if (result != null) {
                        expenseController.expenseTypeTextEditingController.text = result['name'];
                      }
                    },
                    showCursor: false,
                    readOnly: true,
                    hintText: "Tea",
                    labelText: "Expense Type",
                    // enable: false,
                    textEditingController:
                    expenseController.expenseTypeTextEditingController,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Please enter the type";
                        }
                        return null;
                      },
                    focusNode: FocusNode(),
                    suffixFixIcon:  const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: AppColor.blackColor,

                    )),
                verticalSpacing(),
                CustomTextField(
                  textEditingController:
                      expenseController.priceTextEditingController,
                  hintText: "₹ 20 ",
                  labelText: "Price",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  textInputType: TextInputType.number,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Please enter the price";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            isLoading: expenseController.isExpenseLoading,
            buttonText: widget.model != null ? 'Update' : 'Done',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                if (widget.model != null) {
                  expenseController.updateExpense(widget.model['id']);
                } else {
                  expenseController.addExpense();
                }
              }
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
