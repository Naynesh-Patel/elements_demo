import 'dart:convert';
import 'dart:developer';

import 'package:elements/constant/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxInt selectTab = 1.obs;

  /* ========== Focus Nodes =========== */

  FocusNode deliveryDateFocusNode = FocusNode();
  FocusNode paymentFocusNode = FocusNode();
  FocusNode advancedPaymentFocusNode = FocusNode();

  FocusNode sparepartsNameFocusNode = FocusNode();
  FocusNode sparepartsQtyFocusNode = FocusNode();
  FocusNode sparepartsNewQtyFocusNode = FocusNode();

  FocusNode expenseNameFocusNode = FocusNode();
  FocusNode expenseTypeFocusNode = FocusNode();
  FocusNode expensePriceFocusNode = FocusNode();

  TextEditingController sDate = TextEditingController();
  TextEditingController eDate = TextEditingController();
  TextEditingController formatSDate = TextEditingController();
  TextEditingController formatEDate = TextEditingController();
/* ========== TextEditing Controller =========== */

  TextEditingController advancePaymentTextEditingController =
      TextEditingController();

  RxList<dynamic> machineList = <dynamic>[].obs;

  RxBool isMachineLoading = false.obs;

  Future getMachine() async {
    try {
      String url = "${baseURL}job/get?user_id=";
      log("API => $url");

      isMachineLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isMachineLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["data"];
        machineList.value = jobData;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isMachineLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isMachineLoading.value = false;
    }
  }

  Future deleteMachine(id) async {
    try {
      String url = "${baseURL}job/delete";
      log("API => $url");

      isMachineLoading.value = true;
      var response = await http.post(Uri.parse(url), body: {
        "id": id,
      });
      isMachineLoading.value = false;
      if (response.statusCode == 200) {
        isMachineLoading.value = false;
        var responseData = jsonDecode(response.body);
        if (responseData["status"] == 1) {}
      } else {
        debugPrint("statusCode::${response.statusCode}");
        isMachineLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error:$e");
      isMachineLoading.value = false;
    }
  }

  Future<void> updateMachine() async {
    Map<String, dynamic> body = {
      "user_id": "",
    };
    try {
      String url = "${baseURL}job/reject_candidate";
      log("API => $url");
      isMachineLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        isMachineLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isMachineLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isMachineLoading.value = false;
    }
  }
}
