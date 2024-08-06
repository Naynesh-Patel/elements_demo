import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:elements/mange_spareparts/add_spareparts.dart';
import 'package:elements/mange_spareparts/view_spareparts_details.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                    : ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.sparepartsList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.startDate = null;
                              controller.endDate = null;
                              controller.getHistory(sparepartId: controller.sparepartsList[ index]['id']);
                              Get.to(  ViewSparepartsDetails(model: controller.sparepartsList[ index],));
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _keyValue( "Name",controller.sparepartsList[index]['name'] ?? ''),
                                      verticalSpacing(),
                                      _keyValue( "Qty",controller.sparepartsList[index]['qty'] ?? ''),
                                    ],
                                  ),
                                ),
                                      SmallButton(
                                        title: "  Edit  ",
                                        onTap: () {
                                          Get.to(AddSpareparts(
                                            model: controller.sparepartsList[index],
                                          ));
                                        },
                                      ),
                              ],
                            ),
                          );
                        }, separatorBuilder: (BuildContext context, int index) {
                          return  Divider(
                            color: Colors.grey.withOpacity(0.2),
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

  Widget _keyValue(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$key : ",
          style: AppTextStyle.textStyleRegular16,
        ),
        Flexible(
            child: Text(
              "$value",
              style: AppTextStyle.textStyleRegular14
                  .copyWith(color: const Color(0xff555555)),
            )),
      ],
    );
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 6.0,
    );
  }

}
