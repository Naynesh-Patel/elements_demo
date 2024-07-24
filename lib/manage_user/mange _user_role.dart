import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/expense_controller.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/manage_user/select_user.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  bool isSelect = true;

  @override
  void initState() {
    customerController.companyTextEditingController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          title: "Manage User Role",
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
                      focusNode: FocusNode(),
                      readOnly: true,
                      showCursor: false,
                      onTap: () {
                        Get.to(const SelectUser());
                      },
                      labelText: "Manage User",
                      textEditingController:
                          userController.userNameTextEditingController,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Manage User";
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
                    height: 20,
                  ),
                  allowItems(
                      isSelect: userController.isAllowMachinery,
                      title: "Allow Machinery"),
                  allowItems(
                      isSelect: userController.isAllowMachinery,
                      title: "Allow Customer"),
                  allowItems(
                      isSelect: userController.isAllowSpareparts,
                      title: "Allow Spareparts"),
                  allowItems(
                      isSelect: userController.isAllowBill,
                      title: "Allow Bill"),
                  allowItems(
                      isSelect: userController.isAllowCustomer,
                      title: "Allow Machinery"),
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

  Widget allowItems({required String title, required RxBool isSelect}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyle.textStyleRegular14,
            ),
          ),
          const SizedBox(
            width: 4.0,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(6.0),
            onTap: () {
              isSelect.value = !isSelect.value;
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.dropDownHintColor),
                  borderRadius: BorderRadius.circular(6.0)),
              child: Obx(() => Icon(
                    Icons.check_rounded,
                    size: 14,
                    color: isSelect.value
                        ? AppColor.blackColor
                        : Colors.transparent,
                  )),
            ),
          ),
        ],
      ),
    );
  }

  keyVelue(onTab, key) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              key,
              style: AppTextStyle.textStyleRegular14,
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(6.0),
            onTap: () {
              onTab;
            },
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.dropDownHintColor),
                  borderRadius: BorderRadius.circular(6.0)),
              child: const Icon(
                Icons.check_rounded,
                size: 14,
                color: AppColor.blackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
