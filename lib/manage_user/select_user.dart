import 'dart:convert';

import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/controller/order_controller.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectUser extends StatefulWidget {
  final dynamic model;
  const SelectUser({super.key, this.model});

  @override
  State<SelectUser> createState() => _SelectUserState();
}

class _SelectUserState extends State<SelectUser> {
  @override
  void initState() {
    super.initState();
    userController.getUser();
  }

  MachineryController controller = Get.find();
  OrderController orderController = Get.find();
  UserController userController = Get.find();
  CustomerController customerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Select User',
        onPressed: () {
          Get.back();
        },
      ),
      body: Obx(() => userController.isGetUserLoading.value
          ? const CustomLoader()
          : userController.userList.isEmpty
              ? const EmptyView()
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: userController.userList.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        userController.isAllowCustomer.value = userController
                                    .userList[index]['is_allow_customer'] ==
                                "1"
                            ? true
                            : false;
                        userController.isAllowBill.value =
                            userController.userList[index]['is_allow_bill'] ==
                                    "1"
                                ? true
                                : false;
                        userController.isAllowUser.value =
                            userController.userList[index]['is_allow_user'] ==
                                    "1"
                                ? true
                                : false;
                        userController.isAllowMachinery.value = userController
                                    .userList[index]['is_allow_machinery'] ==
                                "1"
                            ? true
                            : false;
                        userController.isAllowSpareparts.value = userController
                                    .userList[index]['is_allow_spareparts'] ==
                                "1"
                            ? true
                            : false;
                        userController.userNameTextEditingController.text =
                            userController.userList[index]['name'] ?? "";
                        userController.userId =
                            userController.userList[index]['id'] ?? "";
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: userController.userList[index]
                                            ['photo'] == null || userController.userList[index]
                                ['photo'] ==
                                        ""
                                    ? Image.asset(
                                        'assets/images/user_profile.png',
                                        fit: BoxFit.cover,
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.memory(
                                          base64Decode(userController
                                                  .userList[index]['photo'] ??
                                              ""),
                                          fit: BoxFit.cover,
                                        )),
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Expanded(
                                child: Text(
                                    userController.userList[index]
                                    ['name'] ??
                                        ''.toString(),
                                    style: AppTextStyle.textStyleRegular16
                                        .copyWith(
                                      color: const Color(0xff272727),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20.0,
                    );
                  },
                )),
    );
  }
}
