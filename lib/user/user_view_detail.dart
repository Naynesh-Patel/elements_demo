import 'dart:convert';

import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserViewDetils extends StatefulWidget {
  final bool isUpdate;
  final dynamic model;

  const UserViewDetils({super.key, this.isUpdate = false, this.model});

  @override
  State<UserViewDetils> createState() => _UserViewDetilsState();
}

class _UserViewDetilsState extends State<UserViewDetils> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onPressed: () {
          Get.back();
        },
        title: widget.model['name'] ?? '',
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: widget.model['photo'] == ""
                ? Image.asset(
                    'assets/images/user_profile.png',
                    color: Colors.black54,
                    height: 100,
                    width: 100,
                  )
                : SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.memory(
                          base64Decode(widget.model['photo']),
                          fit: BoxFit.cover,
                        )),
                  ),
          ),
          user(
            "User Role",
            widget.model['user_type'] ?? '',
          ),
          user(
            "Company",
            "Coding House",
          ),
          user(
            "User Name",
            widget.model['name'] ?? '',
          ),
          user(
            "Contact No",
            widget.model['contact_no'] ?? '',
          ),
          user(
            "Address",
            widget.model['address'] ?? '',
          ),
        ],
      ),
    );
  }

  Widget user(key, value) {
    return ListTile(
      title: Text(key),
      subtitle: Text(value),
      onTap: () {},
    );
  }
}
