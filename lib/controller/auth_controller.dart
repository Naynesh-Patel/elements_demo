import 'dart:convert';
import 'dart:developer';
import 'package:elements/constant/vars.dart';
import 'package:elements/dashboard.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../constant/methods.dart';
import '../constant/urls.dart';
import '../model/model_user.dart';

class AuthController extends GetxController {
  // Text Editing Controllers
  TextEditingController mobileNumberTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController oldPasswordTextEditingController = TextEditingController();
  TextEditingController newPasswordTextEditingController = TextEditingController();
  TextEditingController confrimeTextEditingController = TextEditingController();
  TextEditingController userTypeTextEditingController = TextEditingController();

  // Visibility flags for password fields
  bool loginPasswordVisible = true;
  bool changePasswordVisible = true;
  bool oldPasswordVisible = true;
  bool newPasswordVisible = true;

  // Observable flag for password loading state
  RxBool isPasswordLoading = false.obs;

  // Storage instance
  final box = GetStorage();

  // Focus nodes for input fields
  FocusNode focusNode = FocusNode();
  FocusNode mobileFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode changePasswordNode = FocusNode();
  FocusNode oldPasswordNode = FocusNode();
  FocusNode newPasswordNode = FocusNode();

  // Observable flag for login loading state
  RxBool isLoginLoading = false.obs;

  // Method to change password
  Future<void> changePassword({context}) async {
    Map<String, dynamic> body = {
      "user_id": modelUser.value.id,
      "old_password": oldPasswordTextEditingController.text,
      "new_password": newPasswordTextEditingController.text,
    };
    try {
      isPasswordLoading.value = true;
      String url = "${baseURL}user/changePassword";
      log("API => $url");
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          // Update user info in storage
          box.write("user", responseData['user']);
          modelUser.value = ModelUser.fromJson(responseData['user']);
          // Clear input fields
          oldPasswordTextEditingController.clear();
          newPasswordTextEditingController.clear();
          confrimeTextEditingController.clear();
          // Show success dialog
          CustomDialogBox.showPasswordReset(context: context);
          isPasswordLoading.value = false;
        } else {
          isPasswordLoading.value = false;
        }
      } else {
        debugPrint("Error");
        isPasswordLoading.value = false;
      }
    } catch (e) {
      isPasswordLoading.value = false;
    }
  }

  // Method to handle login
  Future<void> login() async {
    Map<String, dynamic> body = {
      "password": passwordTextEditingController.text,
      "contact_no": mobileNumberTextEditingController.text,
      "user_type": userTypeTextEditingController.text,
    };
    try {
      String url = "${baseURL}user/login";
      log("API => $url");
      isLoginLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          // Store user info and login status
          box.write('user', responseData['user']);
          box.write('isLogin', true);
          modelUser.value = ModelUser.fromJson(responseData['user']);
          // Navigate to Dashboard
          Get.off(() => const DashBoard());
        } else {
          debugPrint('User not found');
        }
        isLoginLoading.value = false;
      } else {
        debugPrint("StatusCode: ${response.statusCode}");
        isLoginLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
      isLoginLoading.value = false;
    }
  }

  // Method to delete account
  Future deleteAccount() async {
    try {
      String url = "${baseURL}user/delete_account";
      log("API => $url");
      var response = await http.post(Uri.parse(url), body: {
        "user_id": modelUser.value.id,
      });
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          showToast(responseData['message']);
        } else {
          showToast(responseData['message']);
        }
      } else {
        debugPrint("StatusCode: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
  }
}
