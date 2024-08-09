import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:elements/constant/vars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../constant/urls.dart';

class CompanyController extends GetxController {
  RxBool isCompanyLoading = false.obs;
  RxBool isGetCompanyLoading = false.obs;
  RxBool isGetCompanyDeleteLoading = false.obs;
  RxBool isGetCompanyUpdateLoading = false.obs;

  TextEditingController selectCompanyTextEditingController = TextEditingController();
  TextEditingController machineNameTextEditingController =
      TextEditingController();
  TextEditingController ownerTextEditingController = TextEditingController();
  TextEditingController contactTextEditingController = TextEditingController();
  TextEditingController updatedEditingController = TextEditingController();
  TextEditingController createdTextEditingController = TextEditingController();
  TextEditingController referenceTextEditingController =
      TextEditingController();
  TextEditingController gstinTextEditingController = TextEditingController();
  TextEditingController photoTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();

  RxList<dynamic> companyList = <dynamic>[].obs;

  File? imgFile;
  String base64Image = "";

  Future<bool> pickImageFromGallery() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      imgFile = File(pickImage.path);
      imageToBase64(file: imgFile!);
      return true;
    } else {
      return false;
    }
  }

  imageToBase64({required File file}) async {
    Uint8List bytes = await file.readAsBytes();
    base64Image = base64.encode(bytes);
  }

  Future<void> addCompany() async {
    Map<String, dynamic> body = {
      'id': modelUser.value.id,
      'name': selectCompanyTextEditingController.text,
      'created_at': createdTextEditingController.text,
      'updated_at': updatedEditingController.text,
    };
    try {
      String url = '${baseURL}company/create';
      log("API => $url");
      isCompanyLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        jsonDecode(response.body);
        getCompany();
        Get.back();
        isCompanyLoading.value = false;
      } else {
        debugPrint("statusCode${response.statusCode}");
        isCompanyLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isCompanyLoading.value = false;
    }
  }

  Future getCompany() async {
    try {
      String url = "${baseURL}company/getAll";
      log("API => $url");
      companyList.clear();
      isGetCompanyLoading.value = true;
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == "success") {
          List jobData = responseData["companies"];
          companyList.value = jobData;
          isGetCompanyLoading.value = false;
        } else {
          debugPrint("Error ${responseData['error']}");
          isGetCompanyLoading.value = false;
        }
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetCompanyLoading.value = false;
      }
    } catch (e) {
      debugPrint("Errors:$e");
      isGetCompanyLoading.value = false;
    }
  }

  Future<void> updateCompany(id) async {
    Map<String, dynamic> body = {
      'id': modelUser.value.id,
      'name': selectCompanyTextEditingController.text,
      'created_at': createdTextEditingController.text,
      'updated_at': updatedEditingController.text,
    };
    try {
      String url = "${baseURL}company/update";
      log("API => $url");
      isGetCompanyUpdateLoading.value = true;
      var response = await http.post(Uri.parse(url), body: body);
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == 1) {
          isGetCompanyUpdateLoading.value = false;
          getCompany();
          Get.back();
        } else {
          debugPrint("Error${responseData['message']}");
          isGetCompanyUpdateLoading.value = false;
        }
      } else {
        debugPrint("statusCode${response.statusCode}");
        isGetCompanyUpdateLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error${e.toString()}");
      isGetCompanyUpdateLoading.value = false;
    }
  }

  Future deleteCompany(id) async {
    try {
      String url = "${baseURL}company/delete";
      log("API => $url");

      isGetCompanyDeleteLoading.value = true;
      var response = await http.post(Uri.parse(url), body: {
        "id": id,
      });
      isGetCompanyDeleteLoading.value = false;
      if (response.statusCode == 200) {
        isGetCompanyDeleteLoading.value = false;
        var responseData = jsonDecode(response.body);
        if (responseData["status"] == 1) {}
      } else {
        debugPrint("statusCode::${response.statusCode}");
        isGetCompanyDeleteLoading.value = false;
      }
    } catch (e) {
      debugPrint("Error:$e");
      isGetCompanyDeleteLoading.value = false;
    }
  }
}
