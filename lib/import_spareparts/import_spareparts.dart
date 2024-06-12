import 'package:elements/constant/app_colors.dart';
import 'package:elements/import_spareparts/add_import_spareparts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Import Spareparts",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      "Total Product Import : ",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    Text(
                      "30",
                      style: TextStyle(
                        color: Color(0xff555555),
                      ),
                    ),
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xffE6E6E6), width: 1)),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Company Name : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
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
                                  "Name : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                Text(
                                  " Steel Bolts",
                                  style: TextStyle(
                                    color: Color(0xff555555),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Qty : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                Text(
                                  "10",
                                  style: TextStyle(color: Color(0xff555555)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Type : ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                ),
                                Text(
                                  "Medium ",
                                  style: TextStyle(color: Color(0xff555555)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const Row(
                            children: [
                              Text(
                                "DD: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                              ),
                              Text(
                                "16-7-2024",
                                style: TextStyle(
                                  color: Color(0xff555555),
                                ),
                              ),
                            ],
                          ),
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
}
