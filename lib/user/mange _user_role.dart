import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/expense_controller.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/home/select_customer_company.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_text_style.dart';
import '../widget/button/custom_button.dart';

class ManageUserRole extends StatefulWidget {
  final bool isUpdate;

  const ManageUserRole({super.key, this.isUpdate = false});

  @override
  State<ManageUserRole> createState() => _ManageUserRoleState();
}

class _ManageUserRoleState extends State<ManageUserRole> {
  ExpenseController expenseController = Get.find();

  UserController userController = Get.find();
  CustomerController customerController = Get.find();

  final _formKey = GlobalKey<FormState>();

  List<dynamic> userRoleList = [
    {
      "name": "Allow Machinery",
      "select": false,
    },
    {
      "name": "Allow Spareparts",
      "select": false,
    },
    {
      "name": "Allow User",
      "select": false,
    },
    {
      "name": "Allow Customer",
      "select": false,
    },
    {
      "name": "Allow Bill",
      "select": false,
    },
  ];

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
        appBar: HomeAppBar(
          title: "Manage User Role",
        ),
        body: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  CustomTextField(
                      focusNode: FocusNode(),
                      readOnly: true,
                      onTap: () {
                        Get.to(const SelectCustomerCompany());
                      },
                      labelText: "Allow User",
                      textEditingController:
                          customerController.companyTextEditingController,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Allow Machinery";
                        } else {
                          return null;
                        }
                      },
                      suffixFixIcon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 18,
                        color: AppColor.blackColor,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(userRoleList.length, (index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  "${userRoleList[index]['name']}",
                                  style: AppTextStyle.textStyleRegular14,
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(6.0),
                                onTap: () {
                                  if (userRoleList[index]['select'] == null) {
                                    userRoleList[index]['select'] = true;
                                  } else if (userRoleList[index]['select'] ==
                                      true) {
                                    userRoleList[index]['select'] = false;
                                  } else {
                                    userRoleList[index]['select'] = true;
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
                                  child: Icon(
                                    Icons.check_rounded,
                                    size: 14,
                                    color:
                                        userRoleList[index]['select'] ?? false
                                            ? AppColor.blackColor
                                            : Colors.transparent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            )),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            isLoading: false.obs,
            color: AppColor.buttonColor,
            buttonText: 'Update',
            onTap: () {
              userController.updateAccess();
            },
          ),
        ));
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 6.0,
    );
  }
}
