import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/widget/custom_appbar.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewOrderDetails extends StatefulWidget {
  const ViewOrderDetails({super.key});

  @override
  State<ViewOrderDetails> createState() => _ViewOrderDetailsState();
}

class _ViewOrderDetailsState extends State<ViewOrderDetails> {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: CustomAppBar(
        title: 'View Order Details',
        onPressed: () {
          Get.back();
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            CustomTextField(
              hintText: "Customer/Company",
              labelText: "Tata Steel Pvt.",
              enable: false,
              focusNode: FocusNode(),
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              hintText: "Machine Type",
              labelText: "ContainerShip",
              enable: false,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
                hintText: "Delivery Date",
                labelText: "18-10-2024",
                suffixFixWidget: Icon(
                  Icons.date_range,
                  size: 22,
                )),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              hintText: "Total Payment",
              labelText: "Rs 50,000",
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              hintText: "Total Payment",
              labelText: "Rs 50,000",
            ),

            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: "Advance Payment",
              labelText: "Rs 10,000",
              enable: false,
              focusNode: FocusNode(),
            ),
            CustomTextField(
              hintText: "Assign Order",
              labelText: "Manager 1",
              enable: false,
              focusNode: FocusNode(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
