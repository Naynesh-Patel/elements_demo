import 'package:elements/auth/login.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _timer();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  _buildBody() {
    return Scaffold(
      backgroundColor:AppColor.whiteColor,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 100,
          width: 100,
        ),
      ),
    );
  }

  _timer() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.off(const Login());
      },
    );
  }
}
