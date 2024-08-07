import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/constant/methods.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:elements/interface/refresh_content.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'button/custom_button.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController? txtStartDate;
  final TextEditingController? txtEndDate;
  final TextEditingController? noOfNight;
  final RefreshContent? refreshContent;


  final bool isFromReadymade;
  final DateTime? startDefaultDate;
  final DateTime? endDefaultDate;


  const CustomDatePicker(
      {super.key,
      this.txtStartDate,
      this.txtEndDate,
      this.noOfNight,
      this.refreshContent,
      this.isFromReadymade = false,
      this.startDefaultDate,
      this.endDefaultDate});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  RxString startDate = ''.obs;
  RxString endDate = ''.obs;
  String _rangeCount = '0';
  DateTime? startDefaultDate;
  DateTime? endDefaultDate;
  SparepartsController sparepartsController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startDefaultDate = widget.startDefaultDate;
    endDefaultDate = widget.endDefaultDate;
    sparepartsController.startDate = widget.startDefaultDate;
    sparepartsController.endDate = widget.endDefaultDate;
    if(widget.startDefaultDate!= null){
      startDate.value = DateFormat('dd-MMM-yyyy').format(widget.startDefaultDate!);
    }
    if(widget.endDefaultDate!= null){
      endDate.value = DateFormat('dd-MMM-yyyy').format(widget.endDefaultDate!);
    }

    // if (widget.txtStartDate!.text.isNotEmpty) {
    //   startDefaultDate = DateFormat("dd-MMM-yyyy").parse(widget.txtStartDate!.text.toString());
    //   endDefaultDate = DateFormat("dd-MMM-yyyy").parse(widget.txtEndDate!.text.toString());
    //   _rangeCount = (daysBetween(     DateFormat('dd-MMM-yyyy').format(startDefaultDate!),  DateFormat('dd-MMM-yyyy').format(endDefaultDate!))).toString();
    //   startDate = widget.txtStartDate!.text;
    //   endDate = widget.txtEndDate!.text;
    // }
  }

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  // void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   setState(() {
  //     if (args.value is PickerDateRange) {
  //       startDate = DateFormat('dd-MMM-yyyy').format(args.value.startDate);
  //       endDate = DateFormat('dd-MMM-yyyy').format(args.value.endDate ?? args.value.startDate);
  //       sparepartsController.startDate = args.value.startDate ;
  //       sparepartsController.endDate = args.value.endDate ;
  //       widget.txtStartDate?.text = startDate;
  //       widget.txtEndDate?.text = endDate;
  //       // widget.txtEndDate!.text=endDate;
  //       _rangeCount = (daysBetween( DateFormat('dd-MMM-yyyy').format(args.value.startDate),
  //               DateFormat('dd-MMM-yyyy') .format(args.value.endDate ?? args.value.startDate)))
  //           .toString();
  //       widget.noOfNight?.text = _rangeCount;
  //     } else if (args.value is DateTime) {
  //       startDate = DateFormat('dd-MMM-yyyy').format(args.value);
  //       DateTime endDateTime =
  //           args.value.add(Duration(days: int.parse(widget.noOfNight!.text)));
  //       endDate = DateFormat('dd-MMM-yyyy').format(endDateTime);
  //       widget.txtStartDate?.text = startDate;
  //       widget.txtEndDate?.text = endDate;
  //     } else if (args.value is List<DateTime>) {
  //     } else {
  //       _rangeCount = args.value.length.toString();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:  CustomAppBar(
        title: 'Select Date',
        onPressed: (){
          Get.back();
        },
      ),
      body: Column(
        children: [
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              calendarType: CalendarDatePicker2Type.range,
              calendarViewMode: CalendarDatePicker2Mode.day,
              controlsHeight: 50.0,
              controlsTextStyle: AppTextStyle.textStyleRegular16,
              customModePickerIcon:const SizedBox(),
              dayTextStyle: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.dropDownHintColor),
              disabledDayTextStyle: AppTextStyle.textStyleRegular14,
              weekdayLabelTextStyle: AppTextStyle.textStyleRegular14,
              selectedDayHighlightColor:AppColor.buttonColor,
              nextMonthIcon:const Icon(Icons.arrow_forward_ios_rounded,size: 16,color: AppColor.blackColor,),
              lastMonthIcon:const Icon(Icons.arrow_back_ios_rounded,size: 16,color: AppColor.blackColor,),
              // hideYearPickerDividers: true,
              // selectedDayTextStyle: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.whiteColor)
            ),
            onValueChanged: (dates) {
              startDate.value = DateFormat('dd-MMM-yyyy').format(dates.first);
              endDate.value = DateFormat('dd-MMM-yyyy').format(dates.last);
              sparepartsController.startDate = dates.first;
              sparepartsController.endDate = dates.last;
            },
            value: [
              startDefaultDate,
              endDefaultDate
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 7),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.red.withOpacity(0.20),
                              width: 1),
                          borderRadius: BorderRadius.circular(2)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Start Date".toUpperCase(),
                            style: AppTextStyle.textStyleBold10
                                .copyWith(color: Colors.grey.shade500),
                          ),
                          Obx(()=>Text(startDate.value,
                              style: AppTextStyle.textStyleBold12))
                        ],
                      ),
                    )),
                const SizedBox(width: 16.0,),
                Expanded(
                    child: Container(
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 7),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.red.withOpacity(0.20),
                              width: 1),
                          borderRadius: BorderRadius.circular(2)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "End Date".toUpperCase(),
                            style: AppTextStyle.textStyleBold10
                                .copyWith(color: Colors.grey.shade500),
                          ),
                         Obx(()=> Text(endDate.value,
                             style: AppTextStyle.textStyleBold12))
                        ],
                      ).paddingOnly(left: 20),
                    )),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar:  Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomButton(
          buttonText: "Done",
          onTap: () {
            if (widget.refreshContent != null) {
              widget.refreshContent!.refreshPage();
            }
            Get.back(result: true);
          },
          color: AppColor.buttonColor,
          isLoading: false.obs,
        ),
      ),
    );
  }
}
