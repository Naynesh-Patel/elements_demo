import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mange_salsemen/add_salesmen.dart';
import 'salesmen_view_detail.dart';

class MangeSalesmen extends StatefulWidget {
  const MangeSalesmen({super.key});

  @override
  State<MangeSalesmen> createState() => _MangeSalesmenState();
}

class _MangeSalesmenState extends State<MangeSalesmen> {
  bool value = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onPressed: () {
          Get.back();
        },
        title: 'Manage Salesmen',
      ),
      // AppBar(
      //   backgroundColor: const Color(0xffF9F9F9),
      //   title: const Text(
      //     "Manage Salesmen",
      //     style: TextStyle(
      //       color: Colors.black,
      //     ),
      //   ),
      //   leading: InkWell(
      //       onTap: () {
      //         Get.back();
      //       },
      //       child: const Icon(Icons.arrow_back_ios_new)),
      // ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(const SalsemenViewDetils());
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border:
                        Border.all(color: const Color(0xffE6E6E6), width: 1)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _keyValue("Role", "Worker"),
                          const SizedBox(height: 8),
                          _keyValue("Name", "Dipesh"),
                          const SizedBox(height: 8),
                          _keyValue("Contact No", "99123 45673"),
                          const SizedBox(height: 8),
                          _keyValue("Address", "Surat, Gujarat"),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffC9C9C9)),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(
                              Icons.edit,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffC9C9C9)),
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(
                              Icons.delete,
                              color: Color(0xff555555),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Get.to(const AddSalesmen());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Future<void> deleteDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          backgroundColor: Colors.white,
          title: const Text(
            "Are You Sure Delete?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xff555555)),
          ),
          content: const Text(
            "Do you really want to delete these \nrecords? This process cannot be undone",
            textAlign: TextAlign.center,
            style: TextStyle(
                // fontWeight: FontWeight.w300,
                fontSize: 12,
                color: Color(0xff949494)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffC1C1C1),
                        ),
                        child: const Text("Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xff01959F),
                            borderRadius: BorderRadius.circular(8)),
                        child: const Text("Delete",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400))),
                  ),
                ],
              ),
            )
            // InkWell(
            //   onTap: () {
            //     Get.back();
            //   },
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         color: AppColor.buttonColor),
            //     child: const Text(
            //       'Delete',
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }

  Widget _keyValue(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$key : ",
          style: AppTextStyle.textStyleBold14,
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
