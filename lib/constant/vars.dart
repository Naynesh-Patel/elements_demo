import 'package:elements/model/model_user.dart';
import 'package:get/get.dart';

String languageCode = "en";
bool isLogin = false;

String androidVersion = "";
String iosVersion = "";

Rx<ModelUser> modelUser = ModelUser().obs;
