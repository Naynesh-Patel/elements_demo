import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_customer.dart';

class MangeCustomer extends StatefulWidget {
  const MangeCustomer({super.key});

  @override
  State<MangeCustomer> createState() => _MangeCustomerState();
}

class _MangeCustomerState extends State<MangeCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: CustomAppBar(
        title: "Manage Customer/Company",
        onPressed: () {
          Get.back();
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xffE6E6E6), width: 1)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _keyValue("Name", "Tata Steel Pvt"),
                  const SizedBox(
                    height: 6,
                  ),
                  _keyValue("Contact No", "99656 25693"),
                  const SizedBox(
                    height: 6,
                  ),
                  _keyValue("Reference By", "L & T Pvt"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SmallButton(
                        title: "  View  ",
                        textColor: AppColor.selectColor,
                        onTap: () {

                      },),
                      const SizedBox(width: 12.0,),
                      SmallButton(
                        title: "  Edit  ",
                        onTap: () {

                        },),
                      const SizedBox(width: 12.0,),
                      SmallButton(
                        title: "Cancel",
                        textColor: AppColor.cancelColor,
                        onTap: () {
                          CustomDialogBox.showDeleteDialog(
                            context: context,
                            bodyText: "Do you really want to cancel these records? This process cannot be undone.",
                            onCancelTap: () {
                              Get.back();
                            },
                            onDeleteTap: () {

                            },);
                        },),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Get.to(const AddCustomer());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Widget _keyValue(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$key : ",
          style: AppTextStyle.textStyleBold14,
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
}
