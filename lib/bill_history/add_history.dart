import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHistory extends StatefulWidget {
  const AddHistory({super.key});

  @override
  State<AddHistory> createState() => _AddHistoryState();
}

class _AddHistoryState extends State<AddHistory> with TickerProviderStateMixin {
  bool value = false;
  int index = 0;
  late TabController tabController;
  int currentIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9F9),
          title: const Text(
            "Add History",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 25,
                ))
          ],
        ),
        body: Column(
          children: [
            TabBar(
              onTap: (value) {
                currentIndex = value;
                setState(() {});
              },
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColor.buttonColor,
              ),
              labelColor: const Color(0xffffffff),
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              unselectedLabelColor: Colors.black,
              controller: tabController,
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w600),
              tabs: [
                Tab(
                  child: Container(
                    width: double.maxFinite,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(4)),
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
          ],
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
