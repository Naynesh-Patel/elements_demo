import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/auth_controller.dart';
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
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                        controller.userTypeTextEditingController.text = value;
                        debugPrint("Select => $value");
                      },
                      validator: (value) {
                        if (value) {
                          return "Enter user type";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacing(),
                    CustomTextField(
                      focusNode: controller.mobileFocusNode,
                      textInputType: TextInputType.number,
                      textEditingController:
                          controller.mobileNumberTextEditingController,
                      maxLength: 10,
                      hintText: "Mobile No",
                      labelText: "Mobile No*",
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Mobile No";
                        } else {
                          return null;
                        }
                      },
                    ),
                    verticalSpacing(),
                    CustomTextField(
                        focusNode: controller.passwordFocusNode,
                        obscureText: controller.loginPasswordVisible,
                        textEditingController:
                            controller.passwordTextEditingController,
                        maxLength: 10,
                        hintText: "Password",
                        labelText: "Password*",
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else {
                            return null;
                          }
                        },
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
                    CustomButton(
                      color: AppColor.buttonColor,
                      isLoading: controller.isLoginLoading,
                      buttonText: 'Login',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }
}
