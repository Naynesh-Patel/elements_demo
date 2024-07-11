import 'package:elements/auth/login.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:elements/dashboard.dart';
import 'package:elements/widget/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String dropdownvalue = 'User';
  bool isVisbale = true;

  var items = [
    'Admin',
    'User',
    'Seller',
  ];

  bool value = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF8FFFF),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  // border: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(4),
                  //     borderSide:
                  //         const BorderSide(color: Color(0xffD1D1D1))),
                  hintText: 'Email Address',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
              // CustomTextField(
              //   hintText: "Email Address",
              //   preFixWidget: Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: SvgPicture.asset(
              //       "assets/svg/ic_email.svg",
              //       height: 10,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // CustomTextField(
              //   hintText: "Enter Password",
              //   preFixWidget: Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: SvgPicture.asset(
              //       "assets/svg/ic_lock.svg",
              //       height: 10,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // CustomTextField(
              //   hintText: "Confirm Password",
              //   preFixWidget: Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: SvgPicture.asset(
              //       "assets/svg/ic_lock.svg",
              //       height: 10,
              //     ),
              //   ),
              // ),
              Row(
                children: [
                  Checkbox(
                    value: value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ), //Ch
                  InkWell(
                    onTap: () {},
                    child: RichText(
                      text: const TextSpan(
                        text: 'By Signing up agree to ',
                        style: TextStyle(color: Color(0xff555555)),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' trems & service',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColor.buttonColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              CustomButton(
                color: AppColor.buttonColor,
                isLoading: false.obs,
                buttonText: 'Sign Up',
                onTap: () {
                  Get.to(const DashBoard());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Color(0xff555555),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const Login());
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Color(0xff3054CF),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
