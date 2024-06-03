import 'package:elements/constant/app_colors.dart';
import 'package:elements/user/add_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangeUser extends StatefulWidget {
  const MangeUser({super.key});

  @override
  State<MangeUser> createState() => _MangeUserState();
}

class _MangeUserState extends State<MangeUser> {
  bool value = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Mange User",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xffE6E6E6), width: 1)),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "nens",
                              style: TextStyle(
                                color: Color(0xff555555),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Role :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            Text(
                              "Worker",
                              style: TextStyle(color: Color(0xff555555)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            deleteDialog();
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Color(0xff555555),
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Color(0xff555555),
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Get.to(const AddUser());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }

  Future<void> deleteDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/colse.png",
                height: 50,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Are You Sure Delete?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Do you really want to delete these \nrecords? This process cannot be undone",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff949494)),
              )
            ],
          )),
          actions: <Widget>[
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffC1C1C1)),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.buttonColor),
                child: const Text(
                  'Delete',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
