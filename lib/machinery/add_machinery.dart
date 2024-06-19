import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMachinery extends StatefulWidget {
  const AddMachinery({super.key});

  @override
  State<AddMachinery> createState() => _AddMachineryState();
}

class _AddMachineryState extends State<AddMachinery> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Add Machinery",
          onPressed: () {
            Get.back();
          },
          // action: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              const CustomTextField(
                hintText: "Machine Name",
                labelText: "Machine Name*",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                hintText: "Machine Type",
                labelText: "Machine Type*",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                hintText: "Qty",
                labelText: "Qty*",
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                hintText: "Eg. 30 days",
                labelText: "Manufacture Duration*",
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
                  IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      style: const ButtonStyle(
                        tapTargetSize:
                            MaterialTapTargetSize.shrinkWrap, // the '2023' part
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        size: 24,
                      )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(() => ListView.separated(
                    shrinkWrap: true,
                    itemCount: sparepartsList.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(6.0),
                            onTap: () {
                              if (sparepartsList[index]['select'] == null) {
                                sparepartsList[index]['select'] = true;
                              } else if (sparepartsList[index]['select'] ==
                                  true) {
                                sparepartsList[index]['select'] = false;
                              } else {
                                sparepartsList[index]['select'] = true;
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
                              child: Icon(
                                Icons.check_rounded,
                                size: 14,
                                color: sparepartsList[index]['select'] ?? false
                                    ? AppColor.blackColor
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              'Spareparts ${index + 1}',
                              style: AppTextStyle.textStyleBold14
                                  .copyWith(color: const Color(0xff555555)),
                            ),
                          ),
                          Container(
                            width: 115,
                            height: 42,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(color: const Color(0xffD1D1D1))),
                            child: TextField(
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 13.0),
                                hintText: 'Qty',
                                hintStyle: AppTextStyle.textStyleRegular14
                                    .copyWith(
                                        color: AppColor.dropDownHintColor),
                                labelStyle: AppTextStyle.textStyleRegular16
                                    .copyWith(color: AppColor.blackColor),
                                helperStyle: AppTextStyle.textStyleRegular16
                                    .copyWith(
                                        color: AppColor.dropDownHintColor),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 12.0,
                      );
                    },
                  )),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Add',
            onTap: () {},
          ),
        ));
  }
}
