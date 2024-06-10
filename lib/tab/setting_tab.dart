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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: SvgPicture.asset(
        //       "assets/svg/ic_notification.svg",
        //       height: 22,
        //       width: 22,
        //       color: Colors.black,
        //     ),
        //   ),
        // ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            // tileColor:isSelect ? Color(0xff01959F): null ,
            // selectedColor:,

            leading: SvgPicture.asset(
              "assets/svg/mange_user.svg",
              color: index== 0 ? const Color(0xff01959F): Colors.black,
              height: 20,
            ),
            title:  Text(
              'Manage Machinery',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: index== 0 ? const Color(0xff01959F): Colors.black,
              ),
            ),
            trailing:  Icon(Icons.arrow_forward_ios_rounded,
              color: index== 0 ? const Color(0xff01959F): Colors.black,
            ),
            onTap: () {
              setState(() {
                index=0;
                Get.to(const MangeMachinery());
              });

            },
          ),
          ListTile(
            leading: Image.asset(
              "assets/images/mange.png",
              color: index== 1 ? const Color(0xff01959F): Colors.black,
              height: 20,
            ),
            title:  Text(
              'Manage Spare Parts',
              style: TextStyle(
                fontSize: 18,
                color: index== 1 ? const Color(0xff01959F): Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing:  Icon(Icons.arrow_forward_ios_rounded,
              color: index== 1 ? const Color(0xff01959F): Colors.black,
            ),
            onTap: () {
              setState(() {
                index=1;
                Get.to(const MangeSpareparts());
              });

            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/all_users.svg",
              color:  index== 2 ? const Color(0xff01959F): Colors.black,
              height: 20,
            ),
            title:  Text(
              'Manage User',
              style: TextStyle(
                fontSize: 18,
                color: index== 2 ? const Color(0xff01959F): Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing:  Icon(Icons.arrow_forward_ios_rounded,
              color: index== 2 ? const Color(0xff01959F): Colors.black,
            ),
            onTap: () {
              setState(() {
                index=2;
                Get.to(const MangeUser());
              });

            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mange_compny.svg",
              color: index== 3 ? const Color(0xff01959F): Colors.black,
              height: 20,
            ),
            title:  Text(
              'Manage Customer Company',
              style: TextStyle(
                fontSize: 18,
                color: index== 3 ? const Color(0xff01959F): Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing:  Icon(Icons.arrow_forward_ios_rounded,
              color: index== 3 ? const Color(0xff01959F): Colors.black,
            ),
            onTap: () {
              setState(() {
                index=3;
                Get.to(const MangeCustomer());
              });

            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/bil_history.svg",
              color: index== 4 ? const Color(0xff01959F): Colors.black,
              height: 20,
            ),
            title:  Text(
              'Bill History',
              style: TextStyle(
                fontSize: 18,
                color: index== 4 ? const Color(0xff01959F): Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing:  Icon(Icons.arrow_forward_ios_rounded,
              color: index== 4 ? const Color(0xff01959F): Colors.black,
            ),
            onTap: () {
              setState(() {
                index=4;
                Get.to(const BillHistory());
              });

            },
          ),
          ListTile(
            leading:  Icon(Icons.logout,
              color: index== 5 ? const Color(0xff01959F): Colors.black,
            ),
            title:  Text(
              'LogOut',
              style: TextStyle(
                fontSize: 18,
                color: index== 5 ? const Color(0xff01959F): Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            trailing:  Icon(Icons.arrow_forward_ios_rounded,
              color: index== 5 ? const Color(0xff01959F): Colors.black,
            ),
            onTap: () {
              setState(() {
                index=5;
              });
            },
          ),
        ],
      ),
    );
  }
}
