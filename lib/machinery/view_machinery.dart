import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewMachinery extends StatefulWidget {
  const ViewMachinery({super.key, required model, required bool isView});

  @override
  State<ViewMachinery> createState() => _ViewMachineryState();
}

class _ViewMachineryState extends State<ViewMachinery> {
  MachineryController controller = Get.find();

  RxList<dynamic> sparepartsList = [
    {
      "name": "1",
      "select": false,
    },
    {
      "name": "2",
      "select": false,
    },
    {
      "name": "3",
      "select": false,
    },
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "View Machinery",
        onPressed: () {
          Get.back();
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(
                  textEditingController:
                      controller.machineNameTextEditingController,
                  hintText: "Machine Name",
                  labelText: "Machine Name",
                  enable: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textEditingController:
                      controller.machinetypeEditingController,
                  hintText: "Machine Type",
                  labelText: "Machine Type",
                  enable: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textEditingController: controller.qtyTextEditingController,
                  hintText: "Qty",
                  labelText: "Qty",
                  enable: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextField(
                  textEditingController:
                      controller.manufactureDurationTextEditingController,
                  hintText: "Eg. 30 days",
                  labelText: "Manufacture Duration",
                  enable: false,
                ),
                const SizedBox(
                  height: 16,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Add Spareparts ",
                //       style: AppTextStyle.textStyleRegular18,
                //     ),
                //     IconButton(
                //         padding: EdgeInsets.zero,
                //         constraints: const BoxConstraints(),
                //         style: const ButtonStyle(
                //           tapTargetSize: MaterialTapTargetSize
                //               .shrinkWrap, // the '2023' part
                //         ),
                //         onPressed: () {
                //           controller.machineryList.add(
                //             ModelMachinery(
                //               qtyController: TextEditingController(),
                //               isSelected: false.obs,
                //             ),
                //           );
                //         },
                //         icon: const Icon(
                //           Icons.add,
                //           size: 24,
                //         )),
                //   ],
                // ),
                // const SizedBox(
                //   height: 16,
                // ),
                // Obx(
                //   () => ListView.separated(
                //     shrinkWrap: true,
                //     itemCount: controller.machineryList.length,
                //     itemBuilder: (context, index) {
                //       return Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           InkWell(
                //             borderRadius: BorderRadius.circular(6.0),
                //             onTap: () {
                //               if (controller
                //                       .machineryList[index].isSelected.value ==
                //                   false) {
                //                 controller.machineryList[index].isSelected
                //                     .value = true;
                //               } else {
                //                 controller.machineryList[index].isSelected
                //                     .value = false;
                //               }
                //               debugPrint(
                //                   "Select = ${controller.machineryList[index].isSelected.value}");
                //               // setState(() {});
                //             },
                //             child: Container(
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 4.0, vertical: 4.0),
                //               decoration: BoxDecoration(
                //                   border: Border.all(
                //                       color: AppColor.dropDownHintColor),
                //                   borderRadius: BorderRadius.circular(6.0)),
                //               child: Obx(() => Icon(
                //                     Icons.check_rounded,
                //                     size: 14,
                //                     color: controller.machineryList[index]
                //                             .isSelected.value
                //                         ? AppColor.blackColor
                //                         : Colors.transparent,
                //                   )),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 10.0,
                //           ),
                //           Expanded(
                //             child: Text(
                //               'Spareparts ${index + 1}',
                //               style: AppTextStyle.textStyleRegular16
                //                   .copyWith(color: const Color(0xff555555)),
                //             ),
                //           ),
                //           Container(
                //             width: 115,
                //             height: 42,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(4),
                //                 border:
                //                     Border.all(color: const Color(0xffD1D1D1))),
                //             child: TextField(
                //               controller: controller.qtyTextEditingController,
                //               textAlignVertical: TextAlignVertical.center,
                //               textAlign: TextAlign.center,
                //               keyboardType: TextInputType.number,
                //               decoration: InputDecoration(
                //                 border: InputBorder.none,
                //                 contentPadding: const EdgeInsets.symmetric(
                //                     horizontal: 8.0, vertical: 13.0),
                //                 hintText: 'Qty',
                //                 hintStyle: AppTextStyle.textStyleRegular14
                //                     .copyWith(
                //                         color: AppColor.dropDownHintColor),
                //                 labelStyle: AppTextStyle.textStyleRegular16
                //                     .copyWith(color: AppColor.blackColor),
                //                 helperStyle: AppTextStyle.textStyleRegular16
                //                     .copyWith(
                //                         color: AppColor.dropDownHintColor),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 10.0,
                //           ),
                //         ],
                //       );
                //     },
                //     separatorBuilder: (BuildContext context, int index) {
                //       return const SizedBox(
                //         height: 12.0,
                //       );
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //   child: CustomButton(
      //     color: AppColor.buttonColor,
      //     buttonText: 'Add',
      //     onTap: () {},
      //   ),
      // )
    );
  }
}
