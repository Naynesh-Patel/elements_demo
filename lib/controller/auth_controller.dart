import 'dart:convert';
import 'dart:developer';

import 'package:elements/auth/login.dart';
import 'package:elements/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../constant/urls.dart';
import '../model/model_user.dart';

class AuthController extends GetxController {
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController oldPasswordTextEditingController =
      TextEditingController();
  TextEditingController newPasswordTextEditingController =
      TextEditingController();
  TextEditingController confrimeTextEditingController = TextEditingController();
  TextEditingController userTypeTextEditingController = TextEditingController();

  bool loginPasswordVisible = true;
  bool changePasswordVisible = true;
  bool oldPasswordVisible = true;
  bool newPasswordVisible = true;

  RxBool isPasswordLoading = false.obs;

  final box = GetStorage();

  Rx<ModelUser> modelUser = ModelUser().obs;

  FocusNode focusNode = FocusNode();

  /* ========== Focus Nodes =========== */
  FocusNode mobileFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode changePasswordNode = FocusNode();
  FocusNode oldPasswordNode = FocusNode();
  FocusNode newPasswordNode = FocusNode();

  RxBool isLoginLoading = false.obs;

  Future<void> changePassword() async {
    Map<String, dynamic> body = {
      "user_id": modelUser.value.id,
      "old_password": oldPasswordTextEditingController.text,
      "new_password": newPasswordTextEditingController.text,
    };
    try {
      isPasswordLoading.value = true;
      String url = "${baseURL}user/changePassword";
      log("API => $url");
      isLoginLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        isPasswordLoading.value = false;
        GetStorage().write("isLogin", false);
        modelUser.value = ModelUser();
        Get.to(const Login());
      } else {
        debugPrint("Error");
        isPasswordLoading.value = false;
      }
    } catch (e) {
      isPasswordLoading.value = false;
    }
  }

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
        jsonDecode(response.body);
        if (responseData['status'] == 1) {
          box.write("user", responseData);
          box.write("isLogin", true);
          modelUser.value = ModelUser.fromJson(responseData['user']);
          Get.off(() => const Splash());
        } else {
          debugPrint('user not found');
        }
        isLoginLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isLoginLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isLoginLoading.value = false;
    }
  }
}
