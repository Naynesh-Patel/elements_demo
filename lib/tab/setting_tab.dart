import 'package:elements/bill_history/bill_history.dart';
import 'package:elements/machinery/mange_machinery.dart';
import 'package:elements/manage_customer/mange_customer.dart';
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
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mange_user.svg",
              color: const Color(0xff555555),
              height: 20,
            ),
            title: const Text(
              'Manage Machinery',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Get.to(const MangeMachinery());
            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/mange.png",
              color: const Color(0xff555555),
              height: 20,
            ),
            title: const Text(
              'Manage Spare Parts',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Get.to(const MangeSpareparts());
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/all_users.svg",
              color: const Color(0xff555555),
              height: 20,
            ),
            title: const Text(
              'Manage User',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Get.to(const MangeUser());
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mange_compny.svg",
              color: const Color(0xff555555),
              height: 20,
            ),
            title: const Text(
              'Manage Customer Company',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Get.to(const MangeCustomer());
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/bil_history.svg",
              color: const Color(0xff555555),
              height: 20,
            ),
            title: const Text(
              'Bill History',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Get.to(const BillHistory());
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'LogOut',
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff555555),
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
