
import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/expense_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ExpenseTypeList extends StatefulWidget {
  const ExpenseTypeList({
    super.key,
  });

  @override
  State<ExpenseTypeList> createState() => _ExpenseTypeListState();
}

class _ExpenseTypeListState extends State<ExpenseTypeList> {
  ExpenseController expenseController = Get.find();

  @override
  void initState() {
    super.initState();
    expenseController.getExpenseTypeList();
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
        action: [
          IconButton(onPressed: () {
            expenseController.expenseTypeTextEditingController.clear();
            showDialog(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                  contentPadding: EdgeInsets.zero,
                  backgroundColor: Colors.white,
                  content: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Add Expense Type",
                          style: AppTextStyle.textStyleBold16,
                        ),
                         const SizedBox(
                          height: 16.0,
                        ),
                        CustomTextField(
                          textEditingController: expenseController.expenseTypeTextEditingController,
                          textCapitalization: TextCapitalization.words,
                          hintText: "Expense",
                          labelText: "Expense Type",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Name";
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap:(){
                                  Get.back();
                                },
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5),
                                        color:Colors.transparent,
                                        border: Border.all(
                                            color:
                                            const Color(0xffC9C9C9))),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    child: Text(
                                        "Cancel",textAlign: TextAlign.center,
                                        style: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.blackColor)
                                    )),
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: InkWell(
                                onTap:(){
                                  expenseController.addExpenseType();
                                },
                                borderRadius: BorderRadius.circular(5),
                                child: Container(
                                    width: Get.width,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5),
                                        color:AppColor.selectColor,
                                        border: Border.all(
                                            color:AppColor.selectColor)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    child: Text(
                                        "Add",textAlign: TextAlign.center,
                                        style: AppTextStyle.textStyleRegular14.copyWith(color : AppColor.whiteColor,)
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }, icon: const Icon(Icons.add,color: AppColor.blackColor,))
        ],
      ),

      body: Obx(() => expenseController.isExpenseTypeLoading.value
          ? const CustomLoader()
          : expenseController.expenseTypeList.isEmpty
              ? const EmptyView()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: expenseController.expenseTypeList.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.back(result:expenseController.expenseTypeList[index]);
                        // if (expenseController.expenseTypeList[index]['isSelect'] ==
                        //     null) {
                        //   expenseController.expenseTypeList[index]['isSelect'] =
                        //       true;
                        // } else if (expenseController.expenseTypeList[index]
                        //         ['isSelect'] ==
                        //     true) {
                        //   expenseController.expenseTypeList[index]['isSelect'] =
                        //       false;
                        // } else {
                        //   expenseController.expenseTypeList[index]['isSelect'] =
                        //       true;
                        // }
                        // setState(() {});
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
                            child: Text(
                                expenseController.expenseTypeList[index]
                                ['name'] ??
                                    ''.toString(),


                                style: AppTextStyle.textStyleRegular16
                                    .copyWith(
                                  color: const Color(0xff272727),
                                )),
                          ),
                          Divider(
                            height: 1.0,
                            color: Colors.grey.withOpacity(0.2),
                          )
                        ],
                      ),
                    );
                  },
                )),
      // bottomNavigationBar: Obx(() => expenseController.isExpenseLoading.value ||
      //         expenseController.expenseTypeList.isEmpty
      //     ? const SizedBox.shrink()
      //     : Container(
      //         margin:
      //             const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      //         child: CustomButton(
      //             color: AppColor.buttonColor,
      //             buttonText: "Done",
      //             onTap: () {
      //               expenseController.selectExpense();
      //             },
      //             isLoading: false.obs),
      //       )),
    );
  }

  // Container(
  // padding: const EdgeInsets.symmetric(
  // horizontal: 16.0, vertical: 16.0),
  // child: IntrinsicHeight(
  // child: Row(
  // crossAxisAlignment: CrossAxisAlignment.start,
  // children: [
  // Expanded(
  // child: Text(
  // expenseController.expenseTypeList[index]
  // ['name'] ??
  // ''.toString(),
  //
  //
  // style: AppTextStyle.textStyleRegular16
  //     .copyWith(
  // color: const Color(0xff272727),
  // )),
  // ),
  // InkWell(
  // borderRadius: BorderRadius.circular(6.0),
  // onTap: () {
  // if (expenseController.expenseTypeList[index]
  // ['isSelect'] ==
  // null) {
  // expenseController.expenseTypeList[index]
  // ['isSelect'] = true;
  // } else if (expenseController
  //     .expenseTypeList[index]['isSelect'] ==
  // true) {
  // expenseController.expenseTypeList[index]
  // ['isSelect'] = false;
  // } else {
  // expenseController.expenseTypeList[index]
  // ['isSelect'] = true;
  // }
  // setState(() {});
  // },
  // child: Container(
  // padding: const EdgeInsets.symmetric(
  // horizontal: 4.0, vertical: 4.0),
  // decoration: BoxDecoration(
  // border: Border.all(
  // color: AppColor.dropDownHintColor),
  // borderRadius: BorderRadius.circular(6.0)),
  // child: Obx(() => Icon(
  // Icons.check_rounded,
  // size: 14,
  // color:
  // expenseController.expenseTypeList[index]
  // ['isSelect'] ??
  // false
  // ? AppColor.blackColor
  //     : Colors.transparent,
  // )),
  // ),
  // ),
  // ],
  // ),
  // ),
  // )
}
