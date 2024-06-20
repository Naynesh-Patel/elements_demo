import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/setting_controller.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'home_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<CustomerController>(() => CustomerController(), fenix: true);
  }
}
