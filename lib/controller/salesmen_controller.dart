import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:elements/constant/methods.dart';
import 'package:elements/constant/urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class SalesmenController extends GetxController {
  File? imgFile;

  TextEditingController workerTextEditingController = TextEditingController();
  TextEditingController salesmenNameTextEditingController =
      TextEditingController();
  TextEditingController contactNoTextEditingController =
      TextEditingController();

  List<dynamic> salesmenList = <dynamic>[].obs;

  RxBool isSalesmenLoading = false.obs;
  RxBool isGetSalesmenLoading = false.obs;
  RxBool isDeleteSalesmenLoading = false.obs;
  RxBool isUpdateSalesmenLoading = false.obs;

  Future<bool> pickImageFromGallery() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      imgFile = File(pickImage.path);
      return true;
    } else {
      return false;
    }
  }

  Future<void> addSalesmen() async {
    Map<String, dynamic> body = {
      // "name": nameTextEditingController.text,
      // "qty": qtyTypeTextEditingController.text,
      // "user_id": id,
    };
    try {
      String url = "${baseURL}sparepart/insert";
      log("API => $url");
      isSalesmenLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);

        Get.back();
        isSalesmenLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isSalesmenLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isSalesmenLoading.value = false;
    }
  }

  Future getSalesmen() async {
    try {
      String url = "${baseURL}sparepart/getAll";
      log("API => $url");
      isGetSalesmenLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isGetSalesmenLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["data"];
        salesmenList.val;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetSalesmenLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isGetSalesmenLoading.value = false;
    }
  }

  Future<void> updateSalesmen() async {
    Map<String, dynamic> body = {
      // "name": nameTextEditingController.text,
      // "qty": qtyTypeTextEditingController.text,
      // "user_id": id,
    };
    try {
      String url = "${baseURL}sparepart/update";
      log("API => $url");
      isUpdateSalesmenLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);

        // getSpareparts();
        // Get.back();
        isUpdateSalesmenLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isUpdateSalesmenLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isUpdateSalesmenLoading.value = false;
    }
  }

  Future<void> deleteSalesmen(id) async {
    try {
      String url = "${baseURL}sparepart/delete";
      log("API => $url");

      isDeleteSalesmenLoading.value = true;
      var response = await http.post(Uri.parse(url), body: {"id": id});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isDeleteSalesmenLoading.value = false;
        if (responseData["status"] == 1) {
          showToast(responseData["message"]);
          isDeleteSalesmenLoading.value = false;
        } else {
          showToast(responseData["message"]);
          isDeleteSalesmenLoading.value = false;
        }
      } else {
        debugPrint("statusCode===>${response.statusCode}");
        isDeleteSalesmenLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error:${e.toString()}");
      isDeleteSalesmenLoading.value = false;
    }
  }
}
