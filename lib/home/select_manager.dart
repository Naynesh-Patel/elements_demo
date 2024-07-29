import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectManager extends StatefulWidget {
  const SelectManager({super.key});

  @override
  State<SelectManager> createState() => _SelectManagerState();
}

class _SelectManagerState extends State<SelectManager> {
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
        title: 'Select Manager',
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
                        Get.back(result: userController.userList[index]);
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
                              userController.userList[index]['name'] ?? "",
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
