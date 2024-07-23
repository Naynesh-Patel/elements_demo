import 'package:elements/auth/changepassword.dart';
import 'package:elements/bill_history/bill_history.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/constant/vars.dart';
import 'package:elements/controller/setting_controller.dart';
import 'package:elements/machinery/mange_machinery.dart';
import 'package:elements/manage_customer/mange_customer.dart';
import 'package:elements/mange_spareparts/mange_spareparts.dart';
import 'package:elements/user/mange_user.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
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
        appBar: HomeAppBar(
          title: "Setting",
        ),
        body: SingleChildScrollView(
          child: Obx(()=> userType.value == "manager" ? managerView() : adminView() ),
        ));
  }


  Widget managerView(){
    return Column(
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
          title: "Logout",
          isSvg: false,
          imgPath: "assets/images/logout.png",
          index: 7,
          onTap: () {
            CustomDialogBox.showLogoutDialog(
              context: context,
              onCancelTap: () {
                Get.back();
              },
              onLogoutTap: () {
                Get.back();
              },
            );
          },
        ),
      ],
    );
  }

  Widget adminView(){
    return Column(
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
        // _customTile(
        //   title: "Import Spareparts",
        //   imgPath: "assets/images/import_spareparts.png",
        //   isSvg: false,
        //   index: 3,
        //   onTap: () {
        //     controller.selectMenu.value = 3;
        //     Get.to(const ImportSpareparts());
        //   },
        // ),
        _customTile(
          title: "Manage User",
          imgPath: "assets/svg/all_users.svg",
          index: 3,
          onTap: () {
            controller.selectMenu.value = 3;
            Get.to(const MangeUser());
          },
        ),
        // _customTile(
        //   title: "Manage Salesmen",
        //   imgPath: "assets/images/mange_salesmen.png",
        //   isSvg: false,
        //   index: 4,
        //   onTap: () {
        //     controller.selectMenu.value = 4;
        //     Get.to(const MangeSalesmen());
        //   },
        // ),
        _customTile(
          title: "Manage Customer Company",
          imgPath: "assets/svg/mange_compny.svg",
          index: 4,
          onTap: () {
            controller.selectMenu.value = 4;
            Get.to(const MangeCustomer());
          },
        ),
        // _customTile(
        //   title: "Manage Machine Stock",
        //   imgPath: "assets/svg/mange_product.svg",
        //   index: 7,
        //   onTap: () {
        //     controller.selectMenu.value = 7;
        //     Get.to(const MangeProduct());
        //   },
        // ),
        _customTile(
          title: "Bill History",
          imgPath: "assets/svg/bil_history.svg",
          index: 5,
          onTap: () {
            controller.selectMenu.value = 5;
            Get.to(const BillHistory());
          },
        ),
        _customTile(
          title: "Change Password",
          isSvg: false,
          imgPath: "assets/images/padlock.png",
          index: 6,
          onTap: () {
            controller.selectMenu.value = 6;
            Get.to(const ChangePassword());
          },
        ),
        _customTile(
          title: "Logout",
          isSvg: false,
          imgPath: "assets/images/logout.png",
          index: 7,
          onTap: () {
            CustomDialogBox.showLogoutDialog(
              context: context,
              onCancelTap: () {
                Get.back();
              },
              onLogoutTap: () {
                Get.back();
              },
            );
          },
        ),
      ],
    );
  }


  Widget _customTile({void Function()? onTap, required int index, required String title, required String imgPath, bool isSvg = true}) {
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
