import 'package:elements/bill_history/bill_history.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/setting_controller.dart';
import 'package:elements/import_spareparts/import_spareparts.dart';
import 'package:elements/machinery/mange_machinery.dart';
import 'package:elements/manage_customer/mange_customer.dart';
import 'package:elements/mange_product/mange_product.dart';
import 'package:elements/spareparts/mange_salsemen/mange_salesmen.dart';
import 'package:elements/spareparts/mange_spareparts.dart';
import 'package:elements/user/mange_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  SettingController controller = Get.find();

  @override
  void initState() {
    controller.selectMenu.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColor.bgAppBarColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Setting",
          style: AppTextStyle.textStyleRegular20,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              'assets/svg/ic_notification.svg',
              height: 20,
              width: 20,
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _customTile(
            title: "Manage Machinery",
            imgPath: "assets/svg/mange_user.svg",
            index: 1,
            onTap: () {
              controller.selectMenu.value = 1;
              Get.to(const MangeMachinery());
            },
          ),
          _customTile(
            title: "Manage Spareparts",
            imgPath: "assets/images/mange.png",
            isSvg: false,
            index: 2,
            onTap: () {
              controller.selectMenu.value = 2;
              Get.to(const MangeSpareparts());
            },
          ),
          _customTile(
            title: "Import Spareparts",
            imgPath: "assets/images/import_spareparts.png",
            isSvg: false,
            index: 3,
            onTap: () {
              controller.selectMenu.value = 3;
              Get.to(const ImportSpareparts());
            },
          ),
          _customTile(
            title: "Manage User",
            imgPath: "assets/svg/all_users.svg",
            index: 4,
            onTap: () {
              controller.selectMenu.value = 4;
              Get.to(const MangeUser());
            },
          ),
          _customTile(
            title: "Manage Salesmen",
            imgPath: "assets/svg/all_users.svg",
            index: 5,
            onTap: () {
              controller.selectMenu.value = 5;
              Get.to(const MangeSalesmen());
            },
          ),
          _customTile(
            title: "Manage Customer Company",
            imgPath: "assets/svg/mange_compny.svg",
            index: 6,
            onTap: () {
              controller.selectMenu.value = 6;
              Get.to(const MangeCustomer());
            },
          ),
          _customTile(
            title: "Manage Product",
            imgPath: "assets/svg/mange_product.svg",
            index: 7,
            onTap: () {
              controller.selectMenu.value = 7;
              Get.to(const MangeProduct());
            },
          ),
          _customTile(
            title: "Bill History",
            imgPath: "assets/svg/bil_history.svg",
            index: 8,
            onTap: () {
              controller.selectMenu.value = 8;
              Get.to(const BillHistory());
            },
          ),
          _customTile(
            title: "Logout",
            isSvg: false,
            imgPath: "assets/images/logout.png",
            index: 9,
            onTap: () {
              logoutDialog();
            },
          ),
        ],
      ),
    );
  }

  Future<void> logoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          backgroundColor: Colors.white,
          title: Text("Are You Sure Logout?",
              textAlign: TextAlign.center, style: AppTextStyle.textStyleBold20),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Do you really want to Logout these App? This process cannot be undone.",
                textAlign: TextAlign.center,
                style: AppTextStyle.textStyleRegular14
                    .copyWith(color: const Color(0xff949494)),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xffC1C1C1),
                        ),
                        child: const Text("Cancel",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xff01959F),
                            borderRadius: BorderRadius.circular(4)),
                        child: const Text("Delete",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400))),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget _customTile(
      {void Function()? onTap,
      required int index,
      required String title,
      required String imgPath,
      bool isSvg = true}) {
    return ListTile(
      leading: isSvg
          ? SvgPicture.asset(
              imgPath,
              color: AppColor.blackColor,
              height: 20,
            )
          : Image.asset(
              imgPath,
              color: AppColor.blackColor,
              height: 20,
            ),
      title: Text(
        title,
        style: AppTextStyle.textStyleRegular16.copyWith(
          color: AppColor.blackColor,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 18,
        color: AppColor.blackColor,
      ),
      onTap: onTap,
    );
  }
}
