import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddSparepartsTab extends StatefulWidget {
  final bool isUpdate;
  const AddSparepartsTab({
    super.key,
    this.isUpdate = false,
  });

  @override
  State<AddSparepartsTab> createState() => _AddSparepartsTabState();
}

class _AddSparepartsTabState extends State<AddSparepartsTab> {
  bool value = false;
  int index = 0;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title:
              widget.isUpdate ? "Update Spareparts Details " : "Add Spareparts",
          onPressed: () {
            Get.back();
          },
        ),
        body: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                 CustomTextField(
                  hintText: "Steel",
                  labelText: "Name*",
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
                  hintText: "20",
                  labelText: "Qty*",
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Please Enter Qty";
                    }
                    else{
                      return null;
                    }
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
            buttonText: widget.isUpdate ? 'Update' : 'Add',
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
