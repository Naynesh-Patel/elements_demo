import 'package:elements/constant/app_colors.dart';
import 'package:elements/machinery/add_machinery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MangeMachinery extends StatefulWidget {
  const MangeMachinery({super.key});

  @override
  State<MangeMachinery> createState() => _MangeMachineryState();
}

class _MangeMachineryState extends State<MangeMachinery> {
  bool value = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Mange Machinery",
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
                              "Machine name : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "Containership",
                              style: TextStyle(
                                color: Color(0xff555555),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Spare parts :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "20",
                              style: TextStyle(color: Color(0xff555555)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Duration : ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "29 Days",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xff555555),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: const Color(0xffD1D1D1))),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: SvgPicture.asset(
                              'assets/svg/ic_edit.svg',
                              height: 16,
                              width: 16,
                            )),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: const Color(0xffD1D1D1))),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: const Icon(
                            Icons.delete,
                            size: 16,
                            weight: 16,
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
            Get.to(const AddMachinery());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
