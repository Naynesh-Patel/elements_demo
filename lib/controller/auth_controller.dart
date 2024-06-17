import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController mobileNumberTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController userTypeTextEditingController = TextEditingController();

  bool loginPasswordVisible = true;

  FocusNode focusNode = FocusNode();


  /* ========== Focus Nodes =========== */
  FocusNode mobileFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

}
