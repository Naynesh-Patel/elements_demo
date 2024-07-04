import 'package:elements/controller/customer_controller.dart';
import 'package:elements/controller/home_controller.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/controller/salesmen_controller.dart';
import 'package:elements/controller/setting_controller.dart';
import 'package:elements/controller/user_controller.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'spareparts_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<SparepartsController>(() => SparepartsController(),
        fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<SettingController>(() => SettingController(), fenix: true);
    Get.lazyPut<CustomerController>(() => CustomerController(), fenix: true);
    Get.lazyPut<SalesmenController>(() => SalesmenController(), fenix: true);
    Get.lazyPut<UserController>(() => UserController(), fenix: true);
    Get.lazyPut<MachineryController>(() => MachineryController(), fenix: true);
  }
}
