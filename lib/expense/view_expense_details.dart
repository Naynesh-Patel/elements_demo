import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/expense_controller.dart';
import 'package:elements/date_piker.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ViewExpenseDetails extends StatefulWidget {
  const ViewExpenseDetails({super.key});

  @override
  State<ViewExpenseDetails> createState() => _ViewExpenseDetailsState();
}

class _ViewExpenseDetailsState extends State<ViewExpenseDetails> {
  ExpenseController controller = Get.find();
  bool value = false;
  int index = 0;

  @override
  void initState() {
    controller.getExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          // action: [
          //   InkWell(
          //       onTap: () {},
          //       child: Padding(
          //         padding: const EdgeInsets.only(right: 20),
          //         child: Image.asset(
          //           "assets/images/filtter.png",
          //           height: 20,
          //           width: 20,
          //         ),
          //       )),
          // ],
          title: 'View Expense',
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              height: Get.height,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  tableTopContent(),
                  Obx(() => ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.expenseList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              _tableView(
                                name:
                                    controller.expenseList[index]['name'] ?? '',
                                date: controller.expenseList[index]
                                        ['created_at'] ??
                                    '',
                                type: controller.expenseList[index]
                                        ['expense_type'] ??
                                    '',
                                price: controller.expenseList[index]['price'] ??
                                    '',
                              ),
                            ],
                          );
                        },
                      ))
                ],
              )
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
              //       label: Text('Qty'),
              //     ),
              //   ],
              //   rows: List<DataRow>.generate(
              //     2,
              //     (index) => const DataRow(cells: [
              //       DataCell(Text('Steel Bolt')),
              //       DataCell(Text('5/10/2023')),
              //       DataCell(Text('20')),
              //     ]),
              //   ),
              // ),
              ),
        ));
  }

  Widget _tableView({required String type, price, name, date}) {
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
            Expanded(
              child: Text(type, style: AppTextStyle.textStyleRegular13),
            ),
            Text(price, style: AppTextStyle.textStyleRegular13),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Divider(),
      ],
    );
  }

  Widget tableTopContent() {
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
            child: Text("Type", style: AppTextStyle.textStyleRegular14),
          ),
          Text("Price", style: AppTextStyle.textStyleRegular14),
        ],
      ),
    );
  }

  dateTimeFormet(date) {
    return DateFormat('dd-MM-yyyy').format(date); // you can set your formet
  }
}
