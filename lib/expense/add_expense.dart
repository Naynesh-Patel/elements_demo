import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpense extends StatefulWidget {
  final bool isUpdate;
  const AddExpense({super.key, this.isUpdate = false});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  HomeController controller = Get.find();
  final _formKey = GlobalKey<FormState>();

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
        body: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: "",
                  labelText: "Name",
                  // textEditingController: TextEditingController(text: "Ramesh"),
                  focusNode: controller.expenseNameFocusNode,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please Enter Name";
                    }
                    else{
                      return null;
                    }
                  },
                ),
                verticalSpacing(),
                CustomTextField(
                  // textEditingController: TextEditingController(text: "Tea"),
                  hintText: "Tea",
                  labelText: "Expense Type",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please Enter Expense Type";
                    }
                    else{
                      return null;
                    }
                  },
                  focusNode: controller.expenseTypeFocusNode,
                ),
                verticalSpacing(),
                CustomTextField(
                  // textEditingController: TextEditingController(text: "20"),
                  hintText: "₹ 20 ",
                  labelText: "Price",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please Enter Price";
                    }
                    else{
                      return null;
                    }
                  },
                  focusNode: controller.expensePriceFocusNode,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: widget.isUpdate ? 'Update' : 'Done',
            onTap: () {
              if (_formKey.currentState!.validate()){

                Get.back();

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
