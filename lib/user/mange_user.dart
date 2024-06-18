import 'package:elements/constant/app_colors.dart';
import 'package:elements/user/add_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/app_text_style.dart';
import '../date_piker.dart';

class MangeUser extends StatefulWidget {
  const MangeUser({super.key});

  @override
  State<MangeUser> createState() => _MangeUserState();
}

class _MangeUserState extends State<MangeUser> {
  bool value = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Mange User",
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
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            _tableTopContent(),
            _tableView(
              name: 'Dipesh',
              date: "5/10/2023",
              Authoriy: 'Worker',
            ),
            _tableView(
              name: 'Dipesh',
              date: "5/10/2023",
              Authoriy: 'Worker',
            ),
            _tableView(
              name: 'Dipesh',
              date: "5/10/2023",
              Authoriy: 'Helper',
            ),
          ],
        ),
        // child: DataTable2(
        //   dividerThickness: 0.2,
        //   columnSpacing: 20,
        //   horizontalMargin: 5,
        //   minWidth: 400,
        //   headingRowColor: MaterialStateProperty.all<Color>(
        //       const Color(0xffF1F1F1).withOpacity(0.60)),
        //   // dataRowColor: MaterialStateProperty.all<Color>(Colors.white),
        //   dataTextStyle: const TextStyle(color: Color(0xff555555)),
        //   columns: [
        //     const DataColumn2(
        //       label: Text(
        //         'Name',
        //         style: TextStyle(
        //           color: AppColor.buttonColor,
        //         ),
        //       ),
        //       size: ColumnSize.L,
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
        //             onTap: () {},
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
        //       label: Text('Authority'),
        //     ),
        //   ],
        //   rows: List<DataRow>.generate(
        //     3,
        //     (index) => const DataRow(cells: [
        //       DataCell(Text('Dipesh')),
        //       DataCell(Text('5/10/2023')),
        //       DataCell(Text('Worker')),
        //     ]),
        //   ),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Get.to(const AddUser());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Widget _tableView(
      {required String Authoriy, name, date, bool isWeeklyOff = false}) {
    return Column(
      children: [
        const SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            Expanded(child: Text(name, style: AppTextStyle.textStyleRegular13)),
            Expanded(
                child: Text("$date", style: AppTextStyle.textStyleRegular13)),
            Text(Authoriy, style: AppTextStyle.textStyleRegular13)
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
      ],
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
          Text("Authoriy", style: AppTextStyle.textStyleRegular14),
        ],
      ),
    );
  }
}
