import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/expense_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({
    super.key,
  });

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  ExpenseController expenseController = Get.find();

  @override
  void initState() {
    super.initState();
    expenseController.getExpense();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'ExpenseList',
        onPressed: () {
          Get.back();
        },
      ),
      body: Obx(() => expenseController.isExpenseLoading.value
          ? const CustomLoader()
          : expenseController.expenseList.isEmpty
              ? const EmptyView()
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: expenseController.expenseList.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (expenseController.expenseList[index]['isSelect'] ==
                            null) {
                          expenseController.expenseList[index]['isSelect'] =
                              true;
                        } else if (expenseController.expenseList[index]
                                ['isSelect'] ==
                            true) {
                          expenseController.expenseList[index]['isSelect'] =
                              false;
                        } else {
                          expenseController.expenseList[index]['isSelect'] =
                              true;
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                    expenseController.expenseList[index]
                                            ['name'] ??
                                        ''.toString(),


                                    style: AppTextStyle.textStyleRegular16
                                        .copyWith(
                                      color: const Color(0xff272727),
                                    )),
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(6.0),
                                onTap: () {
                                  if (expenseController.expenseList[index]
                                          ['isSelect'] ==
                                      null) {
                                    expenseController.expenseList[index]
                                        ['isSelect'] = true;
                                  } else if (expenseController
                                          .expenseList[index]['isSelect'] ==
                                      true) {
                                    expenseController.expenseList[index]
                                        ['isSelect'] = false;
                                  } else {
                                    expenseController.expenseList[index]
                                        ['isSelect'] = true;
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.dropDownHintColor),
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Obx(() => Icon(
                                        Icons.check_rounded,
                                        size: 14,
                                        color:
                                            expenseController.expenseList[index]
                                                        ['isSelect'] ??
                                                    false
                                                ? AppColor.blackColor
                                                : Colors.transparent,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 0.0,
                    );
                  },
                )),
      bottomNavigationBar: Obx(() => expenseController.isExpenseLoading.value ||
              expenseController.expenseList.isEmpty
          ? const SizedBox.shrink()
          : Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: CustomButton(
                  color: AppColor.buttonColor,
                  buttonText: "Done",
                  onTap: () {
                    expenseController.selectExpense();
                  },
                  isLoading: false.obs),
            )),
    );
  }
}
