import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBillHistory extends StatefulWidget {
  final bool isUpdate;
  const AddBillHistory({super.key, this.isUpdate = false});

  @override
  State<AddBillHistory> createState() => _AddBillHistoryState();
}

class _AddBillHistoryState extends State<AddBillHistory>
    with TickerProviderStateMixin {
  bool value = false;

  int index = 0;
  late TabController tabController;
  final _formKey = GlobalKey<FormState>();
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
        appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title:
              widget.isUpdate ? "Update Bill Invoice" : 'Create Bill Invoice',
        ),
        body: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                WidgetDropDownFromField(
                  hintText: "Invoice Bill",
                  labelText: "Bill Type",
                  itemList: const ["Admin", "Usre", "Seller"],
                  onTap: (value) {
                    debugPrint("Select => $value");
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetDropDownFromField(
                  hintText: "Select Company Name",
                  labelText: "Customer/Company Name*",
                  itemList: const ["Admin", "Usre", "Seller"],
                  onTap: (value) {
                    debugPrint("Select => $value");
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                WidgetDropDownFromField(
                  hintText: "Select Machine Type",
                  labelText: "Machine Type*",
                  itemList: const ["Admin", "Usre", "Seller"],
                  onTap: (value) {
                    debugPrint("Select => $value");
                  },
                ),
                verticalSpacing(),
                CustomTextField(
                  labelText: "Qty*",
                  hintText: "2*",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Qty";
                    } else {
                      return null;
                    }
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                ),
                verticalSpacing(),
                CustomTextField(
                  labelText: "Mobile No.*",
                  hintText: "9989898958",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Mobile No";
                    } else {
                      return null;
                    }
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  textInputType: const TextInputType.numberWithOptions(),
                ),
                verticalSpacing(),
                CustomTextField(
                  labelText: "Price*",
                  hintText: "2000*",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Price";
                    } else {
                      return null;
                    }
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  textInputType: const TextInputType.numberWithOptions(),
                ),
                verticalSpacing(),
                CustomTextField(
                  hintText: "Shipping Address....",
                  labelText: "Shipping Address*",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Shipping Address";
                    } else {
                      return null;
                    }
                  },
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                ),
                verticalSpacing(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Done',
            onTap: () {
              if (_formKey.currentState!.validate()) {
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
