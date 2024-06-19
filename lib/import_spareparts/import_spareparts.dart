import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/import_spareparts/add_import_spareparts.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../expense/view_expense_details.dart';

class ImportSpareparts extends StatefulWidget {
  const ImportSpareparts({super.key});

  @override
  State<ImportSpareparts> createState() => _ImportSparepartsState();
}

class _ImportSparepartsState extends State<ImportSpareparts> {
  bool value = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Import Spareparts",
        onPressed: () {
          Get.back();
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    _keyValue("Total Product Import", "30"),
                  ],
                ),
                InkWell(
                  child: Container(
                      height: 38,
                      width: 96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: const Color(0xffC9C9C9))),
                      child: const Center(
                        child: Text(
                          "Update",
                          style: TextStyle(
                            color: AppColor.buttonColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Get.to(ViewExpenseDetails());
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border:
                        Border.all(color: const Color(0xffE6E6E6), width: 1)),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _keyValue("Company Name", "Containership "),
                              _keyValue("Name", "Steel Bolts "),
                              _keyValue("Qty", "10"),
                              _keyValue("Type", "Medium"),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            _keyValue("DD", "16-7-2024"),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  borderRadius: BorderRadius.circular(5),
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9)),
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
                                        border: Border.all(
                                            color: const Color(0xffC9C9C9)),
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
                      ],
                    ),
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
            Get.to(const AddImportSpareparts());
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
              .copyWith(color: Color(0xff555555)),
        )),
      ],
    );
  }
}
