import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/constant/methods.dart';
import 'package:elements/controller/expense_controller.dart';
import 'package:elements/expense/add_expense.dart';
import 'package:elements/expense/view_expense_details.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Obx(
              () => expenseController.isGetExpenseLoading.value
              ? const CustomLoader()
              : expenseController.expenseList.isEmpty
              ? const EmptyView()
              : SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: expenseController.expenseList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.to(const ViewExpenseDetails());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: AppColor.borderColor,
                                width: 1)),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment:
                            CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    _keyValue(
                                        "Name",
                                        expenseController.expenseList[
                                        index]['name'] ??
                                            ''),
                                    verticalSpacing(),
                                    _keyValue(
                                        "Expense Type",
                                        expenseController.expenseList[
                                        index]
                                        ['expense_type'] ??
                                            ''),
                                    verticalSpacing(),
                                    _keyValue(
                                        "Price",
                                        expenseController.expenseList[
                                        index]['price'] ??
                                            ''),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.end,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  _keyValue(
                                    "DD",
                                    getDateInDDMMYY(DateTime.parse(
                                        expenseController.expenseList[
                                        index]
                                        ['created_at'] ??
                                            '')),
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        onTap: () {
                                          Get.to(AddExpense(
                                            model: expenseController
                                                .expenseList[index],
                                          ));
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(10),
                                                border: Border.all(
                                                    color: const Color(
                                                        0xffD1D1D1))),
                                            padding: const EdgeInsets
                                                .symmetric(
                                                vertical: 10,
                                                horizontal: 10),
                                            child: SvgPicture.asset(
                                              'assets/svg/ic_edit.svg',
                                              height: 16,
                                              width: 16,
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      InkWell(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        onTap: () {
                                          CustomDialogBox
                                              .showDeleteDialog(
                                            context: context,
                                            bodyText:
                                            "Do you really want to cancel these records? This process cannot be undone.",
                                            onCancelTap: () {
                                              Get.back();
                                            },
                                            onDeleteTap: () {
                                              expenseController
                                                  .deleteExpense(
                                                  index: index);
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(10),
                                              border: Border.all(
                                                  color: const Color(
                                                      0xffD1D1D1))),
                                          padding: const EdgeInsets
                                              .symmetric(
                                              vertical: 10,
                                              horizontal: 10),
                                          child: const Icon(
                                            Icons.delete,
                                            size: 16,
                                            weight: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
                // SizedBox(height: Get.height*0.120,),
              ],
            ),
          ),
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
}
