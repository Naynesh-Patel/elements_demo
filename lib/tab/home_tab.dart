import 'package:elements/constant/app_colors.dart';
import 'package:elements/create_new_order.dart';
import 'package:elements/invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> key = GlobalKey();
  late TabController tabController;
  int currentIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF9F9F9),
        // leading: IconButton(
        //   onPressed: () {
        //     key.currentState?.openDrawer();
        //   },
        //   icon: SvgPicture.asset(
        //     "assets/svg/ic_menu.svg",
        //     height: 20,
        //     width: 24,
        //     color: Colors.black,
        //   ),
        // ),
        title: const Text(
          "MachinePro",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/ic_notification.svg",
              height: 22,
              width: 22,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          TabBar(
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.buttonColor,
                border: Border.all(color: const Color(0xffE6E6E6))),
            labelColor: const Color(0xffffffff),
            labelStyle:
                const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            unselectedLabelColor: Colors.black,
            controller: tabController,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
            tabs: [
              Tab(
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: const Center(
                      child: Text(
                    'Ongoing',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ),
              ),
              Tab(
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Center(
                      child: Text('Upcomming',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ))),
                ),
              ),
              Tab(
                child: Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                      child: Text('Complete ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ))),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
                controller: tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          // height: 240,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                                  Border.all(color: const Color(0xffE6E6E6))),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'OD : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff272727)),
                                        ),
                                        Text(
                                          '1-06-2024',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff555555)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'DD : ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff272727)),
                                        ),
                                        Text(
                                          '18-06-2024',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xff555555)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                const Row(
                                  children: [
                                    Text(
                                      'Client : ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff272727)),
                                    ),
                                    Text(
                                      'Dipesh',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff555555)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                const Row(
                                  children: [
                                    Text(
                                      'Machine Type : ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff272727)),
                                    ),
                                    Text(
                                      'Containership',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff555555)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                const Row(
                                  children: [
                                    Text(
                                      'Total Payment : ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff272727)),
                                    ),
                                    Text(
                                      '20000',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff555555)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                const Row(
                                  children: [
                                    Text(
                                      'Advance Payment : ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff272727)),
                                    ),
                                    Text(
                                      '${1200}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff555555)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3),
                                const Row(
                                  children: [
                                    Text(
                                      'Assigne Order : ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff272727)),
                                    ),
                                    Text(
                                      'Manager 1',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff555555)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(const Invoice());
                                      },
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffC9C9C9))),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: const Text(
                                            'Invoice',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                color: Color(0xff01959F)),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffC9C9C9))),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: const Text(
                                            'Edit',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                color: Color(0xff555555)),
                                          )),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      borderRadius: BorderRadius.circular(5),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color:
                                                      const Color(0xffC9C9C9))),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14,
                                                color: Color(0xffB50A0A)),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          alignment: Alignment.center,
                          "assets/images/no_order.png",
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          alignment: Alignment.center,
                          "assets/images/no_order.png",
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
          // const SizedBox(
          //   height: 20,
          // ),
          // Center(
          //   child: Image.asset(
          //     alignment: Alignment.center,
          //     "assets/images/no_order.png",
          //     height: 100,
          //   ),
          // ),
        ],
      ),
      // drawer: drawer(),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Get.to(const CreateNewOrder());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
  // drawer() {
  //   return Drawer(
  //     child: ListView(
  //       padding: EdgeInsets.zero,
  //       children: <Widget>[
  //         DrawerHeader(
  //             decoration: BoxDecoration(
  //               color: const Color(0xff3054CF).withOpacity(0.8),
  //             ),
  //             child: Column(
  //               children: [
  //                 CircleAvatar(
  //                     radius: (40),
  //                     child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(50),
  //                       child: SvgPicture.asset(
  //                         "assets/svg/ic_profile.svg",
  //                       ),
  //                     )),
  //                 const Text(
  //                   "Mahesh Patel",
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 14,
  //                   ),
  //                 ),
  //               ],
  //             )),
  //         ListTile(
  //           leading: SvgPicture.asset(
  //             "assets/svg/mange_user.svg",
  //             color: Colors.black,
  //             height: 20,
  //           ),
  //           title: const Text(
  //             'Manage Machinery',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: SvgPicture.asset(
  //             "assets/svg/all_users.svg",
  //             color: Colors.black,
  //             height: 20,
  //           ),
  //           title: const Text(
  //             'Manage User',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: SvgPicture.asset(
  //             "assets/svg/mange_user.svg",
  //             color: Colors.black,
  //             height: 20,
  //           ),
  //           title: const Text(
  //             'Manage Companies/Customers',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: SvgPicture.asset(
  //             "assets/svg/mange_user.svg",
  //             color: Colors.black,
  //             height: 20,
  //           ),
  //           title: const Text(
  //             'Manage Spare Parts',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: SvgPicture.asset(
  //             "assets/svg/mange_compny.svg",
  //             color: Colors.black,
  //             height: 20,
  //           ),
  //           title: const Text(
  //             'Manage Expenses',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //           onTap: () {},
  //         ),
  //         ListTile(
  //           leading: SvgPicture.asset(
  //             "assets/svg/mange_attend.svg",
  //             color: Colors.black,
  //             height: 20,
  //           ),
  //           title: const Text(
  //             'Manage Attendence',
  //             style: TextStyle(
  //               fontSize: 18,
  //               fontWeight: FontWeight.w400,
  //             ),
  //           ),
  //           onTap: () {},
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
