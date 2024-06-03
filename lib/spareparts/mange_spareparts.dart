import 'package:elements/constant/app_colors.dart';
import 'package:elements/spareparts/add_spareparts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangeSpareparts extends StatefulWidget {
  const MangeSpareparts({super.key});

  @override
  State<MangeSpareparts> createState() => _MangeSparepartsState();
}

class _MangeSparepartsState extends State<MangeSpareparts> {
  bool value = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Mange Spareparts",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
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
                  Expanded(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              " Steel Bolt ",
                              style: TextStyle(
                                color: Color(0xff555555),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Qty :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              " 10",
                              style: TextStyle(color: Color(0xff555555)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: Color(0xff555555),
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Color(0xff555555),
                          )),
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
            Get.to(AddSpareparts());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
