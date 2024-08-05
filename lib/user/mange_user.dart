import 'dart:convert';

import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/user/add_user.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangeUser extends StatefulWidget {
  const MangeUser({super.key});

  @override
  State<MangeUser> createState() => _MangeUserState();
}

class _MangeUserState extends State<MangeUser> {
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
        title: 'Manage User',
        onPressed: () {
          Get.back();
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Obx(() => controller.isGetUserLoading.value
            ? const CustomLoader()
            : controller.userList.isEmpty
                ? const EmptyView()
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.userList.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: const Color(0xffE6E6E6),
                                      width: 1)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      controller.userList[index]['photo'] == ""
                                          ? Image.asset(
                                        'assets/images/user_profile.png',
                                        color: Colors.black54,
                                        height: 80,
                                        width: 80,
                                      )
                                          : SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(
                                                50.0),
                                            child: Image.memory(
                                              base64Decode(controller
                                                  .userList[index]
                                              ['photo']),
                                              fit: BoxFit.cover,
                                            )),
                                      ),

                                      const SizedBox(
                                        width: 60,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _keyValue(
                                              "Name",
                                              controller.userList[index]
                                                      ['name'] ??
                                                  ''),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          _keyValue(
                                              "Authoriy",
                                              controller.userList[index]
                                                      ['user_type'] ??
                                                  ''),
                                        ],
                                      ),

                                    ],
                                  ),
                                  verticalSpacing(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SmallButton(
                                        title: "  View  ",
                                        textColor: AppColor.selectColor,
                                        onTap: () {
                                          Get.to(AddUser(
                                              isView: true,
                                              model:
                                                  controller.userList[index]));
                                        },
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      SmallButton(
                                        title: "  Edit  ",
                                        onTap: () {
                                          Get.to(AddUser(
                                            model: controller.userList[index],
                                          ));
                                        },
                                      ),
                                      const SizedBox(
                                        width: 12.0,
                                      ),
                                      SmallButton(
                                        title: "Delete",
                                        textColor: AppColor.cancelColor,
                                        onTap: () {
                                          CustomDialogBox.showDeleteDialog(
                                            context: context,
                                            bodyText:
                                                "Do you really want to cancel these records? This process cannot be undone.",
                                            onCancelTap: () {
                                              Get.back();
                                            },
                                            onDeleteTap: () {
                                              controller.deleteUser(controller
                                                  .userList[index]['id']);
                                              controller.userList
                                                  .removeAt(index);
                                              Get.back();
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                            //   Container(
                            //
                            //     padding: const EdgeInsets.symmetric(
                            //         horizontal: 10, vertical: 10),
                            //     decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(4),
                            //         border: Border.all(
                            //             color: const Color(0xffE6E6E6),
                            //             width: 1)),
                            //     child:Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         Row(
                            //           // mainAxisAlignment: MainAxisAlignment.end,
                            //           children: [
                            //             controller.userList[index]
                            //             ['photo'] ==
                            //                 ""
                            //                 ? Image.asset(
                            //               'assets/images/user_profile.png',
                            //               color: Colors.black54,
                            //               height: 80,
                            //               width: 80,
                            //             )
                            //                 : SizedBox(
                            //               height: 80,
                            //               width: 80,
                            //               child: ClipRRect(
                            //                   borderRadius:
                            //                   BorderRadius.circular(
                            //                       50.0),
                            //                   child: Image.memory(
                            //                     base64Decode(controller
                            //                         .userList[
                            //                     index]['photo']),
                            //                     fit: BoxFit.cover,
                            //                   )
                            //               ),
                            //
                            //             ),
                            //             Column(
                            //               crossAxisAlignment: CrossAxisAlignment.start,
                            //               // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            //               children: [
                            //                 _keyValue(
                            //                     "Name",
                            //                     controller.userList[index]
                            //                     ['name'] ??
                            //                         ''),
                            //                 const SizedBox(
                            //                   height: 5,
                            //                 ),
                            //                 _keyValue(
                            //                     "Authoriy",
                            //                     controller.userList[index]
                            //                     ['user_type'] ??
                            //                         ''),
                            //               ],
                            //             ),
                            //
                            //
                            //             const SizedBox(
                            //               height: 10,
                            //             ),
                            //
                            //             // Row(
                            //             //   children: [
                            //             //     InkWell(
                            //             //       onTap: () {
                            //             //         Get.to(AddUser(
                            //             //           model: controller.userList[index],
                            //             //         ));
                            //             //       },
                            //             //       borderRadius: BorderRadius.circular(5),
                            //             //       child: Container(
                            //             //         padding: const EdgeInsets.all(6),
                            //             //         decoration: BoxDecoration(
                            //             //             border: Border.all(
                            //             //                 color:
                            //             //                     const Color(0xffC9C9C9)),
                            //             //             borderRadius:
                            //             //                 BorderRadius.circular(5)),
                            //             //         child: const Icon(
                            //             //           Icons.edit,
                            //             //           color: Color(0xff555555),
                            //             //         ),
                            //             //       ),
                            //             //     ),
                            //             //     const SizedBox(width: 10),
                            //             //     InkWell(
                            //             //       onTap: () {
                            //             //         CustomDialogBox.showDeleteDialog(
                            //             //           context: context,
                            //             //           bodyText:
                            //             //               "Do you really want to cancel these records? This process cannot be undone.",
                            //             //           onCancelTap: () {
                            //             //             Get.back();
                            //             //           },
                            //             //           onDeleteTap: () {
                            //             //             setState(() {
                            //             //               controller.deleteUser(controller
                            //             //                   .userList[index]['id']);
                            //             //               controller.userList
                            //             //                   .removeAt(index);
                            //             //               Get.back();
                            //             //             });
                            //             //           },
                            //             //         );
                            //             //       },
                            //             //       borderRadius: BorderRadius.circular(5),
                            //             //       child: Container(
                            //             //         padding: const EdgeInsets.all(6),
                            //             //         decoration: BoxDecoration(
                            //             //             border: Border.all(
                            //             //                 color:
                            //             //                     const Color(0xffC9C9C9)),
                            //             //             borderRadius:
                            //             //                 BorderRadius.circular(5)),
                            //             //         child: const Icon(
                            //             //           Icons.delete,
                            //             //           color: Color(0xff555555),
                            //             //         ),
                            //             //       ),
                            //             //     ),
                            //             //   ],
                            //             // )
                            //           ],
                            //         ),
                            //
                            //         Row(
                            //           // mainAxisAlignment:
                            //           // MainAxisAlignment.end,
                            //           children: [
                            //             SmallButton(
                            //               title: " View ",
                            //               textColor: AppColor.selectColor,
                            //               onTap: () {
                            //                 Get.to(AddUser(
                            //                     isView: true,
                            //                     model: controller
                            //                         .userList[index]));
                            //               },
                            //             ),
                            //             const SizedBox(
                            //               width: 10,
                            //             ),
                            //             SmallButton(
                            //                 title: "Edit",
                            //                 onTap: () {
                            //                   Get.to(AddUser(
                            //                     model: controller
                            //                         .userList[index],
                            //                   ));
                            //                 },
                            //                 textColor:
                            //                 const Color(0xff555555)),
                            //             const SizedBox(
                            //               width: 10,
                            //             ),
                            //             SmallButton(
                            //                 title: "Delete",
                            //                 onTap: () {
                            //                   CustomDialogBox
                            //                       .showDeleteDialog(
                            //                     context: context,
                            //                     bodyText:
                            //                     "Do you really want to cancel these records? This process cannot be undone.",
                            //                     onCancelTap: () {
                            //                       Get.back();
                            //                     },
                            //                     onDeleteTap: () {
                            //                       setState(() {
                            //                         controller.deleteUser(
                            //                             controller.userList[
                            //                             index]['id']);
                            //                         controller.userList
                            //                             .removeAt(index);
                            //                         Get.back();
                            //                       });
                            //                     },
                            //                   );
                            //                 },
                            //                 textColor:
                            //                 const Color(0xffB50A0A)),
                            //           ],
                            //         )
                            //       ],
                            //     )
                            // );
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.120,
                        ),
                      ],
                    ),
                  )),
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

  // Widget _tableView(
  //     {
  //     // ignore: non_constant_identifier_names
  //     required String Authoriy,
  //     name,
  //     date,
  //     required int index}) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //     child: Column(
  //       children: [
  //         const SizedBox(
  //           height: 12.0,
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //                 child: Text(name,
  //                     textAlign: TextAlign.start,
  //                     style: AppTextStyle.textStyleLight12
  //                         .copyWith(color: AppColor.blackLightColor))),
  //             Expanded(
  //                 child: Text("$date",
  //                     textAlign: TextAlign.center,
  //                     style: AppTextStyle.textStyleLight12
  //                         .copyWith(color: AppColor.blackLightColor))),
  //
  //             Expanded(
  //               child: Text(
  //                 "$Authoriy...",
  //                 textAlign: TextAlign.end,
  //                 style: AppTextStyle.textStyleLight12
  //                     .copyWith(color: AppColor.blackLightColor),
  //               ),
  //             ),
  //             PopupMenuButton<String>(
  //                 padding: EdgeInsets.zero,
  //                 constraints: const BoxConstraints(),
  //                 color: Colors.white,
  //                 child: const Icon(
  //                   size: 25,
  //                   Icons.more_vert,
  //                 ),
  //                 onSelected: (String value) {
  //                   if (value == "Edit") {
  //                     Get.to(() => AddUser(
  //                           model: controller.userList[index],
  //                         ));
  //                   } else {
  //                     controller.deleteUser(index: index);
  //                   }
  //                 },
  //                 itemBuilder: (BuildContext context) =>
  //                     <PopupMenuEntry<String>>[
  //                       PopupMenuItem<String>(
  //                           value: 'Edit',
  //                           child: Center(
  //                               child: Text(
  //                             'Edit',
  //                             textAlign: TextAlign.center,
  //                             style: AppTextStyle.textStyleRegular14.copyWith(),
  //                           ))),
  //                       PopupMenuItem<String>(
  //                         value: 'Delete',
  //                         child: Center(
  //                           child: Text(
  //                             'Delete',
  //                             style: AppTextStyle.textStyleRegular14
  //                                 .copyWith(color: Colors.red),
  //                           ),
  //                         ),
  //                       ),
  //                     ]),
  //             // IconButton(
  //             //     padding: EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
  //             //     constraints: const BoxConstraints(),
  //             //     style: const ButtonStyle(
  //             //       tapTargetSize: MaterialTapTargetSize.shrinkWrap, // the '2023' part
  //             //     ),
  //             //     onPressed: () {
  //             //
  //             // }, icon: const Icon(Icons.more_vert,color: Colors.black,))
  //             // Expanded(
  //             //     child: InkWell(
  //             //   onTap: () {
  //             //     Get.to(AddUser(
  //             //       model: controller.userList[index],
  //             //     ));
  //             //   },
  //             //   child: Text(
  //             //     "Edit",
  //             //     textAlign: TextAlign.end,
  //             //     style: AppTextStyle.textStyleLight12
  //             //         .copyWith(color: AppColor.blackLightColor),
  //             //   ),
  //             // )),
  //             // const SizedBox(
  //             //   width: 20,
  //             // ),
  //             // Expanded(
  //             //     child: InkWell(
  //             //   onTap: () {
  //             //     setState(() {
  //             //       controller.deleteUser(controller.userList[index]['id']);
  //             //       controller.userList.removeAt(index);
  //             //     });
  //             //   },
  //             //   child: Text(
  //             //     "Delete",
  //             //     textAlign: TextAlign.end,
  //             //     style: AppTextStyle.textStyleLight12
  //             //         .copyWith(color: AppColor.blackLightColor),
  //             //   ),
  //             // )),
  //           ],
  //         ),
  //         const SizedBox(
  //           height: 8.0,
  //         ),
  //         const Divider(),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _tableTopContent() {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
  //     decoration: const BoxDecoration(color: Color(0xffF1F1F1)),
  //     child: Row(
  //       children: [
  //         Expanded(
  //             child: Text(
  //           "Name",
  //           style: AppTextStyle.textStyleRegular14
  //               .copyWith(color: AppColor.selectColor),
  //         )),
  //         Expanded(
  //           child: InkWell(
  //             onTap: () {
  //               Get.to(const DatePiker());
  //             },
  //             child: Row(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Text(
  //                   "Date",
  //                   textAlign: TextAlign.center,
  //                   style: AppTextStyle.textStyleRegular14
  //                       .copyWith(color: AppColor.selectColor),
  //                 ),
  //                 const SizedBox(
  //                   width: 2.0,
  //                 ),
  //                 Image.asset(
  //                   "assets/images/date.png",
  //                   height: 14,
  //                   width: 14,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         // Expanded(
  //         //   child: Text("Authoriy", style: AppTextStyle.textStyleRegular14),
  //         // ),
  //         Text("Authoriy", style: AppTextStyle.textStyleRegular14),
  //         // const Expanded(
  //         //   child: Text("Edit", style: TextStyle(color: Colors.green)),
  //         // ),
  //         // const Text("Delete", style: TextStyle(color: Colors.red)),
  //       ],
  //     ),
  //   );
  // }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
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
}
