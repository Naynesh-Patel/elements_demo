import 'dart:convert';

import 'package:elements/controller/customer_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ManageCustomerView extends StatefulWidget {
 final dynamic model;
   const ManageCustomerView({super.key,required this.model});

  @override
  State<ManageCustomerView> createState() => _ManageCustomerViewState();
}

class _ManageCustomerViewState extends State<ManageCustomerView> {
  CustomerController controller = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:  widget.model
        ['company'] ??
            '',
        onPressed: () {
          Get.back();
        },
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 50,),
        Center(
          child:   widget.model
          ['photo'] ==
              ""
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
                borderRadius:
                BorderRadius.circular(
                    50.0),
                child: Image.memory(
                  base64Decode(widget.model['photo']),
                  fit: BoxFit.cover,
                )),
          ),
        ),
          customerView(
            "Company",
           widget.model
            ['company'] ?? '',
          ),
          customerView(
            "Owner Name",
            widget.model
            ['owner'] ?? '',
          ),
          ListTile(
            title: const Text("Contact No"),
            subtitle:  Text(    widget.model
            ['contact'] ??
                ''),
            trailing: InkWell(
              child: const Icon(
                color: Colors.black,
                Icons.call,
                size: 20,
              ),
              onTap: () {
                controller.makePhoneCall("7359085239");
              },
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Address"),
            subtitle: Text(   widget.model
            ['address'] ??
                ''),
            trailing: InkWell(
              child: const Icon(
                color: Colors.black,
                Icons.location_on_outlined,
                size: 20,
              ),
              onTap: () {
                controller.launchMap("");
              },
            ),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Website"),
            subtitle: Text(widget.model
            ['website'] ??
                ''),
            trailing: InkWell(
              child: Image.asset("assets/images/world_wide_web.png",height: 20,),
              onTap: () {
                controller.launchMap("");
              },
            ),
            onTap: () {},
          ),
          customerView("Reference By",widget.model
          ['reference'] ??
              ''),
          customerView(
            "GST No",
            widget.model
            ['gstin'] ??
                '',
          ),
        ],
      ),
    );
  }

  Widget customerView(key, value) {
    return ListTile(
      title: Text(key),
      subtitle: Text(value),
      onTap: () {},
    );
  }
}
