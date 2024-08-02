import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
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
      backgroundColor: AppColor.whiteColor,
      appBar: CustomAppBar(
        title: 'Ramesh',
        onPressed: () {
         Get.back();
        },
      ),
      body: Container(
        margin:  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.multi,
                calendarViewMode: CalendarDatePicker2Mode.day,
                controlsHeight: 50.0,
                controlsTextStyle: AppTextStyle.textStyleRegular16,
                customModePickerIcon: const SizedBox(),
                dayTextStyle: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.dropDownHintColor),
                disabledDayTextStyle: AppTextStyle.textStyleRegular14,
                weekdayLabelTextStyle: AppTextStyle.textStyleRegular14,
                  selectedDayHighlightColor:AppColor.selectDateColor,
                 nextMonthIcon: const Icon(Icons.arrow_forward_ios_rounded,size: 16,color: AppColor.blackColor,),
                lastMonthIcon: const Icon(Icons.arrow_back_ios_rounded,size: 16,color: AppColor.blackColor,),
                // hideYearPickerDividers: true,
                // selectedDayTextStyle: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.whiteColor)
              ),
              onValueChanged: (dates) {},
              value: [DateTime.now()],
            ),
            // SizedBox(
            //   width: Get.width,
            //   child: RangeDatePicker(
            //     daysOfTheWeekTextStyle:AppTextStyle.textStyleBold13,
            //     leadingDateTextStyle: AppTextStyle.textStyleBold16,
            //     enabledCellsTextStyle: AppTextStyle.textStyleRegular14,
            //     singleSelectedCellTextStyle: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.whiteColor),
            //    selectedCellsTextStyle:AppTextStyle.textStyleRegular14.copyWith(color: AppColor.whiteColor),
            //    currentDateTextStyle:AppTextStyle.textStyleRegular14,
            //    slidersSize: 16.0,
            //    currentDateDecoration: const BoxDecoration(
            //       border: Border(
            //       )
            //    ),
            //     slidersColor: AppColor.blackColor,
            //     selectedCellsDecoration: const BoxDecoration(
            //         color: AppColor.selectDateColor,
            //     ),
            //     singleSelectedCellDecoration: BoxDecoration(
            //       color: AppColor.selectDateColor,
            //       borderRadius: BorderRadius.circular(50.0)
            //     ),
            //     minDate: DateTime(2020, 10, 10),
            //     maxDate: DateTime(2024, 10, 30),
            //     initialDate: DateTime.now(),
            //     onRangeSelected: (value) {
            //       // Handle selected range
            //     },
            //   ),
            // ),
            const Divider(
              color: Color(0xffD1D1D1),
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _keyValue("Present", "21"),
                const SizedBox(
                  height: 16,
                ),
                _keyValue("Absent", "3"),
                const SizedBox(
                  height: 16,
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
          style: AppTextStyle.textStyleRegular16,
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
