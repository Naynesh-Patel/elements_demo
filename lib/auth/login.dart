import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/auth_controller.dart';
import 'package:elements/dashboard.dart';
import 'package:elements/widget/dropdown/common_dropdown.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  AuthController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 70,
                      width: 70,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                   Text(
                    "Login",
                    style: AppTextStyle.textStyleBold20.copyWith(fontSize: 26)
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  WidgetDropDownFromField(
                    hintText: "Select User Type",
                    itemList: const ["Admin","Usre","Seller"],
                    onTap: (value) {
                      debugPrint("Select => $value");
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    focusNode: controller.mobileFocusNode,
                    textInputType: TextInputType.number,
                    textEditingController:
                        controller.mobileNumberTextEditingController,
                    maxLength: 10,
                    hintText: "Mobile No*",
                    labelText: "Mobile No*",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      focusNode: controller.passwordFocusNode,
                      obscureText: controller.loginPasswordVisible,
                      textEditingController:
                          controller.passwordTextEditingController,
                      hintText: "Password*",
                      labelText: "Password*",
                      enable: true,
                      suffixFixWidget: IconButton(
                        onPressed: () {
                          setState(() {
                            controller.loginPasswordVisible =
                                !controller.loginPasswordVisible;
                          });
                        },
                        icon: Icon(
                          controller.loginPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    color: AppColor.buttonColor,
                    buttonText: 'Login',
                    onTap: () {
                      Get.to(const DashBoard());
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
