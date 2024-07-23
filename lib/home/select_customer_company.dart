import 'dart:convert';

import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/controller/order_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCustomerCompany extends StatefulWidget {
  const SelectCustomerCompany({super.key});

  @override
  State<SelectCustomerCompany> createState() => _SelectCustomerCompanyState();
}

class _SelectCustomerCompanyState extends State<SelectCustomerCompany> {
  @override
  void initState() {
    super.initState();
    customerController.getCustomer();
  }

  MachineryController controller = Get.find();

  OrderController orderController = Get.find();
  bool isSelect = true;
  CustomerController customerController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Select User/Company',
        onPressed: () {
          Get.back();
        },
      ),
      body: Obx(() => customerController.isGetCustomerLoading.value
          ? const CustomLoader()
          : customerController.customerList.isEmpty
              ? const EmptyView()
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: customerController.customerList.length,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        customerController.companyTextEditingController.text =
                            customerController.customerList[index]['owner'];
                        customerController.id.text =
                            customerController.customerList[index]['id'];
                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 45,
                                child: customerController.customerList[index]
                                            ['photo'] ==
                                        ""
                                    ? Image.asset(
                                        'assets/images/user_profile.png',
                                        fit: BoxFit.cover,
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: Image.memory(
                                          base64Decode(customerController
                                              .customerList[index]['photo']),
                                          fit: BoxFit.cover,
                                        )),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        customerController.customerList[index]
                                                ['company'] ??
                                            '',
                                        style: AppTextStyle.textStyleRegular16
                                            .copyWith(
                                          color: const Color(0xff272727),
                                        )),
                                    const SizedBox(
                                      height: 2.0,
                                    ),
                                    Text(
                                        customerController.customerList[index]
                                                ['owner'] ??
                                            '',
                                        style: AppTextStyle.textStyleRegular14
                                            .copyWith(
                                          color: const Color(0xff555555),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20.0,
                    );
                  },
                )),
    );
  }
}
