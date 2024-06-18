import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../date_piker.dart';

class AttendanceTab extends StatefulWidget {
  const AttendanceTab({super.key});

  @override
  State<AttendanceTab> createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  bool value = false;
  int index = 0;

  List<dynamic> filterList = [
    {
      "name":"Aarsh",
      "select":false,
    },
    {
    "name":"Dipesh",
    "select":false,
  },
    {
      "name":"Suresh",
      "select":false,
    },
    {
      "name":"Nihal",
      "select":false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HomeAppBar(
          title: "Attendance",
          action: [
            InkWell(
              onTap: () {
                filterDialog();
              },
              child: Image.asset(
                "assets/images/filtter.png",
                height: 20,
                width: 20,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              "assets/svg/ic_notification.svg",
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              _tableTopContent(),
              _tableView(
                  name: 'Ragnor',
                  date: "5/10/2023",
                  checkIn: "10.00 AM",
                  checkOut: "6.00 PM"),
              _tableView(
                  name: 'Dipesh',
                  date: "5/10/2023",
                  checkIn: "10.00 AM",
                  checkOut: "-",
                  isWeeklyOff: true),
              _tableView(
                  name: 'Valent',
                  date: "5/10/2023",
                  checkIn: "10.00 AM",
                  checkOut: "-"),
              _tableView(
                name: 'Ramesh',
                date: "5/10/2023",
                checkIn: "10.00 AM",
                checkOut: "6.00 PM",
              ),
              _tableView(
                name: 'Suresh',
                date: "5/10/2023",
                checkIn: "10.00 AM",
                checkOut: "6.00 PM",
              ),
            ],
          ),
          // child: DataTable2(
          //   dividerThickness: 0.1,
          //   columnSpacing: 10,
          //   horizontalMargin: 5.0,
          //   minWidth: Get.width,
          //   headingRowColor: MaterialStateProperty.all<Color>(
          //       const Color(0xffF1F1F1).withOpacity(0.60)),
          //   // dataRowColor: MaterialStateProperty.all<Color>(Colors.white),
          //   dataTextStyle: const TextStyle(color: Color(0xff555555)),
          //   columns: [
          //      DataColumn(
          //       label: Text(
          //         'Name',
          //         style: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.selectColor),
          //       ),
          //     ),
          //     DataColumn(
          //       label: Row(
          //         children: [
          //           const Text(
          //             'Date',
          //             style: TextStyle(
          //               color: AppColor.buttonColor,
          //             ),
          //           ),
          //           const SizedBox(
          //             width: 5,
          //           ),
          //           InkWell(
          //             onTap: () {
          //               Get.to(const DatePiker());
          //             },
          //             child: Image.asset(
          //               "assets/images/date.png",
          //               height: 14,
          //               width: 14,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //     const DataColumn(
          //       label: Text('Chek In'),
          //     ),
          //     const DataColumn(
          //       label: Text('Chek Out'),
          //     ),
          //   ],
          //   rows: List<DataRow>.generate(
          //     4,
          //     (index) => const DataRow(cells: [
          //       DataCell(Text('Dipesh')),
          //       DataCell(Text('5/10/2023')),
          //       DataCell(Text('10:00 AM')),
          //       DataCell(Text("06:00 PM")),
          //     ]),
          //   ),
          // ),
        ));
  }

  Future<void> filterDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder:(context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text("Filters",
                                  style: AppTextStyle.textStyleBold16),
                            ),
                          ),
                          IconButton(onPressed: () {
                            Get.back();
                          }, icon: const Icon(Icons.clear)),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0.0),
                      child: Text(
                        "User Name List",
                        style: AppTextStyle.textStyleBold13,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: filterList.length,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 0.0),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              borderRadius: BorderRadius.circular(6.0),
                              onTap: () {
                                if(filterList[index]['select']==null){
                                  filterList[index]['select'] = true;
                                }else if(filterList[index]['select'] == true){
                                  filterList[index]['select'] = false;
                                }else{
                                  filterList[index]['select'] = true;
                                }
                                setState(() {

                                });

                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 4.0,vertical: 4.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.dropDownHintColor
                                    ),
                                    borderRadius: BorderRadius.circular(6.0)
                                ),
                                child: Icon(Icons.check_rounded,size: 14,color: filterList[index]['select']??false ? AppColor.blackColor : Colors.transparent,),
                              ),
                            ),
                            SizedBox(width: 4.0,),
                            Text(
                              "${filterList[index]['name']}",
                              style: AppTextStyle.textStyleRegular14,
                            ),
                          ],
                        );
                      }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 8.0,
                      );
                    },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SmallButton(
                          title: "Clear",
                          onTap: () {

                          },
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        SmallButton(
                          title: "Apply",
                          onTap: () {  },
                          textColor: AppColor.whiteColor,
                          bodyColor: AppColor.selectColor,
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                  ]),
              // actions: [
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       InkWell(
              //         onTap: () {
              //           Get.back();
              //         },
              //         child: Container(
              //             padding: const EdgeInsets.symmetric(
              //                 vertical: 8, horizontal: 23),
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(4),
              //                 // color: const Color(0xffC9C9C9),
              //                 border: Border.all(color: const Color(0xffC9C9C9))),
              //             child: const Text("Clear",
              //                 style: TextStyle(
              //                     color: Colors.black,
              //                     fontSize: 18,
              //                     fontWeight: FontWeight.w400))),
              //       ),
              //       const SizedBox(
              //         width: 20,
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Get.back();
              //         },
              //         child: Container(
              //             padding: const EdgeInsets.symmetric(
              //                 vertical: 8, horizontal: 23),
              //             decoration: BoxDecoration(
              //                 color: const Color(0xff01959F),
              //                 borderRadius: BorderRadius.circular(4)),
              //             child: const Text("Apply",
              //                 style: TextStyle(
              //                     color: Colors.white,
              //                     fontSize: 18,
              //                     fontWeight: FontWeight.w400))),
              //       ),
              //     ],
              //   ),
              // ],
            );
          },
        );
      },
    );
  }

  Widget _tableTopContent() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      decoration: const BoxDecoration(color: Color(0xffF1F1F1)),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "Name",
            style: AppTextStyle.textStyleRegular14
                .copyWith(color: AppColor.selectColor),
          )),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.to(const DatePiker());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Date",
                    style: AppTextStyle.textStyleRegular14
                        .copyWith(color: AppColor.selectColor),
                  ),
                  const SizedBox(
                    width: 2.0,
                  ),
                  Image.asset(
                    "assets/images/date.png",
                    height: 14,
                    width: 14,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Text("Check In", style: AppTextStyle.textStyleRegular14)),
          Text("Check Out", style: AppTextStyle.textStyleRegular14),
        ],
      ),
    );
  }

  Widget _tableView({required String name, date, checkIn, checkOut, bool isWeeklyOff = false}) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(name, style: AppTextStyle.textStyleRegular13)),
              Expanded(
                  child: Text("$date", style: AppTextStyle.textStyleRegular13)),
              if (isWeeklyOff) ...[
                Expanded(
                  flex: 2,
                  child: Text(
                    "Weekly Off",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.textStyleRegular13
                        .copyWith(color: AppColor.selectColor),
                  ),
                ),
              ] else ...[
                Expanded(
                    child:
                        Text(checkIn, style: AppTextStyle.textStyleRegular13)),
                Expanded(
                    child: Text(checkOut,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleRegular13)),
              ]
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Divider(),
        ],
      ),
    );
  }


}
