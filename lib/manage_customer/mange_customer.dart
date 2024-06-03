import 'package:elements/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_customer.dart';

class MangeCustomer extends StatefulWidget {
  const MangeCustomer({super.key});

  @override
  State<MangeCustomer> createState() => _MangeCustomerState();
}

class _MangeCustomerState extends State<MangeCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Manage Customer/Company",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
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
                              "Name :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "Tata Steel Pvt",
                              style: TextStyle(
                                color: Color(0xff555555),
                              ),
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
                              "99656 25693",
                              style: TextStyle(color: Color(0xff555555)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Reference By :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "L & T Pvt",
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
            Get.to(const AddCustomer());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
