import 'package:elements/constant/app_colors.dart';
import 'package:elements/user/user_view_detail.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddUser extends StatefulWidget {
  final bool isUpdate;
  const AddUser({super.key, this.isUpdate = false});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool value = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          onPressed: () {
            Get.back();
          },
          title: widget.isUpdate ? "Update User Details" : "Add User",
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Profile :',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff555555)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Image.asset(
                          'assets/images/camera.png',
                          height: 80,
                          width: 80,
                        ),
                        Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: const Color(0xff01959F),
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(15)),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  WidgetDropDownFromField(
                    hintText: "Select User Role",
                    itemList: const ["Admin", "User", "Seller"],
                    onTap: (value) {
                      debugPrint("Select => $value");
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hintText: "Name",
                    labelText: "User Name",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    textInputType: TextInputType.numberWithOptions(),
                    hintText: "99656 25693",
                    labelText: "Contact No.",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hintText: "Surat,Gujrat",
                    labelText: "Address",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(
                    hintText: "Upload Fingerprint",
                    labelText: "Upload Fingerprint",
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Add',
            onTap: () {
              Get.to(const UserViewDetils());
            },
          ),
        ));
  }
}
