import 'package:get/get.dart';

import 'auth_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
  }
}
