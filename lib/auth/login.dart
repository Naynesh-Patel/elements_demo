import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/auth_controller.dart';
import 'package:elements/dashboard.dart';
import 'package:elements/widget/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String dropdownvalue = 'User';
  var items = [
    'Admin',
    'User',
    'Seller',
  ];
  AuthController controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                  const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    textEditingController:
                        controller.userTypeTextEditingController,
                    hintText: "Select User Type",
                    labelText: " User Type",
                    suffixFixWidget: Image.asset(
                      "assets/images/down.png",
                      height: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    textEditingController:
                        controller.mobileNumberTextEditingController,
                    maxLength: 10,
                    hintText: "Mobile No",
                    labelText: "Mobile No",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      focusNode: controller.focusNode,
                      textEditingController:
                          controller.passwordTextEditingController,
                      hintText: "Password",
                      labelText: "Password",
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
                    height: 15,
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
