import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/empty_view.dart';
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
    machineryController.getMachinery(isMultiSelection: true);
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
      body: Obx(() => machineryController.isGetMachineryLoading.value
          ? const CustomLoader()
          : machineryController.addMachineryList.isEmpty
              ? const EmptyView()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: machineryController.addMachineryList.length,
                  // physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if (machineryController.addMachineryList[index]
                        ['isSelect'] ==
                            null) {
                          machineryController.addMachineryList[index]
                          ['isSelect'] = true;
                        } else if (machineryController
                            .addMachineryList[index]['isSelect'] ==
                            true) {
                          machineryController.addMachineryList[index]
                          ['isSelect'] = false;
                        } else {
                          machineryController.addMachineryList[index]
                          ['isSelect'] = true;
                        }
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                machineryController.addMachineryList[index]
                                ['machine_name'],
                                style: AppTextStyle.textStyleRegular16,
                              ),
                            ),
                            InkWell(
                              borderRadius: BorderRadius.circular(6.0),
                              onTap: () {
                                if (machineryController.addMachineryList[index]
                                ['isSelect'] ==
                                    null) {
                                  machineryController.addMachineryList[index]
                                  ['isSelect'] = true;
                                } else if (machineryController
                                    .addMachineryList[index]['isSelect'] ==
                                    true) {
                                  machineryController.addMachineryList[index]
                                  ['isSelect'] = false;
                                } else {
                                  machineryController.addMachineryList[index]
                                  ['isSelect'] = true;
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
                                child: Obx(() => Icon(
                                  Icons.check_rounded,
                                  size: 14,
                                  color: machineryController
                                      .addMachineryList[index]
                                  ['isSelect'] ??
                                      false
                                      ? AppColor.blackColor
                                      : Colors.transparent,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
      bottomNavigationBar: Obx(()=>  machineryController.isGetMachineryLoading.value ? const SizedBox.shrink() : Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: "Done",
            onTap: (){
              machineryController.selectMachineList.value = machineryController.addMachineryList.where((map) => map["isSelect"] == true).toList();
              debugPrint("");
              Get.back();
              // for(int i = 0; i< machineryController.addMachineryList.length; i++){
              //   if(machineryController.addMachineryList[i]['isSelect']==true){
              //     machineryController.selectMachineList.a
              //   }
              // }
            },
            isLoading: false.obs),
      ) ),
    );
  }
}
