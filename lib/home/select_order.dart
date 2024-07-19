import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectOrder extends StatefulWidget {
  const SelectOrder({super.key});

  @override
  State<SelectOrder> createState() => _SelectOrderState();
}

class _SelectOrderState extends State<SelectOrder> {
  MachineryController machineryController = Get.find();
  CustomerController customerController = Get.find();

  bool isSelect = true;
  UserController userController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userController.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Select Order',
        onPressed: () {
          Get.back();
        },
      ),
      body: Obx(() => userController.isGetUserLoading.value
          ? const CustomLoader()
          : userController.userList.isEmpty
              ? const EmptyView()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: userController.userList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        userController.usersRoleTextEditingController.text =
                            userController.userList[index]['user_type'] ?? "";
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: AppColor.borderColor))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userController.userList[index]['user_type'] ?? "",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
    );
  }
}
