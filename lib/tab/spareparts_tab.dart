import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SparepartsTab extends StatefulWidget {
  const SparepartsTab({super.key});

  @override
  State<SparepartsTab> createState() => _SparepartsTabState();
}

class _SparepartsTabState extends State<SparepartsTab> {
  SparepartsController controller = Get.find();

  @override
  void initState() {
    setState(() {
      controller.getSpareparts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HomeAppBar(
        title: "Spareparts Stocks",
        // action: [
        //   SvgPicture.asset(
        //     'assets/svg/ic_notification.svg',
        //     height: 20,
        //     width: 20,
        //   ),
        //   const SizedBox(
        //     width: 16,
        //   ),
        // ],
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Obx(
            () => controller.isGetSparepartsLoading.value
                ? const CustomLoader()
                : controller.sparepartsList.isEmpty
                    ? const Center(
                        child: Text("Dara Not Found"),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.sparepartsList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            title: Row(
                              children: [
                                Text(controller.sparepartsList[index]['name'] ??
                                    ''.capitalizeFirst),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text('${index + 1}'),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  width: 115,
                                  height: 42,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: const Color(0xffD1D1D1))),
                                  child: TextField(
                                    enabled: false,
                                    keyboardType:
                                        const TextInputType.numberWithOptions(),
                                    maxLength: 3,
                                    textAlignVertical: TextAlignVertical.center,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        counterText: '',
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 13),
                                        hintText: controller
                                                .sparepartsList[index]['qty'] ??
                                            '',
                                        helperStyle: AppTextStyle
                                            .textStyleLight16
                                            .copyWith(
                                                color:
                                                    AppColor.dropDownHintColor),
                                        hintStyle: AppTextStyle.textStyleLight14
                                            .copyWith(
                                                color: AppColor
                                                    .dropDownHintColor)),
                                  ),
                                ),
                                // const SizedBox(
                                //   width: 12,
                                // ),
                                // InkWell(
                                //   borderRadius: BorderRadius.circular(10),
                                //   onTap: () {
                                //     Get.to(AddSpareparts(
                                //       model: controller.sparepartsList[index],
                                //     ));
                                //   },
                                //   child: Container(
                                //       decoration: BoxDecoration(
                                //           // color: const Color(0xffFFFFFF),
                                //           borderRadius:
                                //               BorderRadius.circular(4),
                                //           border: Border.all(
                                //               color:
                                //                   const Color(0xffD1D1D1))),
                                //       padding: const EdgeInsets.symmetric(
                                //           vertical: 12, horizontal: 12),
                                //       child: SvgPicture.asset(
                                //         'assets/svg/ic_edit.svg',
                                //         height: 16,
                                //         width: 16,
                                //       )),
                                // ),
                              ],
                            ),
                          );
                        },
                      ),
          )),
      // floatingActionButton: FloatingActionButton(
      //     elevation: 10.0,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(36),
      //     ),
      //     backgroundColor: AppColor.buttonColor,
      //     onPressed: () {
      //       Get.to(const AddSparepartsTab());
      //     },
      //     child: const Icon(
      //       Icons.add,
      //       color: Colors.white,
      //     )),
    );
  }
}
