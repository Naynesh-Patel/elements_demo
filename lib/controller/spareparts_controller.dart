import 'dart:convert';
import 'dart:developer';

import 'package:elements/constant/methods.dart';
import 'package:elements/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SparepartsController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController qtyTypeTextEditingController = TextEditingController();
  TextEditingController newqtyTypeTextEditingController =
      TextEditingController();
  TextEditingController sparepartsTextEditingController =
      TextEditingController();

  TextEditingController totalQtyTextEditingController = TextEditingController();

  RxBool isSparepartsLoading = false.obs;
  RxBool isGetSparepartsLoading = false.obs;
  RxBool isDeleteSparepartsLoading = false.obs;
  RxBool isUpdateSparepartsLoading = false.obs;

  FocusNode sparepartsNameFocusNode = FocusNode();
  FocusNode sparepartsQtyFocusNode = FocusNode();
  FocusNode sparepartsNewQtyFocusNode = FocusNode();

  RxList<dynamic> sparepartsList = <dynamic>[].obs;
  RxList<dynamic> selectSparepartsList = <dynamic>[].obs;

  RxBool isSelect = true.obs;

  // TextEditingController newQtyTypeTextEditingController = TextEditingController();

  // Future<void> addSpareparts() async {
  //   String url = '${baseURL}sparepart/insert';
  //   log("API => $url");
  //
  //   Map<String, dynamic> body = {
  //     "name": nameTextEditingController.text,
  //     "qty": qtyTypeTextEditingController.text,
  //     // "id": userTypeTextEditingController.text,
  //   };
  //
  //   var response = await http.post(Uri.parse(url), body: body);
  //
  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     data = body;
  //   }
  // }

  Future<void> addSpareparts() async {
    Map<String, dynamic> body = {
      "name": nameTextEditingController.text,
      "qty": qtyTypeTextEditingController.text,
      /* "user_id": modelUser.value.id,*/
    };
    try {
      String url = "${baseURL}sparepart/insert";
      log("API => $url");
      isSparepartsLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);

        getSpareparts();
        Get.back();
        isSparepartsLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isSparepartsLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isSparepartsLoading.value = false;
    }
  }

  Future getSpareparts() async {
    try {
      String url = "${baseURL}sparepart/getAll";
      log("API => $url");
      isGetSparepartsLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isGetSparepartsLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["data"];
        sparepartsList.value = jobData;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetSparepartsLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isGetSparepartsLoading.value = false;
    }
  }

  Future<void> updateSpareparts(id) async {
    Map<String, dynamic> body = {
      "name": nameTextEditingController.text,
      "qty": totalQtyTextEditingController.text,
      "id": id,
    };
    try {
      String url = "${baseURL}sparepart/update";
      log("API => $url");
      isSparepartsLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        Get.back();
        getSpareparts();
        isSparepartsLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isSparepartsLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isSparepartsLoading.value = false;
    }
  }

  // Future<void> deleteSpareparts(id) async {
  //   try {
  //     String url = "${baseURL}sparepart/delete";
  //     log("API => $url");
  //     isDeleteSparepartsLoading.value = false;
  //     var response = await http.post(Uri.parse(url), body: {
  //       "id": id,
  //     });
  //     if (response.statusCode == 200) {
  //       var responseData = jsonDecode(response.body);
  //       isDeleteSparepartsLoading.value = false;
  //       if (responseData["status"]["success"] == 1) {
  //         showToast(responseData["message"]);
  //         isDeleteSparepartsLoading.value = false;
  //       }
  //     } else {
  //       debugPrint("Fail");
  //     }
  //   } catch (e) {
  //     debugPrint("Error:$e");
  //     isDeleteSparepartsLoading.value = false;
  //   }
  // }

  Future<void> deleteSpareparts(id) async {
    try {
      String url = "${baseURL}sparepart/delete";
      log("API => $url");

      isDeleteSparepartsLoading.value = true;
      var response = await http.post(Uri.parse(url), body: {"id": id});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isDeleteSparepartsLoading.value = false;
        if (responseData["status"] == 1) {
          showToast(responseData["message"]);
          isDeleteSparepartsLoading.value = false;
        } else {
          showToast(responseData["message"]);
          isDeleteSparepartsLoading.value = false;
        }
      } else {
        debugPrint("statusCode===>${response.statusCode}");
        isDeleteSparepartsLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error:${e.toString()}");
      isDeleteSparepartsLoading.value = false;
    }
  }
}
