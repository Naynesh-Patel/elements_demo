import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/methods.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/date_piker.dart';
import 'package:elements/user/add_user.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_text_style.dart';

class MangeUser extends StatefulWidget {
  const MangeUser({super.key});

  @override
  State<MangeUser> createState() => _MangeUserState();
}

class _MangeUserState extends State<MangeUser> {
  bool value = false;
  int index = 0;
  UserController controller = Get.find();

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Mange User',
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Obx(
            () => controller.isGetUserLoading.value
                ? const CustomLoader()
                : Column(
                    children: [
                      _tableTopContent(),
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.userList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              _tableView(
                                  name: controller.userList[index]['name'],
                                  date: getDateInDDMMYY(DateTime.parse(
                                      controller.userList[index]['create_at'])),
                                  Authoriy: controller.userList[index]
                                      ['user_type'],
                                  index: index),
                            ],
                          );
                        },
                      )
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
            Get.to(const AddUser());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Widget _tableView(
      {
      // ignore: non_constant_identifier_names
      required String Authoriy,
      name,
      date,
      required int index}) {
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
                  child: Text(name,
                      textAlign: TextAlign.start,
                      style: AppTextStyle.textStyleLight12
                          .copyWith(color: AppColor.blackLightColor))),
              Expanded(
                  child: Text("$date",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleLight12
                          .copyWith(color: AppColor.blackLightColor))),

              Expanded(
                child: Text(
                  "$Authoriy...",
                  textAlign: TextAlign.end,
                  style: AppTextStyle.textStyleLight12
                      .copyWith(color: AppColor.blackLightColor),
                ),
              ),
              PopupMenuButton<String>(
                  // elevation: 50,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  child: const Icon(
                    Icons.more_vert,
                  ),
                  onSelected: (String value) {
                    if (value == "Edit") {
                      Get.to(() => AddUser(
                            model: controller.userList[index],
                          ));
                    } else {
                      controller.deleteUser(index: index);
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<String>>[
                        PopupMenuItem<String>(
                            value: 'Edit',
                            child: Center(
                                child: Text(
                              'Edit',
                              textAlign: TextAlign.center,
                              style: AppTextStyle.textStyleRegular14.copyWith(),
                            ))),
                        PopupMenuItem<String>(
                          value: 'Delete',
                          child: Center(
                            child: Text(
                              'Delete',
                              style: AppTextStyle.textStyleRegular14
                                  .copyWith(color: Colors.red),
                            ),
                          ),
                        ),
                      ]),
              // IconButton(
              //     padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
              //     constraints: const BoxConstraints(),
              //     style: const ButtonStyle(
              //       tapTargetSize: MaterialTapTargetSize.shrinkWrap, // the '2023' part
              //     ),
              //     onPressed: () {
              //
              // }, icon: const Icon(Icons.more_vert,color: Colors.black,))
              // Expanded(
              //     child: InkWell(
              //   onTap: () {
              //     Get.to(AddUser(
              //       model: controller.userList[index],
              //     ));
              //   },
              //   child: Text(
              //     "Edit",
              //     textAlign: TextAlign.end,
              //     style: AppTextStyle.textStyleLight12
              //         .copyWith(color: AppColor.blackLightColor),
              //   ),
              // )),
              // const SizedBox(
              //   width: 20,
              // ),
              // Expanded(
              //     child: InkWell(
              //   onTap: () {
              //     setState(() {
              //       controller.deleteUser(controller.userList[index]['id']);
              //       controller.userList.removeAt(index);
              //     });
              //   },
              //   child: Text(
              //     "Delete",
              //     textAlign: TextAlign.end,
              //     style: AppTextStyle.textStyleLight12
              //         .copyWith(color: AppColor.blackLightColor),
              //   ),
              // )),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _tableTopContent() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      decoration: const BoxDecoration(color: Color(0xffF1F1F1)),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "Name",
            style: AppTextStyle.textStyleRegular14
                .copyWith(color: AppColor.selectColor),
          )),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.to(const DatePiker());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Date",
                    textAlign: TextAlign.center,
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
          // Expanded(
          //   child: Text("Authoriy", style: AppTextStyle.textStyleRegular14),
          // ),
          Text("Authoriy", style: AppTextStyle.textStyleRegular14),
          // const Expanded(
          //   child: Text("Edit", style: TextStyle(color: Colors.green)),
          // ),
          // const Text("Delete", style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
