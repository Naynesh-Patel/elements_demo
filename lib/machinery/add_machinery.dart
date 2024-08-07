import 'dart:convert';

import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:elements/machinery/spareparts_list.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddMachinery extends StatefulWidget {
  final dynamic model;
  final bool isUpdate;
  final bool isView;

  const AddMachinery(
      {super.key, this.isUpdate = false, this.isView = false, this.model});

  @override
  State<AddMachinery> createState() => _AddMachineryState();
}

class Item {
  final int id;
  final String name;
  final int qty;

  Item({required this.id, required this.name, required this.qty});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      qty: json['qty'],
    );
  }
}

class _AddMachineryState extends State<AddMachinery> {
  MachineryController controller = Get.find();
  SparepartsController sparepartsController = Get.find();

  final controllers = TextEditingController();

  bool validate = false;
  final box = GetStorage();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    sparepartsController.getSpareparts();
    if (widget.model != null) {
      controller.machineNameTextEditingController.text =
          widget.model['machine_name'] ?? '';
      // controller.qtyTextEditingController.text = widget.model['qty'] ?? '';
      controller.machinetypeEditingController.text =
          widget.model['machine_type'] ?? '';
      controller.manufactureDurationTextEditingController.text =
          widget.model['manufacture_duration'] ?? '';
      controller.sparepartsTextEditingController.text =
          widget.model['name'] ?? '';
      List<dynamic> jsonList = jsonDecode(widget.model['spareparts']);
      for (int i = 0; i < jsonList.length; i++) {
        sparepartsController.selectSparepartsList.add({
          'id': jsonList[i]['id'],
          'name': jsonList[i]['name'],
          'controller': TextEditingController(text: jsonList[i]['qty'])
        });
      }
      debugPrint(jsonList.toString());
    } else {
      controller.machineNameTextEditingController.clear();
      controller.qtyTextEditingController.clear();
      controller.manufactureDurationTextEditingController.clear();
      controller.machinetypeEditingController.clear();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: widget.isView
              ? "View Machinery"
              : widget.model != null
                  ? "Update Machinery Details"
                  : "Add Machinery",
          onPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: widget.isView ? viewOnly() : addEdit(),
        ),
        bottomNavigationBar: widget.isView
            ? const SizedBox.shrink()
            : Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: CustomButton(
                  color: AppColor.buttonColor,
                  isLoading: false.obs,
                  buttonText: widget.model != null ? "Update" : "Add",
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (widget.model != null) {
                        controller.updateMachinery(widget.model['id']);
                      } else {
                        controller.addMachinery();
                      }
                    }
                  },
                ),
              ));
  }

  Widget viewOnly() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            textEditingController: controller.machineNameTextEditingController,
            hintText: "Machine Name",
            labelText: "Machine Name",
            enable: false,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            textEditingController: controller.machinetypeEditingController,
            hintText: "Machine Type",
            labelText: "Machine Type",
            enable: false,
          ),
          const SizedBox(
            height: 16,
          ),
          // CustomTextField(
          //   textEditingController: controller.qtyTextEditingController,
          //   hintText: "Qty",
          //   labelText: "Qty",
          //   enable: false,
          // ),
          // const SizedBox(
          //   height: 16,
          // ),
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
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Spareparts ",
                style: AppTextStyle.textStyleRegular18,
              ),
              // IconButton(
              //     padding: EdgeInsets.zero,
              //     constraints: const BoxConstraints(),
              //     style: const ButtonStyle(
              //       tapTargetSize:
              //           MaterialTapTargetSize.shrinkWrap, // the '2023' part
              //     ),
              //     onPressed: () {
              //       Get.to(const SparepartList());
              //     },
              //     icon: const Icon(
              //       Icons.add,
              //       size: 24,
              //     )),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sparepartsController.selectSparepartsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  // leading: InkWell(
                  //   borderRadius: BorderRadius.circular(6.0),
                  //   onTap: () {
                  //     controller.isSelect.value =
                  //         !controller.isSelect.value;
                  //   },
                  //   child: Container(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 4.0, vertical: 4.0),
                  //     decoration: BoxDecoration(
                  //         border: Border.all(
                  //             color: AppColor.dropDownHintColor),
                  //         borderRadius: BorderRadius.circular(6.0)),
                  //     child: Obx(() => Icon(
                  //           Icons.check_rounded,
                  //           size: 14,
                  //           color: controller.isSelect.value
                  //               ? AppColor.blackColor
                  //               : Colors.transparent,
                  //         )),
                  //   ),
                  // ),
                  title: Row(
                    children: [
                      Text(sparepartsController.selectSparepartsList[index]
                              ['name'] ??
                          ''.capitalizeFirst.toString()),
                      // Text('${index + 1}'),
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
                            border: Border.all(color: const Color(0xffD1D1D1))),
                        child: CustomTextField(
                          enable: false,
                          onTap: () {},
                          textEditingController: sparepartsController
                              .selectSparepartsList[index]['controller'],
                          textInputType: TextInputType.number,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                        ),
                      ),
                      // const SizedBox(
                      //   width: 12,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     sparepartsController.deleteSpareparts(
                      //         sparepartsController.sparepartsList[index]['id']);
                      //     sparepartsController.sparepartsList.remove(index);
                      //   },
                      //   borderRadius: BorderRadius.circular(5),
                      //   child: Image.asset(
                      //     "assets/images/remove.png",
                      //     color: Colors.red,
                      //     height: 20,
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget addEdit() {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(
              textEditingController:
                  controller.machineNameTextEditingController,
              hintText: "Machine Name",
              labelText: "Machine Name",
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Machine Name";
                } else {
                  return null;
                }
              },
            ),
            verticalSpacing(),
            CustomTextField(
              textEditingController: controller.machinetypeEditingController,
              hintText: "Machine Type",
              labelText: "Machine Type",
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Machine Type";
                } else {
                  return null;
                }
              },
            ),
            verticalSpacing(),
            // CustomTextField(
            //   textEditingController: controller.qtyTextEditingController,
            //   textInputType: TextInputType.number,
            //   hintText: "Qty",
            //   labelText: "Qty",
            //   autoValidateMode: AutovalidateMode.onUserInteraction,
            //   validator: (value) {
            //     if (value!.isEmpty) {
            //       return "Please Enter Qty";
            //     } else {
            //       return null;
            //     }
            //   },
            // ),
            // verticalSpacing(),
            CustomTextField(
              textEditingController:
                  controller.manufactureDurationTextEditingController,
              textInputType: TextInputType.number,
              hintText: "Eg. 30 days",
              labelText: "Manufacture Duration",
              autoValidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Manufacture Duration";
                } else {
                  return null;
                }
              },
            ),
            verticalSpacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Add Spareparts ",
                  style: AppTextStyle.textStyleRegular18,
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    style: const ButtonStyle(
                      tapTargetSize:
                          MaterialTapTargetSize.shrinkWrap, // the '2023' part
                    ),
                    onPressed: () {
                      Get.to(const SparepartList());
                    },
                    icon: const Icon(
                      Icons.add,
                      size: 24,
                    )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sparepartsController.selectSparepartsList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    // leading: InkWell(
                    //   borderRadius: BorderRadius.circular(6.0),
                    //   onTap: () {
                    //     controller.isSelect.value =
                    //         !controller.isSelect.value;
                    //   },
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //         horizontal: 4.0, vertical: 4.0),
                    //     decoration: BoxDecoration(
                    //         border: Border.all(
                    //             color: AppColor.dropDownHintColor),
                    //         borderRadius: BorderRadius.circular(6.0)),
                    //     child: Obx(() => Icon(
                    //           Icons.check_rounded,
                    //           size: 14,
                    //           color: controller.isSelect.value
                    //               ? AppColor.blackColor
                    //               : Colors.transparent,
                    //         )),
                    //   ),
                    // ),
                    title: Row(
                      children: [
                        Text(sparepartsController.selectSparepartsList[index]
                                ['name'] ??
                            ''.capitalizeFirst.toString()),
                        // Text('${index + 1}'),
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
                              border:
                                  Border.all(color: const Color(0xffD1D1D1))),
                          child: CustomTextField(
                            onTap: () {
                              // if (sparepartsController
                              //             .sparepartsList[index]
                              //         ['isSelect'] ==
                              //     null) {
                              //   sparepartsController.sparepartsList[index]
                              //       ['isSelect'] = true;
                              // } else if (sparepartsController
                              //             .selectSparepartsList[index]
                              //         ['isSelect'] ==
                              //     true) {
                              //   sparepartsController.selectSparepartsList[index]
                              //       ['isSelect'] = false;
                              // } else {
                              //   sparepartsController.selectSparepartsList[index]
                              //       ['isSelect'] = true;
                              // }
                              // setState(() {});
                            },
                            textEditingController: sparepartsController
                                .selectSparepartsList[index]['controller'],
                            textInputType: TextInputType.number,
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          // TextField(
                          //   onTap: () {
                          //     // if (sparepartsController
                          //     //         .sparepartsList[index]
                          //     //         .isSelected
                          //     //         .value ==
                          //     //     false) {
                          //     //   sparepartsController.sparepartsList[index]
                          //     //       .isSelected.value = true;
                          //     // } else {
                          //     //   sparepartsController.sparepartsList[index]
                          //     //       .isSelected.value = true;
                          //     // }
                          //     // debugPrint(
                          //     //     "Select = ${sparepartsController.sparepartsList[index].isSelected.value}");
                          //     if (sparepartsController
                          //                 .sparepartsList[index]
                          //             ['isSelect'] ==
                          //         null) {
                          //       sparepartsController.sparepartsList[index]
                          //           ['isSelect'] = true;
                          //     } else if (sparepartsController
                          //                 .sparepartsList[index]
                          //             ['isSelect'] ==
                          //         true) {
                          //       sparepartsController.sparepartsList[index]
                          //           ['isSelect'] = false;
                          //     } else {
                          //       sparepartsController.sparepartsList[index]
                          //           ['isSelect'] = true;
                          //     }
                          //     setState(() {});
                          //   },
                          //   keyboardType:
                          //       const TextInputType.numberWithOptions(),
                          //   maxLength: 3,
                          //   textAlignVertical: TextAlignVertical.center,
                          //   textAlign: TextAlign.center,
                          //   controller: sparepartsController.qtyTypeTextEditingController.map((controller) => controller.text).toList(),
                          //   decoration: InputDecoration(
                          //       counterText: '',
                          //       border: InputBorder.none,
                          //       contentPadding:
                          //           const EdgeInsets.symmetric(
                          //               horizontal: 8.0, vertical: 13),
                          //       // hintText: sparepartsController
                          //       //             .selectSparepartsList[index]
                          //       //         ['qty'] ??
                          //       //     '',
                          //       helperStyle: AppTextStyle.textStyleLight16
                          //           .copyWith(
                          //               color:
                          //                   AppColor.dropDownHintColor),
                          //       hintStyle: AppTextStyle.textStyleLight14
                          //           .copyWith(
                          //               color:
                          //                   AppColor.dropDownHintColor)),
                          // ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            sparepartsController.selectSparepartsList
                                .removeAt(index);
                          },
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            "assets/images/remove.png",
                            color: Colors.red,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }
}

/*

selectSparepartsList={

"id"=48;
"qty"="";
}



 */
