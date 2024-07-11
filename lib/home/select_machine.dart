import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/model/model_machinery.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectMachine extends StatefulWidget {
  const SelectMachine({super.key});

  @override
  State<SelectMachine> createState() => _SelectMachineState();
}

class _SelectMachineState extends State<SelectMachine> {
  MachineryController machineryController = Get.find();
  CustomerController customerController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    machineryController.getMachinery();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: 'Select Machine',
          onPressed: () {
            Get.back();
          },
        ),
        body:  Obx(() => Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: machineryController.addMachineryList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: () {
                      customerController.machineNameTextEditingController.text = machineryController.addMachineryList[index]['machine_name'];
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: AppColor.borderColor)
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(machineryController.addMachineryList[index]['machine_name'],style: AppTextStyle.textStyleRegular16,),
                        ],
                      ),
                    ),
                  );
                },),
            ),
          ],
        )),

    );
  }
}
