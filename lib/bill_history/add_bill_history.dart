import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
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
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
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
                  const CustomTextField(
                    labelText: "Qty*",
                    hintText: "2*",
                  ),
                  verticalSpacing(),
                  const CustomTextField(
                    labelText: "Mobile No.*",
                    hintText: "9989898958",
                  ),
                  verticalSpacing(),
                  const CustomTextField(
                    labelText: "Price*",
                    hintText: "2000*",
                  ),
                  verticalSpacing(),
                  const CustomTextField(
                    hintText: "Shipping Address....",
                    labelText: "Shipping Address*",
                  ),
                  verticalSpacing(),
                ],
              ),
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
