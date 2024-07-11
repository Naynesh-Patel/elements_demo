import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/constant/methods.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/controller/order_controller.dart';
import 'package:elements/home/create_new_order.dart';
import 'package:elements/home/invoice.dart';
import 'package:elements/home/tab/complete_tab.dart';
import 'package:elements/home/tab/ongoing_tab.dart';
import 'package:elements/home/tab/upcoming_tab.dart';
import 'package:elements/home/view_order_detail.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/button/small_button.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with TickerProviderStateMixin {
  late TabController tabController;
  int currentIndex = 0;

  HomeController controller = Get.find();
  OrderController orderController = Get.find();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
    orderController.getOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HomeAppBar(
        title: "MachinePro",
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _widgetTabBarView(),
            const SizedBox(
              height: 16,
            ),
            Obx(() => Expanded(child: controller.selectTab.value == 1
                ? const OnGoingTab()
                : controller.selectTab.value == 2
                ? const UpComingTab()
                : const CompleteTab())),
          ],
        ),
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

  Widget _widgetTabBarView() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.borderColor),
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: [
          Expanded(
            child: _tabBox(
              title: "Ongoing",
              index: 1,
            ),
          ),
          Expanded(
            child: _tabBox(
              title: "Upcoming",
              index: 2,
            ),
          ),
          Expanded(
            child: _tabBox(
              title: "Complete ",
              index: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBox({required String title, required int index}) {
    return Obx(() => InkWell(
          onTap: () {
            controller.selectTab.value = index;
          },
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: index == 1
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0))
                    : index == 3
                        ? const BorderRadius.only(
                            topRight: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0))
                        : null,
                color: controller.selectTab.value == index
                    ? AppColor.selectColor
                    : AppColor.whiteColor,
                border: Border(
                  right: index == 2
                      ? const BorderSide(color: AppColor.borderColor)
                      : BorderSide.none,
                  left: index == 2
                      ? const BorderSide(color: AppColor.borderColor)
                      : BorderSide.none,
                )),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              title,
              style: AppTextStyle.textStyleRegular16.copyWith(
                  color: controller.selectTab.value == index
                      ? AppColor.whiteColor
                      : AppColor.blackColor),
            ),
          ),
        ));
  }

}
