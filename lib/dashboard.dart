import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/tab/attendance_tab.dart';
import 'package:elements/tab/expensetab.dart';
import 'package:elements/tab/setting_tab.dart';
import 'package:elements/tab/spareparts_tab.dart';
import 'package:elements/user/mange_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'tab/home_tab.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  int selectedColor = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeTab(),
    const SparepartsTab(),
    const AttendanceTab(),
    const ExpenseTab(),
    const SettingTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      selectedColor = index;
      index = index;
    });
  }

  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: key,
      // drawer: drawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        fixedColor: AppColor.buttonColor,
        backgroundColor: const Color(0xffF9F9F9),
        unselectedLabelStyle: AppTextStyle.textStyleRegular12,
        selectedLabelStyle: AppTextStyle.textStyleRegular12,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/home.png",
              height: 40,
              width: 40,
              color: selectedColor == 0 ? AppColor.buttonColor : Colors.grey,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/spareparts.png",
                height: 40,
                width: 40,
                color: selectedColor == 1 ? AppColor.buttonColor : Colors.grey,
              ),
              label: "Spareparts"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/attebdance.png",
                height: 40,
                width: 40,
                color: selectedColor == 2 ? AppColor.buttonColor : Colors.grey,
              ),
              label: "Attendance "),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/expense.png",
                height: 40,
                width: 40,
                color: selectedColor == 3 ? AppColor.buttonColor : Colors.grey,
              ),
              label: "Expense"),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/setting.png",
                color: selectedColor == 4 ? AppColor.buttonColor : Colors.grey,
                height: 40,
                width: 40,
              ),
              label: "Setting"),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xff3054CF).withOpacity(0.8),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: (40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SvgPicture.asset(
                        "assets/svg/ic_profile.svg",
                      ),
                    ),
                  ),
                  const Text(
                    "Mahesh Patel",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              )),
          ListTile(
            leading: Image.asset(
              "assets/images/mange.png",
              color: Colors.black,
              height: 20,
            ),
            title: const Text(
              'are youchinery',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mage_spare.svg",
              color: Colors.black,
              height: 20,
            ),
            title: const Text(
              'Manage User',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              Get.to(const MangeUser());
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mange_user.svg",
              color: Colors.black,
              height: 20,
            ),
            title: const Text(
              'Manage Companies/Customers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mange_user.svg",
              color: Colors.black,
              height: 20,
            ),
            title: const Text(
              'Manage Spare Parts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/bil_history.svg",
              color: Colors.black,
              height: 20,
            ),
            title: const Text(
              'Manage Expenses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SvgPicture.asset(
              "assets/svg/mange_attend.svg",
              color: Colors.black,
              height: 20,
            ),
            title: const Text(
              'Manage Attendence',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
