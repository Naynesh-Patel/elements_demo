import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/methods.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/controller/order_controller.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:elements/home/select_customer_company.dart';
import 'package:elements/home/select_machine.dart';
import 'package:elements/home/select_order.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNewOrder extends StatefulWidget {
  final dynamic model;
  final bool isView;

  const CreateNewOrder({super.key, this.model, this.isView = false});

  @override
  State<CreateNewOrder> createState() => _CreateNewOrderState();
}

class _CreateNewOrderState extends State<CreateNewOrder> {
  HomeController controller = Get.find();
  CustomerController customerController = Get.find();

  final _formKey = GlobalKey<FormState>();
  OrderController orderController = Get.find();
  MachineryController machineryController = Get.find();
  UserController userController = Get.find();

  @override
  void initState() {
    if (widget.model != null) {
      orderController.totalPaymentEditingController.text =
          widget.model['total_payment'] ?? '';
      orderController.advancePaymentEditingController.text =
          widget.model['advance_payment'] ?? '';
      customerController.companyTextEditingController.text =
          widget.model['customer_company_id'] ?? '';
      customerController.machineNameTextEditingController.text =
          widget.model['machine_ids'] ?? '';
      orderController.assignOrderIdEditingController.text =
          widget.model['assign_order_id'] ?? '';
      orderController.formatDate.text = widget.model['delivery_date'] ?? '';
    } else {
      orderController.customerCompanyIdNoTextEditingController.clear();
      orderController.date.clear();
      orderController.assignOrderIdEditingController.clear();
      orderController.formatDate.clear();
      orderController.totalPaymentEditingController.clear();
      orderController.advancePaymentEditingController.clear();
      customerController.companyTextEditingController.clear();
      customerController.machineNameTextEditingController.clear();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          title: widget.isView
              ? "View Order Details"
              : widget.model != null
                  ? 'Update  New Order'
                  : 'Create  New Order',
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
                CustomTextField(
                    focusNode: FocusNode(),
                    readOnly: true,
                    onTap: () {
                      Get.to(const SelectCustomerCompany());
                    },
                    hintText: "Select Customer/Company",
                    labelText: "Customer/Company",
                    textEditingController:
                        customerController.companyTextEditingController,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Machine Type";
                      } else {
                        return null;
                      }
                    },
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
                      Get.to(const SelectMachine());
                    },
                    hintText: "Select Machine Type*",
                    labelText: "Machine Type",
                    textEditingController:
                        customerController.machineNameTextEditingController,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Machine Type";
                      } else {
                        return null;
                      }
                    },
                    suffixFixIcon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    )),
                verticalSpacing(),
                InkWell(
                  onTap: () async {
                    datePicker();
                  },
                  child: CustomTextField(
                      textEditingController: orderController.date,
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
                        color: Colors.black,
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
                    onTap: () {
                      Get.to(const SelectOrder());
                    },
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
        bottomNavigationBar: widget.isView
            ? const SizedBox.shrink()
            : Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CustomButton(
                  color: AppColor.buttonColor,
                  isLoading: orderController.isOrderLoading,
                  buttonText: widget.model != null ? 'Update' : 'Done',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.model != null) {
                        orderController.updateOrder(
                          widget.model['id'],
                          machineId: orderController.orderList[0]
                              ['machine_ids'],
                          orderId: orderController.orderList[0]
                              ['assign_order_id'],
                          companyId: orderController.orderList[0]
                              ['customer_company_id'],
                        );
                      } else {
                        orderController.addOrder(
                          orderId: orderController.orderList[0]
                              ['assign_order_id'],
                          companyId: orderController.orderList[0]
                              ['customer_company_id'],
                          machineId: orderController.orderList[0]
                              ['machine_ids'],
                        );
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
      var pickDate = getDateInDDMMYY(datePicked);
      orderController.formatDate.text = pickDate;
      orderController.date.text = datePicked.toString();
      _formKey.currentState?.validate();
    }
  }
}
