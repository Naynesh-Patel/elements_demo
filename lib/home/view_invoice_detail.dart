import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/app bar/custom_appbar.dart';

class ViewInvoiceDetails extends StatefulWidget {
  const ViewInvoiceDetails({super.key});

  @override
  State<ViewInvoiceDetails> createState() => _ViewInvoiceDetailsState();
}

class _ViewInvoiceDetailsState extends State<ViewInvoiceDetails> {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: CustomAppBar(
          title: 'View invoice Details',
          onPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          child: Text("Machine 1"),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffFFFFFF),
                                borderRadius: BorderRadius.circular(6),
                                border:
                                    Border.all(color: const Color(0xffD1D1D1))),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: const Icon(
                              Icons.delete,
                              size: 16,
                              weight: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
              const SizedBox(
                height: 20,
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
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Download Pdf',
            onTap: () {},
          ),
        ));
  }
}
