import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../constant/urls.dart';
import '../dashboard.dart';

class AuthController extends GetxController {
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController userTypeTextEditingController = TextEditingController();

  bool loginPasswordVisible = true;

  final box = GetStorage();

  FocusNode focusNode = FocusNode();

  /* ========== Focus Nodes =========== */
  FocusNode mobileFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  RxBool isLoginLoading = false.obs;

  Future<void> login() async {
    Map<String, dynamic> body = {
      "password": passwordTextEditingController.text,
      "mobile_no": mobileNumberTextEditingController.text,
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
        if (responseData['status'] == 0) {
        } else {
          box.write("user", responseData);
          box.write("isLogin", true);
          Get.off(() => const DashBoard());
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
