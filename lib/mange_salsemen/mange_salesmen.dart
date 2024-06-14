import 'package:elements/constant/app_colors.dart';
import 'package:elements/mange_salsemen/add_salesmen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Mange Salesmen",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xffE6E6E6), width: 1)),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Role :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "Worker",
                              style: TextStyle(
                                color: Color(0xff555555),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Name :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              " Dipesh",
                              style: TextStyle(color: Color(0xff555555)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Contact No. :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "99123 45673",
                              style: TextStyle(color: Color(0xff555555)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Address :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "Surat, Gujarat",
                              style: TextStyle(color: Color(0xff555555)),
                            ),
                          ],
                        ),
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
}