import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/methods.dart';
import '../controller/spareparts_controller.dart';
import '../date_piker.dart';
import '../widget/button/small_button.dart';

class ViewSparepartsDetails extends StatefulWidget {
  const ViewSparepartsDetails({super.key});

  @override
  State<ViewSparepartsDetails> createState() => _ViewSparepartsDetailsState();
}

class _ViewSparepartsDetailsState extends State<ViewSparepartsDetails> {
  SparepartsController controller = Get.find();
  bool value = false;
  int index = 0;

  List<dynamic> filterList = [
    {
      "name": "Arash",
      "select": false,
    },
    {
      "name": "Dipesh",
      "select": false,
    },
    {
      "name": "Suresh",
      "select": false,
    },
    {
      "name": "Nihal",
      "select": false,
    },
  ];

  @override
  void initState() {
    controller.getSpareparts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          action: [
            IconButton(
                onPressed: () {
                  filterDialog();
                },
                icon: Image.asset(
                  "assets/images/filtter.png",
                  height: 20,
                  width: 20,
                )),
          ],
          title: 'View Spareparts Details',
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _tableTopContent(),
              SizedBox(
                height: Get.height * 0.4,
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.sparepartsList.length,
                    itemBuilder: (context, index) {
                      return _tableView(
                        name: controller.sparepartsList[index]['name'] ?? '',
                        // date:
                        //     controller.sparepartsList[index]['create_at'] ?? '',
                        date: getDateInDDMMYY(DateTime.parse(
                            controller.sparepartsList[index]['create_at'])),
                        qty: controller.sparepartsList[index]['qty'] ?? '',
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _tableView({required String qty, name, date}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(name, style: AppTextStyle.textStyleRegular13)),
              Expanded(
                  child: Text("$date",
                      textAlign: TextAlign.center,
                      style: AppTextStyle.textStyleRegular13)),
              Expanded(
                  child: Text(qty,
                      textAlign: TextAlign.end,
                      style: AppTextStyle.textStyleRegular13)),
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
          Text("Qty",
              style: AppTextStyle.textStyleRegular14
                  .copyWith(color: AppColor.selectColor)),
        ],
      ),
    );
  }

  Future<void> filterDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
              contentPadding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              scrollable: true,
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
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(Icons.clear)),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 0.0),
                      child: Text(
                        "User Name List",
                        style: AppTextStyle.textStyleBold13,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 100,
                      width: Get.width,
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: filterList.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0.0),
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(6.0),
                                onTap: () {
                                  if (filterList[index]['select'] == null) {
                                    filterList[index]['select'] = true;
                                  } else if (filterList[index]['select'] ==
                                      true) {
                                    filterList[index]['select'] = false;
                                  } else {
                                    filterList[index]['select'] = true;
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColor.dropDownHintColor),
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Icon(
                                    Icons.check_rounded,
                                    size: 14,
                                    color: filterList[index]['select'] ?? false
                                        ? AppColor.blackColor
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                              Text(
                                "${filterList[index]['name']}",
                                style: AppTextStyle.textStyleRegular14,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 8.0,
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SmallButton(
                          title: "Clear",
                          onTap: () {
                            Get.back();
                          },
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        SmallButton(
                          title: "Apply",
                          onTap: () {
                            Get.back();
                          },
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
}
