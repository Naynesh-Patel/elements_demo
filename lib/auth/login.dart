import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/auth_controller.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:elements/widget/custom_button_loader.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dropdown/dropdown_fromfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/methods.dart';

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
                  Text("Login",
                      style: AppTextStyle.textStyleBold20
                          .copyWith(fontSize: 26, fontFamily: "Kanit")),
                  const SizedBox(
                    height: 30,
                  ),
                  WidgetDropDownFromField(
                    hintText: "Select User Type",
                    labelText: "User Type*",
                    itemList: const ["Admin", "Manager", "Salesman"],
                    onTap: (value) {
                      controller.userTypeTextEditingController.text =value;
                      debugPrint("Select => $value");
                    },
                  ),
                  verticalSpacing(),
                  CustomTextField(
                    focusNode: controller.mobileFocusNode,
                    textInputType: TextInputType.number,
                    validator: validateMobile,
                    textEditingController:
                        controller.mobileNumberTextEditingController,
                    maxLength: 10,
                    hintText: "Mobile No",
                    labelText: "Mobile No*",
                  ),
                  verticalSpacing(),
                  CustomTextField(
                      focusNode: controller.passwordFocusNode,
                      obscureText: controller.loginPasswordVisible,
                      textEditingController:
                          controller.passwordTextEditingController,
                      hintText: "Password",
                      labelText: "Password*",
                      enable: true,
                      suffixFixIcon: IconButton(
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
                  Obx(
                    () => controller.isLoginLoading.value
                        ? const CustomButtonLoader()
                        : CustomButton(
                            color: AppColor.buttonColor,
                            buttonText: 'Login',
                            onTap: () {

                              if (controller.mobileNumberTextEditingController
                                  .text.isEmpty) {
                                showToast("Please enter mobile number");
                                if (controller.passwordTextEditingController
                                    .text.isEmpty) {
                                  showToast("Please enter password number");
                                }
                                if (controller.userTypeTextEditingController
                                    .text.isEmpty) {
                                  showToast("Please enter user type");
                                }
                              } else {
                                              controller.login();
                              }
                            },
                          ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }


  String? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

}
