import 'package:data_table_2/data_table_2.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AttendanceTab extends StatefulWidget {
  const AttendanceTab({super.key});

  @override
  State<AttendanceTab> createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  bool value = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xffF9F9F9),
          title: const Text(
            "Attendance",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    filterDialog();
                  },
                  child: Image.asset(
                    "assets/images/filtter.png",
                    height: 20,
                    width: 20,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/svg/ic_notification.svg",
                height: 22,
                width: 22,
              ),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DataTable2(
            dividerThickness: 0.1,
            columnSpacing: 10,
            horizontalMargin: 5,
            minWidth: 250,
            headingRowColor: MaterialStateProperty.all<Color>(
                const Color(0xffF1F1F1).withOpacity(0.60)),
            // dataRowColor: MaterialStateProperty.all<Color>(Colors.white),
            dataTextStyle: const TextStyle(color: Color(0xff555555)),
            columns: [
              const DataColumn2(
                label: Text(
                  'Name',
                  style: TextStyle(
                    color: AppColor.buttonColor,
                  ),
                ),
                size: ColumnSize.L,
              ),
              DataColumn(
                label: Row(
                  children: [
                    const Text(
                      'Date',
                      style: TextStyle(
                        color: AppColor.buttonColor,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        "assets/images/date.png",
                        height: 14,
                        width: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const DataColumn(
                label: Text('Chek In'),
              ),
              const DataColumn(
                label: Text('Chek Out'),
              ),
            ],
            rows: List<DataRow>.generate(
              4,
              (index) => const DataRow(cells: [
                DataCell(Text('Dipesh')),
                DataCell(Text('5/10/2023')),
                DataCell(Text('10:00 AM')),
                DataCell(Text("06:00 PM")),
              ]),
            ),
          ),
        ));
  }

  Future<void> filterDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          backgroundColor: Colors.white,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      "Filters",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.clear),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
            ),
            const Text(
              "User Name List",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.white,
                      value: value,
                      onChanged: (value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ), //Ch
                    const Text(
                      "Nehal",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                );
              },
            )
          ]),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 23),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          // color: const Color(0xffC9C9C9),
                          border: Border.all(color: const Color(0xffC9C9C9))),
                      child: const Text("Clear",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400))),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 23),
                      decoration: BoxDecoration(
                          color: const Color(0xff01959F),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Text("Apply",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400))),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
