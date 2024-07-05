import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/model/model_machinery.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
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
    // TODO: implement initState
    super.initState();
    customerController.getcustomer();
  }

  MachineryController controller = Get.find();
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
          // action: [
          //   IconButton(
          //       onPressed: () {
          //         controller.machineryList.add(
          //           ModelMachinery(
          //             qtyController: TextEditingController(),
          //             isSelected: false.obs,
          //           ),
          //         );
          //       },
          //       icon: const Icon(Icons.add))
          // ],
        ),
        body:  Obx(() => Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: customerController.customerList.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    subtitle: Text(customerController.customerList[index]['owner']??''),
                    title: Text(customerController.customerList[index]['company']??''),
                    onTap: () {
                      Get.back(result: customerController.customerList[index]['owner'].toString() );
                      },
                  );
                },),
            ),
          ],
        )),
    );
  }
}
