import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/constant/methods.dart';
import 'package:elements/constant/vars.dart';
import 'package:elements/controller/expense_controller.dart';
import 'package:elements/date_piker.dart';
import 'package:elements/expense/add_expense.dart';
import 'package:elements/expense/view_expense_details.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:elements/widget/custom_datepiker.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ExpenseTab extends StatefulWidget {
  final bool isUpdate;

  const ExpenseTab({super.key, this.isUpdate = false});

  @override
  State<ExpenseTab> createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  ExpenseController expenseController = Get.find();

  @override
  void initState() {
    setState(() {
      expenseController.getExpense();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: const HomeAppBar(
        title: "Expense",
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        child: Obx(
          () => expenseController.isGetExpenseLoading.value
              ? const CustomLoader()
              : expenseController.expenseList.isEmpty
                  ? const EmptyView()
                  :  Column(
            children: [
              _tableTopContent(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: expenseController.expenseList.length,
                  itemBuilder: (context, index) {
                  return _tableView(
                      name: expenseController.expenseList[index]['user_name']??'',
                      date: expenseController.expenseList[index]['expense_type']??'',
                      checkIn:getDateInDMYYYY(DateTime.parse(expenseController.expenseList[index] ['created_at']??'')),
                      amt: expenseController.expenseList[index]['price']??'',
                  );
                },),
              )
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Get.to(const AddExpense());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Widget _keyValue(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$key : ",
          style: AppTextStyle.textStyleRegular16,
        ),
        Flexible(
            child: Text(
          "$value",
          style: AppTextStyle.textStyleRegular14
              .copyWith(color: const Color(0xff555555)),
        )),
      ],
    );
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 6.0,
    );
  }

  Widget _tableTopContent() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      decoration: const BoxDecoration(color: Color(0xffF1F1F1)),
      child: Row(
        children: [
          Expanded(
              child: Container(
                // color: Colors.red,
                child: Text(
                  "Name",
                  style: AppTextStyle.textStyleRegular14
                      .copyWith(color: AppColor.selectColor),
                ),
              )),
          Expanded(
              child: Container(
                  // color: Colors.yellow,
                  child: Text("Expense Type",textAlign: TextAlign.center, style: AppTextStyle.textStyleRegular14))),
          Expanded(
            child: Container(
              // color: Colors.grey,
              child: InkWell(
                onTap: () {
                  Get.to(const CustomDatePicker());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Date",textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleRegular14
                          .copyWith(color: AppColor.selectColor),
                    ),
                    const SizedBox(
                      width: 2.0,
                    ),
                    Image.asset(
                      "assets/images/date.png",
                      height: 14,
                      width: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text("Amt", style: AppTextStyle.textStyleRegular14),
        ],
      ),
    );
  }

  Widget _tableView(
      {required String name,
        date,
        checkIn,
        amt,}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                    name,
                    style: AppTextStyle.textStyleRegular14
                        .copyWith(color: AppColor.blackColor),
                  )),
              Expanded(
                  child: Text("$date",textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleLight12
                          .copyWith(color: const Color(0xff555555)))),
                Expanded(
                    child: Text(checkIn,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleLight12
                            .copyWith(color: const Color(0xff555555)))),
                Text(amt,
                    style: AppTextStyle.textStyleLight12
                        .copyWith(color: const Color(0xff555555))),
              ]
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Divider(),
        ],
      ),
    );
  }

}
