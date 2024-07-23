import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/controller/spareparts_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mange_spareparts/add_spareparts.dart';

class AddMachinery extends StatefulWidget {
  final dynamic model;
  final bool isUpdate;
  final bool isView;

  const AddMachinery(
      {super.key, this.isUpdate = false, this.isView = false, this.model});

  @override
  State<AddMachinery> createState() => _AddMachineryState();
}

class _AddMachineryState extends State<AddMachinery> {
  MachineryController controller = Get.find();
  SparepartsController sparepartsController = Get.find();

  final controllers = TextEditingController();
  bool validate = false;

  RxList<dynamic> sparepartsList = [
    {
      "name": "1",
      "select": false,
    },
    {
      "name": "2",
      "select": false,
    },
    {
      "name": "3",
      "select": false,
    },
  ].obs;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    sparepartsController.getSpareparts();
    if (widget.model != null) {
      controller.machineNameTextEditingController.text =
          widget.model['machine_name'] ?? '';
      controller.qtyTextEditingController.text = widget.model['qty'] ?? '';
      controller.machinetypeEditingController.text =
          widget.model['machine_type'] ?? '';
      controller.manufactureDurationTextEditingController.text =
          widget.model['manufacture_duration'] ?? '';
    } else {
      controller.machineNameTextEditingController.clear();
      controller.qtyTextEditingController.clear();
      controller.machinetypeEditingController.clear();
      controller.manufactureDurationTextEditingController.clear();
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
      child: ListView(
        shrinkWrap: true,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                textEditingController:
                    controller.machineNameTextEditingController,
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
              CustomTextField(
                textEditingController: controller.qtyTextEditingController,
                hintText: "Qty",
                labelText: "Qty",
                enable: false,
              ),
              const SizedBox(
                height: 16,
              ),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Add Spareparts ",
              //       style: AppTextStyle.textStyleRegular18,
              //     ),
              //     IconButton(
              //         padding: EdgeInsets.zero,
              //         constraints: const BoxConstraints(),
              //         style: const ButtonStyle(
              //           tapTargetSize: MaterialTapTargetSize
              //               .shrinkWrap, // the '2023' part
              //         ),
              //         onPressed: () {
              //           controller.machineryList.add(
              //             ModelMachinery(
              //               qtyController: TextEditingController(),
              //               isSelected: false.obs,
              //             ),
              //           );
              //         },
              //         icon: const Icon(
              //           Icons.add,
              //           size: 24,
              //         )),
              //   ],
              // ),
              // const SizedBox(
              //   height: 16,
              // ),
              // Obx(
              //   () => ListView.separated(
              //     shrinkWrap: true,
              //     itemCount: controller.machineryList.length,
              //     itemBuilder: (context, index) {
              //       return Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //         children: [
              //           InkWell(
              //             borderRadius: BorderRadius.circular(6.0),
              //             onTap: () {
              //               if (controller
              //                       .machineryList[index].isSelected.value ==
              //                   false) {
              //                 controller.machineryList[index].isSelected
              //                     .value = true;
              //               } else {
              //                 controller.machineryList[index].isSelected
              //                     .value = false;
              //               }
              //               debugPrint(
              //                   "Select = ${controller.machineryList[index].isSelected.value}");
              //               // setState(() {});
              //             },
              //             child: Container(
              //               padding: const EdgeInsets.symmetric(
              //                   horizontal: 4.0, vertical: 4.0),
              //               decoration: BoxDecoration(
              //                   border: Border.all(
              //                       color: AppColor.dropDownHintColor),
              //                   borderRadius: BorderRadius.circular(6.0)),
              //               child: Obx(() => Icon(
              //                     Icons.check_rounded,
              //                     size: 14,
              //                     color: controller.machineryList[index]
              //                             .isSelected.value
              //                         ? AppColor.blackColor
              //                         : Colors.transparent,
              //                   )),
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 10.0,
              //           ),
              //           Expanded(
              //             child: Text(
              //               'Spareparts ${index + 1}',
              //               style: AppTextStyle.textStyleRegular16
              //                   .copyWith(color: const Color(0xff555555)),
              //             ),
              //           ),
              //           Container(
              //             width: 115,
              //             height: 42,
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(4),
              //                 border:
              //                     Border.all(color: const Color(0xffD1D1D1))),
              //             child: TextField(
              //               controller: controller.qtyTextEditingController,
              //               textAlignVertical: TextAlignVertical.center,
              //               textAlign: TextAlign.center,
              //               keyboardType: TextInputType.number,
              //               decoration: InputDecoration(
              //                 border: InputBorder.none,
              //                 contentPadding: const EdgeInsets.symmetric(
              //                     horizontal: 8.0, vertical: 13.0),
              //                 hintText: 'Qty',
              //                 hintStyle: AppTextStyle.textStyleRegular14
              //                     .copyWith(
              //                         color: AppColor.dropDownHintColor),
              //                 labelStyle: AppTextStyle.textStyleRegular16
              //                     .copyWith(color: AppColor.blackColor),
              //                 helperStyle: AppTextStyle.textStyleRegular16
              //                     .copyWith(
              //                         color: AppColor.dropDownHintColor),
              //               ),
              //             ),
              //           ),
              //           const SizedBox(
              //             width: 10.0,
              //           ),
              //         ],
              //       );
              //     },
              //     separatorBuilder: (BuildContext context, int index) {
              //       return const SizedBox(
              //         height: 12.0,
              //       );
              //     },
              //   ),
              // ),
            ],
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
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
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
                    textEditingController:
                        controller.machinetypeEditingController,
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
                  CustomTextField(
                    textEditingController: controller.qtyTextEditingController,
                    textInputType: TextInputType.number,
                    hintText: "Qty",
                    labelText: "Qty",
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Qty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  verticalSpacing(),
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
                            tapTargetSize: MaterialTapTargetSize
                                .shrinkWrap, // the '2023' part
                          ),
                          onPressed: () {
                            Get.to(const AddSpareparts());
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
                      itemCount: sparepartsController.sparepartsList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: Row(
                            children: [
                              // InkWell(
                              //   borderRadius: BorderRadius.circular(6.0),
                              //   onTap: () {
                              //     if (sparepartsController.sparepartsList[index]
                              //             .isSelected.value ==
                              //         false) {
                              //       sparepartsController.sparepartsList[index]
                              //           .isSelected.value = true;
                              //     } else {
                              //       sparepartsController.sparepartsList[index]
                              //           .isSelected.value = true;
                              //     }
                              //     debugPrint(
                              //         "Select = ${sparepartsController.sparepartsList[index].isSelected.value}");
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
                              //           color: sparepartsController
                              //                   .sparepartsList[index]
                              //                   .isSelected
                              //                   .value
                              //               ? AppColor.blackColor
                              //               : Colors.transparent,
                              //         )),
                              //   ),
                              // ),
                              Text(sparepartsController.sparepartsList[index]
                                      ['name'] ??
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
                                  onTap: () {
                                    if (sparepartsController
                                            .sparepartsList[index]
                                            .isSelected
                                            .value ==
                                        false) {
                                      sparepartsController.sparepartsList[index]
                                          .isSelected.value = true;
                                    } else {
                                      sparepartsController.sparepartsList[index]
                                          .isSelected.value = true;
                                    }
                                    debugPrint(
                                        "Select = ${sparepartsController.sparepartsList[index].isSelected.value}");
                                  },
                                  keyboardType:
                                      const TextInputType.numberWithOptions(),
                                  maxLength: 3,
                                  textAlignVertical: TextAlignVertical.center,
                                  textAlign: TextAlign.center,
                                  controller: controller
                                      .sparepartsTextEditingController,
                                  decoration: InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8.0, vertical: 13),
                                      hintText: sparepartsController
                                              .sparepartsList[index]['qty'] ??
                                          '',
                                      helperStyle: AppTextStyle.textStyleLight16
                                          .copyWith(
                                              color:
                                                  AppColor.dropDownHintColor),
                                      hintStyle: AppTextStyle.textStyleLight14
                                          .copyWith(
                                              color:
                                                  AppColor.dropDownHintColor)),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              InkWell(
                                onTap: () {
                                  sparepartsController.deleteSpareparts(
                                      sparepartsController.sparepartsList[index]
                                          ['id']);
                                  sparepartsController.sparepartsList
                                      .removeAt(index);
                                },
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  "assets/images/remove.png",
                                  color: Colors.red,
                                  height: 20,
                                ),
                              ),
                              // InkWell(
                              //   borderRadius: BorderRadius.circular(10),
                              //   onTap: () {
                              //     Get.to(AddSpareparts(
                              //       model: sparepartsController
                              //           .sparepartsList[index],
                              //     ));
                              //   },
                              //   child: Container(
                              //       decoration: BoxDecoration(
                              //           // color: const Color(0xffFFFFFF),
                              //           borderRadius: BorderRadius.circular(4),
                              //           border: Border.all(
                              //               color: const Color(0xffD1D1D1))),
                              //       padding: const EdgeInsets.symmetric(
                              //           vertical: 12, horizontal: 12),
                              //       child: SvgPicture.asset(
                              //         'assets/svg/ic_edit.svg',
                              //         height: 16,
                              //         width: 16,
                              //       )),
                              // ),
                              // InkWell(
                              //   borderRadius: BorderRadius.circular(10),
                              //   onTap: () {
                              //     Get.to(AddSpareparts(
                              //       model: sparepartsController
                              //           .sparepartsList[index],
                              //     ));
                              //   },
                              //   child: Container(
                              //       decoration: BoxDecoration(
                              //           // color: const Color(0xffFFFFFF),
                              //           borderRadius: BorderRadius.circular(4),
                              //           border: Border.all(
                              //               color: const Color(0xffD1D1D1))),
                              //       padding: const EdgeInsets.symmetric(
                              //           vertical: 12, horizontal: 12),
                              //       child: SvgPicture.asset(
                              //         'assets/svg/delete.svg',
                              //         height: 16,
                              //         width: 16,
                              //       )),
                              // ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }
}
