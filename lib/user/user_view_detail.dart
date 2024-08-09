import 'dart:convert';

import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
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
      backgroundColor: AppColor.whiteColor,
      appBar: CustomAppBar(
        onPressed: () {
          Get.back();
        }, title: '',
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 24,
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
          const SizedBox(
            height: 16,
          ),
          Text(
            '${widget.model['name'] ?? ''}',textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.buttonColor),
          ),
          Text('${widget.model['user_type'] ?? ''}',textAlign: TextAlign.center,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildMenu(
                  title: "Company",
                  subTitle: "${widget.model['company_name'] ?? ''}"
                ),
                buildMenu(
                    title: "Contact No",
                    subTitle:  widget.model['contact_no'] ?? '',
                ),
                buildMenu(
                  title: "Address",
                  subTitle:   widget.model['address'] ?? '',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenu({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 6.0,),
        Text(title,style: AppTextStyle.textStyleRegular12,),
        const SizedBox(height: 6.0,),
        Text(subTitle,style: AppTextStyle.textStyleRegular16,),
        const SizedBox(height: 6.0,),
        const Divider(
          color: AppColor.borderColor,
        ),
      ],
    );
  }
}
