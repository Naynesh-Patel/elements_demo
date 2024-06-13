import 'package:elements/bill_history/bill_history.dart';
import 'package:elements/import_spareparts/import_spareparts.dart';
import 'package:elements/machinery/mange_machinery.dart';
import 'package:elements/manage_customer/mange_customer.dart';
import 'package:elements/mange_product/mange_product.dart';
import 'package:elements/spareparts/mange_spareparts.dart';
import 'package:elements/user/mange_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../mange_salsemen/mange_salesmen.dart';

class SettingTab extends StatefulWidget {
  const SettingTab({super.key});

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  int index = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        automaticallyImplyLeading: false,
        title: const Text(
          "Setting",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/svg/ic_notification.svg',
                  height: 22,
                  width: 22,
                ),
              ))
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mange_user.svg",
              color: index == 0
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
              height: 20,
            ),
            title: Text(
              'Manage Machinery',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: index == 0
                    ? const Color(0xff01959F)
                    : const Color(0xff555555),
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: index == 0
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            onTap: () {
              setState(() {
                index = 0;
                Get.to(const MangeMachinery());
              });
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/mange.png",
              color: index == 1
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
              height: 20,
            ),
            title: Text(
              'Manage Spareparts',
              style: TextStyle(
                fontSize: 18,
                color: index == 1
                    ? const Color(0xff01959F)
                    : const Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: index == 1
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            onTap: () {
              setState(() {
                index = 1;
                Get.to(const MangeSpareparts());
              });
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/import_spareparts.png",
              color: index == 2
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
              height: 20,
            ),
            title: Text(
              'Import Spareparts',
              style: TextStyle(
                fontSize: 18,
                color: index == 2
                    ? const Color(0xff01959F)
                    : const Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: index == 2
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            onTap: () {
              setState(() {
                index = 2;
                Get.to(const ImportSpareparts());
              });
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/all_users.svg",
              color: index == 3
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
              height: 20,
            ),
            title: Text(
              'Manage User',
              style: TextStyle(
                fontSize: 18,
                color: index == 3
                    ? const Color(0xff01959F)
                    : const Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: index == 3
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            onTap: () {
              setState(() {
                index = 3;
                Get.to(const MangeUser());
              });
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/all_users.svg",
              color: index == 4
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
              height: 20,
            ),
            title: Text(
              'Manage Salesmen',
              style: TextStyle(
                fontSize: 18,
                color: index == 4
                    ? const Color(0xff01959F)
                    : const Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: index == 4
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            onTap: () {
              setState(() {
                index = 4;
                Get.to(const MangeSalesmen());
              });
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mange_compny.svg",
              color: index == 5
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
              height: 20,
            ),
            title: Text(
              'Manage Customer Company',
              style: TextStyle(
                fontSize: 18,
                color: index == 5
                    ? const Color(0xff01959F)
                    : const Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: index == 5
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            onTap: () {
              setState(() {
                index = 5;
                Get.to(const MangeCustomer());
              });
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mange_product.svg",
              color: index == 6
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
              height: 20,
            ),
            title: Text(
              'Manage Product',
              style: TextStyle(
                fontSize: 18,
                color: index == 6
                    ? const Color(0xff01959F)
                    : const Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: index == 6
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            onTap: () {
              setState(() {
                index = 6;
                Get.to(const MangeProduct());
              });
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/bil_history.svg",
              color: index == 7
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
              height: 20,
            ),
            title: Text(
              'Bill History',
              style: TextStyle(
                fontSize: 18,
                color: index == 7
                    ? const Color(0xff01959F)
                    : const Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: index == 7
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            onTap: () {
              setState(() {
                index = 7;
                Get.to(const BillHistory());
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: index == 8
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18,
                color: index == 8
                    ? const Color(0xff01959F)
                    : const Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: index == 8
                  ? const Color(0xff01959F)
                  : const Color(0xff555555),
            ),
            onTap: () {
              setState(() {
                logoutDialog();
                index = 8;
              });
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
          title: const Text(
            "Are You Sure Logout?",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color(0xff555555)),
          ),
          content: const Text(
            "Do you really want to Logout these App? This process cannot be undone.",
            textAlign: TextAlign.center,
            style: TextStyle(
                // fontWeight: FontWeight.w300,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff949494)),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
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
              ),
            )
            // InkWell(
            //   onTap: () {
            //     Get.back();
            //   },
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //     decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(8),
            //         color: AppColor.buttonColor),
            //     child: const Text(
            //       'Delete',
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
