import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DatePiker extends StatefulWidget {
  const DatePiker({super.key});

  @override
  State<DatePiker> createState() => _DatePikerState();
}

class _DatePikerState extends State<DatePiker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Dipesh",
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
      backgroundColor: const Color(0xffFFFFFF),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SizedBox(
              width: Get.width,
              child: RangeDatePicker(
                splashColor: Colors.white,
                slidersColor: Colors.black,
                highlightColor: Colors.white,
                selectedCellsTextStyle: const TextStyle(),
                daysOfTheWeekTextStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff555555)),
                leadingDateTextStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Color(0xff333333)),
                enabledCellsTextStyle: const TextStyle(
                    color: Color(0xffA4A4A4),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                singleSelectedCellTextStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                currentDateTextStyle: const TextStyle(
                    color: Color(0xffA4A4A4),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
                minDate: DateTime(2020, 10, 10),
                maxDate: DateTime(2024, 10, 30),
                onRangeSelected: (value) {
                  // Handle selected range
                },
              ),
            ),
            const Divider(
              color: Color(0xffD1D1D1),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _keyValue("Present", "21"),
                const SizedBox(
                  height: 10,
                ),
                _keyValue("Absent", "3"),
                const SizedBox(
                  height: 10,
                ),
                _keyValue("Week Off", "4"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _keyValue(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
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
