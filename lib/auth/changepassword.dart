import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/auth_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_text_field.dart';

class ChangePassword extends StatefulWidget {
  final dynamic model;
  const ChangePassword({super.key, this.model});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  AuthController controller = Get.find();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onPressed: () {
          Get.back();
        },
        title: 'Change Password',
      ),
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            CustomTextField(
              focusNode: controller.oldPasswordNode,
              obscureText: controller.oldPasswordVisible,
              textEditingController:
                  controller.oldPasswordTextEditingController,
              maxLength: 6,
              hintText: "Old Password",
              labelText: "Old Password",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Old Password";
                } else {
                  return null;
                }
              },
              suffixFixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    controller.oldPasswordVisible =
                        !controller.oldPasswordVisible;
                  });
                },
                icon: Icon(
                  controller.oldPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
                focusNode: controller.newPasswordNode,
                obscureText: controller.newPasswordVisible,
                textEditingController:
                    controller.newPasswordTextEditingController,
                maxLength: 6,
                hintText: "New Password",
                labelText: "New Password",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter New Password";
                  } else {
                    return null;
                  }
                },
                suffixFixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      controller.newPasswordVisible =
                          !controller.newPasswordVisible;
                    });
                  },
                  icon: Icon(
                    controller.newPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: 20,
                  ),
                )),
            const SizedBox(
              height: 15,
            ),
            // CustomTextField(
            //     focusNode: controller.changePasswordNode,
            //     obscureText: controller.changePasswordVisible,
            //     textEditingController: controller.confrimeTextEditingController,
            //     maxLength: 6,
            //     hintText: "Confrime Password",
            //     labelText: "Confrime Password",
            //     validator: (value) {
            //       if (value!.isEmpty) {
            //         return "Enter Password";
            //       } else {
            //         return null;
            //       }
            //     },
            //     suffixFixIcon: IconButton(
            //       onPressed: () {
            //         setState(() {
            //           controller.changePasswordVisible =
            //               !controller.changePasswordVisible;
            //         });
            //       },
            //       icon: Icon(
            //         controller.changePasswordVisible
            //             ? Icons.visibility
            //             : Icons.visibility_off,
            //         size: 20,
            //       ),
            //     )),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: CustomButton(
          color: AppColor.buttonColor,
          buttonText: 'Change Password',
          onTap: () {
            if (_formKey.currentState!.validate()) {
              controller.changePassword(widget.model['id']);
            }
          },
        ),
      ),
    );
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 26.0,
    );
  }
}
