import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:elements/constant/vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../constant/methods.dart';
import '../constant/urls.dart';
import 'customer_controller.dart';

class OrderController extends GetxController {
  TextEditingController customerCompanyIdNoTextEditingController =
      TextEditingController();
  TextEditingController machineIdsTextEditingController =
      TextEditingController();

  // TextEditingController deliveryDateTextEditingController = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController formatDate = TextEditingController();
  TextEditingController totalPaymentEditingController = TextEditingController();
  TextEditingController advancePaymentEditingController =
      TextEditingController();
  TextEditingController assignOrderIdEditingController =
      TextEditingController();
  TextEditingController createdAtEditingController = TextEditingController();
  TextEditingController updatedAtEditingController = TextEditingController();

  RxBool isPdfLoading = false.obs;
  RxBool isOrderLoading = false.obs;
  RxBool isGetOrderLoading = false.obs;
  RxBool isDeleteOrderLoading = false.obs;
  RxBool isUpdateOrderLoading = false.obs;

  String customerCompany = '';

  CustomerController customerController = Get.find();

  RxList<dynamic> orderList = <dynamic>[].obs;
  RxList<dynamic> pdfList = <dynamic>[].obs;
  File? imgFile;

  // Future<bool> pickImageFromGallery() async {
  //   XFile? pickImage =
  //   await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickImage != null) {
  //     imgFile = File(pickImage.path);
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  // Future<void> addUser() async {
  //   Map<String, dynamic> body = {
  //     "name": userNameTextEditingController.text,
  //     "contact_no": contactNoTextEditingController.text,
  //     "address": addressTextEditingController.text,
  //     "user_type": userRoleTextEditingController.text,
  //     "fingerprint": fingerprintEditingController,
  //   };
  //   try {
  //     String url = "${baseURL}user/insert";
  //     log("API => $url");
  //     isUserLoading.value = true;
  //     var response = await http.post(Uri.parse(url), body: body);
  //     if (response.statusCode == 200) {
  //       jsonDecode(response.body);
  //       Get.back();
  //       getUser();
  //
  //       isUserLoading.value = false;
  //     } else {
  //       debugPrint("statusCode${response.statusCode}");
  //       isUserLoading.value = false;
  //     }
  //   } catch (e) {
  //     debugPrint("Error${e.toString()}");
  //     isUserLoading.value = false;
  //   }
  // }

  Future<void> addOrder({companyId, machineId, managerId}) async {
    Map<String, dynamic> body = {
      "user_id": modelUser.value.id,
      "customer_company_id": companyId.toString(),
      "machine_ids": machineId.toString(),
      "delivery_date": date.text,
      "total_payment": totalPaymentEditingController.text,
      "advance_payment": advancePaymentEditingController.text,
      "assign_order_id": managerId.toString(),
    };
    try {
      String url = "${baseURL}order/create";
      log("API => $url");
      isOrderLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == "success") {
          isOrderLoading.value = false;
          Get.back();
          getOrder();
        } else {
          showToast(responseData['message']);
          isOrderLoading.value = false;
        }
      } else {
        debugPrint("statusCode${response.statusCode}");
        isOrderLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isOrderLoading.value = false;
    }
  }

  Future getOrder() async {
    try {
      String url = "${baseURL}order/getAll";
      log("API => $url");
      isGetOrderLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        isGetOrderLoading.value = false;
        var responseData = jsonDecode(response.body);
        List jobData = responseData["orders"];
        orderList.value = jobData;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetOrderLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isGetOrderLoading.value = false;
    }
  }

  Future<void> updateOrder(model, {companyId, machineId, managerId}) async {
    Map<String, dynamic> body = {
      "id": modelUser.value.id,
      "user_id": modelUser.value.userType,
      "customer_company_id": companyId.toString(),
      "machine_ids": machineId.toString(),
      "delivery_date": date.text,
      "total_payment": totalPaymentEditingController.text,
      "advance_payment": advancePaymentEditingController.text,
      "assign_order_id": managerId.toString(),
    };
    try {
      String url = "${baseURL}order/update";
      log("API => $url");
      isUpdateOrderLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        // export PATH="$PATH:/Volumes/Storage/flutter/bin"
        Get.back();
        getOrder();
        isUpdateOrderLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isUpdateOrderLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isUpdateOrderLoading.value = false;
    }
  }

  Future<void> deleteUser(id) async {
    try {
      String url = "${baseURL}order/delete";
      log("API => $url");

      isDeleteOrderLoading.value = true;
      var response = await http.post(Uri.parse(url), body: {"id": id});
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        isDeleteOrderLoading.value = false;
        if (responseData["status"] == 1) {
          showToast(responseData["message"]);
          isDeleteOrderLoading.value = false;
        } else {
          showToast(responseData["message"]);
          isDeleteOrderLoading.value = false;
        }
      } else {
        debugPrint("statusCode===>${response.statusCode}");
        isDeleteOrderLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error:${e.toString()}");
      isDeleteOrderLoading.value = false;
    }
  }

  Future pdf() async {
    try {
      String url = "${baseURL}order/generatePdf?id=40";
      log("API => $url");
      pdfList.clear();
      isPdfLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == "success") {
          List jobData = responseData["data"];
          pdfList.value = jobData;
          isPdfLoading.value = false;
        } else {
          debugPrint("Error ${responseData['error']}");
          isPdfLoading.value = false;
        }
      } else {
        debugPrint("statusCode${response.statusCode}");
        isPdfLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isPdfLoading.value = false;
    }
  }


  Future<void> launchURL() async {
    final Uri uri =
    Uri.parse('https://codinghouse.in/machinepro/pdf/OrderNo-40.pdf');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print('Cannot launch: $uri');
      throw 'Could not launch $uri';
    }
  }
}
