import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/controller/order_controller.dart';
import 'package:elements/home/select_customer_company.dart';
import 'package:elements/home/select_machine.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewOrder extends StatefulWidget {
  final dynamic model;
  const CreateNewOrder({super.key, this.model});

  @override
  State<CreateNewOrder> createState() => _CreateNewOrderState();
}

class _CreateNewOrderState extends State<CreateNewOrder> {
  HomeController controller = Get.find();
  CustomerController customerController = Get.find();

  final _formKey = GlobalKey<FormState>();
  OrderController orderController = Get.find();
  MachineryController machineryController = Get.find();

  @override
  void initState() {
    if (widget.model != null) {
      orderController.customerCompanyIdNoTextEditingController.text =
          widget.model['customer_company_id'] ?? '';
      orderController.totalPaymentEditingController.text =
          widget.model['total_payment'] ?? '';
      orderController.advancePaymentEditingController.text =
          widget.model['advance_payment'] ?? '';
      customerController.companyTextEditingController.text =
          widget.model['advance_payment'] ?? '';
      machineryController.machineNameTextEditingController.text =
          widget.model['machine_ids'] ?? '';
    } else {
      orderController.customerCompanyIdNoTextEditingController.clear();
      orderController.totalPaymentEditingController.clear();
      orderController.advancePaymentEditingController.clear();
      customerController.companyTextEditingController.clear();
      machineryController.machineNameTextEditingController.clear();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          // action: [
          //   Padding(
          //       padding: const EdgeInsets.only(right: 10),
          //       child: IconButton(
          //           onPressed: () {
          //             Get.to(const ViewOrderDetails());
          //           },
          //           icon: const Icon(
          //             Icons.add,
          //           )))
          // ],
          title:
              widget.model != null ? 'Update  New Order' : 'Create  New Order',
          onPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // WidgetDropDownFromField(
                //   hintText: "Select Customer/Company",
                //   labelText: "Customer/Company*",
                //   itemList: const ["Admin", "User", "Seller"],
                //   onTap: (value) {
                //     debugPrint("Select => $value");
                //     // orderController.customerCompany=value;
                //   },
                // ),
                CustomTextField(
                    focusNode: FocusNode(),
                    readOnly: true,
                    onTap: () {
                      Get.to(const SelectCustomerCompany())?.then((value) {
                        customerController.companyTextEditingController.text =
                            value;
                        setState(() {});
                      });
                    },
                    hintText: "Select Customer/Company",
                    labelText: "Customer/Company",
                    textEditingController:
                        customerController.companyTextEditingController,
                    // autoValidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   if(value!.isEmpty){
                    //     return "Please Enter Machine Type";
                    //   }
                    //   else{
                    //     return null;
                    //   }
                    // },
                    suffixFixIcon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: AppColor.blackColor,
                    )),
                verticalSpacing(),
                CustomTextField(
                    focusNode: FocusNode(),
                    readOnly: true,
                    onTap: () {
                      Get.to(const SelectMachine())?.then(
                        (value) {
                          machineryController
                              .machineNameTextEditingController.text = value;
                          setState(() {});
                        },
                      );
                    },
                    hintText: "Select Machine Type*",
                    labelText: "Machine Type",
                    textEditingController:
                        machineryController.machineNameTextEditingController,
                    // autoValidateMode: AutovalidateMode.onUserInteraction,
                    // validator: (value) {
                    //   if(value!.isEmpty){
                    //     return "Please Enter Machine Type";
                    //   }
                    //   else{
                    //     return null;
                    //   }
                    // },
                    suffixFixIcon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: AppColor.blackColor,
                    )),
                verticalSpacing(),
                InkWell(
                  onTap: () async {
                    datePicker();
                  },
                  child: CustomTextField(
                      textEditingController: orderController.date,
                      // textEditingController: orderController.deliveryDateTextEditingController,
                      hintText: "Select Delivery Date",
                      labelText: "Delivery Date",
                      enable: false,
                      focusNode: controller.deliveryDateFocusNode,
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Delivery Date";
                        } else {
                          return null;
                        }
                      },
                      suffixFixIcon: const Icon(
                        Icons.date_range,
                        size: 22,
                      )),
                ),
                verticalSpacing(),
                CustomTextField(
                  hintText: "Total Payment",
                  labelText: "Total Payment",
                  textInputType: TextInputType.number,
                  focusNode: controller.paymentFocusNode,
                  textEditingController:
                      orderController.totalPaymentEditingController,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Total Payment";
                    } else {
                      return null;
                    }
                  },
                ),
                verticalSpacing(),
                CustomTextField(
                  hintText: "Advance Payment",
                  labelText: "Advance Payment",
                  textInputType: TextInputType.number,
                  textEditingController:
                      orderController.advancePaymentEditingController,
                  focusNode: controller.advancedPaymentFocusNode,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Advance Payment";
                    } else {
                      return null;
                    }
                  },
                ),
                verticalSpacing(),
                CustomTextField(
                    hintText: "Select Manager Role",
                    labelText: "Assigns Order",
                    textEditingController:
                        orderController.assignOrderIdEditingController,
                    focusNode: FocusNode(),
                    suffixFixIcon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: AppColor.blackColor,
                    )),
                verticalSpacing(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Done',
            onTap: () {
              if (_formKey.currentState!.validate()) {
                if (widget.model != null) {
                  orderController.updateOrder(widget.model['id']);
                } else {
                  orderController.addOrder();
                }
              }
            },
          ),
        ));
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }

  datePicker() async {
    DateTime? datePicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2024),
        lastDate: DateTime(2050));
    if (datePicked != null) {
      // var pickDate = DateFormat('dd/MM/yyyy').format(datePicked);
      orderController.date.text = datePicked.toString();
    }
  }
}
