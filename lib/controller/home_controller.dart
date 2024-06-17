import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  
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

TextEditingController advancePaymentTextEditingController = TextEditingController();


}