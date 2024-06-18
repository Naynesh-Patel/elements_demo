import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/custom_appbar.dart';
import 'package:elements/widget/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: 'Create Bill Invoice',
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              WidgetDropDownFromField(
                hintText: "Invoice Bill",
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
                itemList: const ["Admin", "Usre", "Seller"],
                onTap: (value) {
                  debugPrint("Select => $value");
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: "Qty*",
                labelText: "2*",
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: "Mobile No.*",
                labelText: "9989898958",
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextField(
                hintText: "Price*",
                labelText: "2000*",
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
            buttonText: 'Done',
            onTap: () {},
          ),
        ));
  }
}
