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
  String startDate = '';
  String endDate = '';
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

    // if (widget.txtStartDate!.text.isNotEmpty) {
    //   startDefaultDate = DateFormat("dd-MMM-yyyy").parse(widget.txtStartDate!.text.toString());
    //   endDefaultDate = DateFormat("dd-MMM-yyyy").parse(widget.txtEndDate!.text.toString());
    //   _rangeCount = (daysBetween(     DateFormat('dd-MMM-yyyy').format(startDefaultDate!),  DateFormat('dd-MMM-yyyy').format(endDefaultDate!))).toString();
    //   startDate = widget.txtStartDate!.text;
    //   endDate = widget.txtEndDate!.text;
    // }
  }

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        startDate = DateFormat('dd-MMM-yyyy').format(args.value.startDate);
        endDate = DateFormat('dd-MMM-yyyy').format(args.value.endDate ?? args.value.startDate);
        sparepartsController.startDate = args.value.startDate ;
        sparepartsController.endDate = args.value.endDate ;
        widget.txtStartDate?.text = startDate;
        widget.txtEndDate?.text = endDate;
        // widget.txtEndDate!.text=endDate;
        _rangeCount = (daysBetween( DateFormat('dd-MMM-yyyy').format(args.value.startDate),
                DateFormat('dd-MMM-yyyy') .format(args.value.endDate ?? args.value.startDate)))
            .toString();
        widget.noOfNight?.text = _rangeCount;
      } else if (args.value is DateTime) {
        startDate = DateFormat('dd-MMM-yyyy').format(args.value);
        DateTime endDateTime =
            args.value.add(Duration(days: int.parse(widget.noOfNight!.text)));
        endDate = DateFormat('dd-MMM-yyyy').format(endDateTime);
        widget.txtStartDate?.text = startDate;
        widget.txtEndDate?.text = endDate;
      } else if (args.value is List<DateTime>) {
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        title: 'Select Date',
        onPressed: (){
          Get.back();
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: SfDateRangePicker(
              monthViewSettings: const DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
              onSelectionChanged: _onSelectionChanged,
              selectionMode: widget.isFromReadymade
                  ? DateRangePickerSelectionMode.single
                  : DateRangePickerSelectionMode.range,
              // maxDate: widget.maxDate,
              // minDate: widget.minDate,
              // enablePastDates: false,
              allowViewNavigation: false,
              endRangeSelectionColor: Colors.grey,
              startRangeSelectionColor: Colors.grey,
              selectionColor: Colors.grey,
              rangeSelectionColor: Colors.grey.withOpacity(0.20),
              backgroundColor: Colors.grey.shade50,
              selectionShape: DateRangePickerSelectionShape.rectangle,
              rangeTextStyle: AppTextStyle.textStyleBold12,
              selectionTextStyle: AppTextStyle.textStyleBold12,
              headerHeight: 50,
              selectionRadius: 4,
              toggleDaySelection: false,
              monthCellStyle: DateRangePickerMonthCellStyle(
                cellDecoration: const BoxDecoration(color: Colors.white),
                textStyle: AppTextStyle.textStyleRegular12,
              ),
              navigationDirection: DateRangePickerNavigationDirection.vertical,
              navigationMode: DateRangePickerNavigationMode.scroll,
              headerStyle: DateRangePickerHeaderStyle( textStyle: AppTextStyle.textStyleRegular12,
              ),
              initialSelectedRange: PickerDateRange(startDefaultDate, endDefaultDate),
              initialSelectedDate: DateTime.now(),
              initialDisplayDate: DateTime.now(),
            ),
          ),
          Material(
            elevation: 20,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                    height: 60,
                    child: Stack(
                      children: [
                        Row(
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
                                  Text(startDate,
                                      style: AppTextStyle.textStyleBold12)
                                ],
                              ),
                            )),
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
                                  Text(endDate,
                                      style: AppTextStyle.textStyleBold12)
                                ],
                              ).paddingOnly(left: 20),
                            )),
                          ],
                        ),
                        // Center(
                        //   child: Container(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 4, vertical: 2),
                        //     decoration: BoxDecoration(
                        //         color: Colors.grey,
                        //         borderRadius: BorderRadius.circular(16)),
                        //     child: Text(
                        //       "$_rangeCount DAYS",
                        //       style: AppTextStyle.textStyleBold10
                        //           .copyWith(color: Colors.white),
                        //     ),
                        //   ),
                        // )
                      ],
                    )),
                CustomButton(
                  buttonText: "Done",
                  onTap: () {
                    if (widget.refreshContent != null) {
                      widget.refreshContent!.refreshPage();
                    }
                    Get.back(result: true);
                  },
                  color: AppColor.buttonColor,
                  isLoading: false.obs,
                )
              ],
            ).paddingAll(16),
          )
        ],
      ),
    );
  }
}
