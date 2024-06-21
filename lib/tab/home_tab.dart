import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/home/create_new_order.dart';
import 'package:elements/home/invoice.dart';
import 'package:elements/home/view_order_detail.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/button/small_button.dart';
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

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HomeAppBar(
        title: "MachinePro",
        // action: [
        //   SvgPicture.asset(
        //     "assets/svg/ic_notification.svg",
        //     height: 20,
        //     width: 20,
        //   ),
        //   const SizedBox(
        //     width: 16,
        //   ),
        // ],
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
            Obx(() => controller.selectTab.value == 1
                ? InkWell(
                    onTap: () {
                      Get.to(const ViewOrderDetails());
                    },
                    child: _onGoingView(),
                  )
                : controller.selectTab.value == 2
                    ? _upComingView()
                    : _completeView()),
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

  Widget _onGoingView() {
    return SingleChildScrollView(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColor.borderColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _keyValue(
                  "OD",
                  "1-06-2024",
                ),
                _keyValue(
                  "OD",
                  "18-06-2024",
                ),
              ],
            ),
            const SizedBox(height: 8),
            _keyValue(
              "Client",
              "Ramesh",
            ),
            const SizedBox(height: 8),
            _keyValue(
              "Machine Type",
              "Containership",
            ),
            const SizedBox(height: 8),
            _keyValue(
              "Total Payment",
              "20000",
            ),
            const SizedBox(height: 8),
            _keyValue(
              "Advance Payment",
              "12000",
            ),
            const SizedBox(height: 8),
            _keyValue(
              "Assigned Order",
              "Manager 1",
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmallButton(
                  title: "Invoice",
                  textColor: AppColor.selectColor,
                  onTap: () {
                    Get.to(const Invoice());
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                SmallButton(
                    title: "  Edit  ",
                    onTap: () {},
                    textColor: const Color(0xff555555)),
                const SizedBox(
                  width: 10,
                ),
                SmallButton(
                    title: "Cancel",
                    onTap: () {
                      CustomDialogBox.showDeleteDialog(
                        context: context,
                        bodyText:
                            "Do you really want to cancel these records? This process cannot be undone.",
                        onCancelTap: () {
                          Get.back();
                        },
                        onDeleteTap: () {},
                      );
                    },
                    textColor: const Color(0xffB50A0A)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _upComingView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _emptyView(),
        ],
      ),
    );
  }

  Widget _completeView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _emptyView(),
        ],
      ),
    );
  }

  Widget _keyValue(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$key : ",
          style: AppTextStyle.textStyleRegular16
              .copyWith(color: const Color(0xff272727)),
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

  Widget _emptyView() {
    return Container(
      height: Get.height * 0.55,
      padding: const EdgeInsets.symmetric(horizontal: 110.0),
      child: Image.asset(
        alignment: Alignment.center,
        "assets/images/no_order.png",
      ),
    );
  }
}
