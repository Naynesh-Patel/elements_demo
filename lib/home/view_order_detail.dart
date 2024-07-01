import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/home/select_machine.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewOrderDetails extends StatefulWidget {
  final bool isUpdate;
  const ViewOrderDetails({super.key, this.isUpdate = false});

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
          title:
              widget.isUpdate ? "Update Order Details" : "View Order Details",
          onPressed: () {
            Get.back();
          },
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetDropDownFromField(
                hintText: "Tata Steel Pvt.",
                labelText: "Customer/Company ",
                itemList: const ["Admin", "Usre", "Seller"],
                onTap: (value) {
                  debugPrint("Select => $value");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                  onTap: () {
                    Get.to(const SelectMachine());
                  },
                  hintText: "ContainerShip",
                  labelText: "Machine Type",
                  suffixFixIcon: Image.asset(
                    "assets/images/arrow_down.png",
                    height: 24,
                  )),
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Text("Machine ${index + 1}"),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            CustomDialogBox.showDeleteDialog(
                              context: context,
                              bodyText:
                                  "Do you really want to cancel these records? This process cannot be undone.",
                              onCancelTap: () {
                                Get.back();
                              },
                              onDeleteTap: () {
                                Get.back();
                              },
                            );
                          },
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
                  hintText: "18-10-2024",
                  labelText: "Delivery Date",
                  suffixFixIcon: Icon(
                    Icons.date_range,
                    size: 22,
                  )),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                hintText: "Rs 50,000",
                labelText: "Total Payment",
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: "Rs 10,000",
                labelText: "Advance Payment",
                enable: false,
                focusNode: FocusNode(),
              ),
              const SizedBox(
                height: 20,
              ),
              WidgetDropDownFromField(
                hintText: "Manager",
                labelText: "Assigns Order",
                itemList: const ["Admin", "Usre", "Seller"],
                onTap: (value) {
                  debugPrint("Select => $value");
                },
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
            buttonText: widget.isUpdate ? "Update" : "Add",
            onTap: () {
              Get.back();
            },
          ),
        ));
  }
}
