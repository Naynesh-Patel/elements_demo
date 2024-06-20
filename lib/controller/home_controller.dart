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

/* ========== TextEditing Controller =========== */

  TextEditingController advancePaymentTextEditingController =
      TextEditingController();

  RxList<dynamic> machineList = <dynamic>[].obs;

  RxBool isJobLoading = false.obs;

  Future getMachine() async {
    try {
      String url = "${baseURL}job/get?user_id=";
      log("API => $url");

      isJobLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isJobLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["data"];
        machineList.value = jobData;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isJobLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isJobLoading.value = false;
    }
  }
}
