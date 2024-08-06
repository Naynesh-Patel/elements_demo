import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/constant/methods.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_datepiker.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ViewSparepartsDetails extends StatefulWidget {
final  String name;
  const ViewSparepartsDetails( {super.key,required this.name});

  @override
  State<ViewSparepartsDetails> createState() => _ViewSparepartsDetailsState();
}

class _ViewSparepartsDetailsState extends State<ViewSparepartsDetails> {

  SparepartsController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: widget.name,
        ),
        body: Obx(()=> controller.isLoading.value ? const CustomLoader() : controller.historyList.isNotEmpty ? SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              height: Get.height,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  tableTopContent(),
                  Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.historyList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          _tableView(
                            // name:controller.expenseList[index]['name'] ?? '',
                            date: "${controller.historyList[index] ['comment']??'' }",
                            type: getDateInDMYYYY(DateTime.parse(controller.historyList[index] ['create_at']??'')),
                            price: controller.historyList[index]['qty']?? '',
                          ),
                        ],
                      );
                    },
                  )),
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
        ) : const Center(child: Text("No Data"))));
  }

  Widget _tableView({required String type, price, date}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Row(
            children: [
              // Expanded(child: Text(name, style: AppTextStyle.textStyleRegular13)),
              Expanded(
                flex: 2,
                  child: Text("$date", style: AppTextStyle.textStyleRegular13)),
              Expanded(
                flex: 2,
                child: Text(type,textAlign: TextAlign.center, style: AppTextStyle.textStyleRegular13),
              ),
              Expanded(child: Text(price,textAlign: TextAlign.end,style: AppTextStyle.textStyleRegular13)),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget tableTopContent() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      decoration: const BoxDecoration(color: Color(0xffF1F1F1)),
      child: Row(
        children: [
          // Expanded(
          //     child: Text(
          //   "Name",
          //   style: AppTextStyle.textStyleRegular14
          //       .copyWith(color: AppColor.selectColor),
          // )),
          Expanded(
            flex: 2,
            child: Text("Description", style: AppTextStyle.textStyleRegular14),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
                Get.to(const CustomDatePicker());
              },
              child: Container(
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Date",textAlign: TextAlign.center,
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
          ),
          Expanded(child: Text("Qty", textAlign: TextAlign.end,style: AppTextStyle.textStyleRegular14)),
        ],
      ),
    );
  }

}
