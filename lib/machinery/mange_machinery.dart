import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/machinery/add_machinery.dart';
import 'package:flutter/material.dart';
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _keyValue("Machine name", "Containership"),
                        _keyValue("Spare parts 1 ", "20"),
                        _keyValue("Spare parts 2 ", "20"),
                        _keyValue("Duration", "29 Days"),
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
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xffE6E6E6), width: 1)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _keyValue("Machine name", "Containership"),
                        _keyValue("Spare parts", "20"),
                        _keyValue("Duration", "29 Days"),
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
