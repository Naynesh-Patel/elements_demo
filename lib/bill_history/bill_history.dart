import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BillHistory extends StatefulWidget {
  const BillHistory({super.key});

  @override
  State<BillHistory> createState() => _BillHistoryState();
}

class _BillHistoryState extends State<BillHistory> {
  bool value = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Bill History",
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
        child: const Column(
          children: [
            CustomTextField(
              hintText: "Bill Customer/Company",
              labelText: "Customer/Company",
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: "Bill Machine",
              labelText: "Machine",
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: "Bill Spareparts",
              labelText: "Spareparts",
            ),
          ],
        ),
      ),
    );
  }
}
