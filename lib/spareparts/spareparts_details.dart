import 'package:data_table_2/data_table_2.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../date_piker.dart';

class SparepartsDetails extends StatefulWidget {
  const SparepartsDetails({super.key});

  @override
  State<SparepartsDetails> createState() => _SparepartsDetailsState();
}

class _SparepartsDetailsState extends State<SparepartsDetails> {
  bool value = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          action: [
            InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Image.asset(
                    "assets/images/filtter.png",
                    height: 20,
                    width: 20,
                  ),
                )),
          ],
          title: 'View Spareparts Details',
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: DataTable2(
            dividerThickness: 0.2,
            columnSpacing: 20,
            horizontalMargin: 5,
            minWidth: 400,
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
                      onTap: () {
                        Get.to(const DatePiker());
                      },
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
                label: Text('Qty'),
              ),
            ],
            rows: List<DataRow>.generate(
              2,
              (index) => const DataRow(cells: [
                DataCell(Text('Steel Bolt')),
                DataCell(Text('5/10/2023')),
                DataCell(Text('20')),
              ]),
            ),
          ),
        ));
  }
}
