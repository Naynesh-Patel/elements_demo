import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/constant/methods.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/order_controller.dart';
import 'package:elements/home/invoice.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../create_new_order.dart';

class UpComingTab extends StatefulWidget {
  const UpComingTab({super.key});

  @override
  State<UpComingTab> createState() => _UpComingTabState();
}

class _UpComingTabState extends State<UpComingTab> {
  OrderController orderController = Get.find();
  CustomerController customerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => orderController.isGetOrderLoading.value
        ? const CustomLoader()
        : orderController.orderList.isEmpty
            ? const EmptyView()
            : ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: orderController.orderList.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(CreateNewOrder(
                          isView: true,
                          model: orderController.orderList[index]));
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColor.borderColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _keyValue(
                                "OD",
                                getDateInDDMMYY(DateTime.parse(orderController
                                    .orderList[index]['created_at'])),
                              ),
                              _keyValue(
                                "DD",
                                getDateInDDMMYY(DateTime.parse(orderController
                                    .orderList[index]['delivery_date'])),
                              ),
                            ],
                          ),
                          verticalSpacing(),
                          _keyValue(
                            "Client",
                            orderController.orderList[index]
                                ['customer_company_id'],
                          ),
                          verticalSpacing(),
                          _keyValue(
                            "Machine Type",
                            orderController.orderList[index]['machine_ids'],
                          ),
                          verticalSpacing(),
                          _keyValue(
                            "Total Payment",
                            orderController.orderList[index]['total_payment'],
                          ),
                          verticalSpacing(),
                          _keyValue(
                            "Advance Payment",
                            orderController.orderList[index]['advance_payment'],
                          ),
                          verticalSpacing(),
                          _keyValue(
                            "Assigned Order",
                            orderController.orderList[index]['assign_order_id'],
                          ),
                          verticalSpacing(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SmallButton(
                                title: "Invoice",
                                textColor: AppColor.selectColor,
                                onTap: () {
                                  Get.to(const Invoice());
                                },
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SmallButton(
                                  title: "  Edit  ",
                                  onTap: () {
                                    Get.to(CreateNewOrder(
                                      model: orderController.orderList[index],
                                    ));
                                  },
                                  textColor: const Color(0xff555555)),
                              const SizedBox(
                                width: 10,
                              ),
                              SmallButton(
                                  title: "Delete",
                                  onTap: () {
                                    CustomDialogBox.showDeleteDialog(
                                      context: context,
                                      bodyText:
                                          "Do you really want to cancel these records? This process cannot be undone.",
                                      onCancelTap: () {
                                        Get.back();
                                      },
                                      onDeleteTap: () {
                                        orderController.deleteUser(
                                            orderController.orderList[index]
                                                ['id']);
                                        orderController.orderList
                                            .removeAt(index);
                                        Get.back();
                                      },
                                    );
                                  },
                                  textColor: const Color(0xffB50A0A)),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ));
  }

  Widget _keyValue(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$key : ",
          style: AppTextStyle.textStyleRegular16
              .copyWith(color: const Color(0xff272727)),
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

  Widget emptyView() {
    return Container(
      height: Get.height * 0.55,
      padding: const EdgeInsets.symmetric(horizontal: 110.0),
      child: Image.asset(
        alignment: Alignment.center,
        "assets/images/no_order.png",
      ),
    );
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 8,
    );
  }
}
