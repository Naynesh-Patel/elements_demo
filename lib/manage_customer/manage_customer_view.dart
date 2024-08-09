import 'dart:convert';

import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
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
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title:  "",
        onPressed: () {
          Get.back();
        },
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
            '${widget.model['owner'] ?? ''}',textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: AppColor.buttonColor),
          ),
          Text('${widget.model['company'] ?? ''}',textAlign: TextAlign.center,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4.0)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildMenu(
                    title: "Company",
                    subTitle: "Coding House",
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 6.0,),
                    Text("Contact No",style: AppTextStyle.textStyleRegular12,),
                    const SizedBox(height: 6.0,),
                    Row(
                      children: [
                        Expanded(child:  Text( widget.model['contact'] ?? '',style: AppTextStyle.textStyleRegular16,),),
                        InkWell(
                          child: const Icon(Icons.call),
                          onTap: () {
                            controller.makePhoneCall("7359085239");
                          },
                        ),

                      ],
                    ),

                    const SizedBox(height: 6.0,),
                    const Divider(
                      color: AppColor.borderColor,
                    ),
                  ],
                ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 6.0,),
                Text("Address",style: AppTextStyle.textStyleRegular12,),
                const SizedBox(height: 6.0,),
                Row(
                  children: [
                   Expanded(child:  Text( widget.model['address'] ?? '',style: AppTextStyle.textStyleRegular16,),),
                    InkWell(
                              child: Icon(Icons.location_on_outlined),
                              onTap: () {
                                controller.launchMap("");
                              },
                            ),
                  ],
                ),

                const SizedBox(height: 6.0,),
                const Divider(
                  color: AppColor.borderColor,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 6.0,),
                Text("Website",style: AppTextStyle.textStyleRegular12,),
                const SizedBox(height: 6.0,),
                Row(
                  children: [
                   Expanded(child:  Text( widget.model['website'] ?? '',style: AppTextStyle.textStyleRegular16,),),
                    InkWell(
                              child: Image.asset("assets/images/world_wide_web.png",height: 20,),
                              onTap: () {
                                controller.webURL();
                              },
                            ),
                  ],
                ),

                const SizedBox(height: 6.0,),
                const Divider(
                  color: AppColor.borderColor,
                ),
              ],
            ),
                buildMenu(
                    title: "Reference By",
                    subTitle: widget.model['reference'] ?? ''
                ),
                buildMenu(
                    title: "GST No",
                    subTitle: widget.model['gstin'] ?? '',
                ),


              ],
            ),
          ),
        ],
      ),
      // body: ListView(
      //   // crossAxisAlignment: CrossAxisAlignment.start,
      //   // mainAxisSize: MainAxisSize.min,
      //   children: [
      //     const SizedBox(height: 50,),
      //   Center(
      //     child:   widget.model
      //     ['photo'] ==
      //         ""
      //         ? Image.asset(
      //       'assets/images/user_profile.png',
      //       color: Colors.black54,
      //       height: 100,
      //       width: 100,
      //     )
      //         : SizedBox(
      //       height: 100,
      //       width: 100,
      //       child: ClipRRect(
      //           borderRadius:
      //           BorderRadius.circular(
      //               50.0),
      //           child: Image.memory(
      //             base64Decode(widget.model['photo']),
      //             fit: BoxFit.cover,
      //           )),
      //     ),
      //   ),
      //     customerView(
      //       "Company",
      //      widget.model
      //       ['company'] ?? '',
      //     ),
      //     customerView(
      //       "Owner Name",
      //       widget.model
      //       ['owner'] ?? '',
      //     ),
      //     ListTile(
      //       title: const Text("Contact No"),
      //       subtitle:  Text(    widget.model
      //       ['contact'] ??
      //           ''),
      //       trailing: InkWell(
      //         child: const Icon(
      //           color: Colors.black,
      //           Icons.call,
      //           size: 20,
      //         ),
      //         onTap: () {
      //           controller.makePhoneCall("7359085239");
      //         },
      //       ),
      //       onTap: () {},
      //     ),
      //     ListTile(
      //       title: const Text("Address"),
      //       subtitle: Text(   widget.model
      //       ['address'] ??
      //           ''),
      //       trailing: InkWell(
      //         child: const Icon(
      //           color: Colors.black,
      //           Icons.location_on_outlined,
      //           size: 20,
      //         ),
      //         onTap: () {
      //           controller.launchMap("");
      //         },
      //       ),
      //       onTap: () {},
      //     ),
      //     ListTile(
      //       title: const Text("Website"),
      //       subtitle: Text(widget.model
      //       ['website'] ??
      //           ''),
      //       trailing: InkWell(
      //         child: Image.asset("assets/images/world_wide_web.png",height: 20,),
      //         onTap: () {
      //           controller.webURL();
      //         },
      //       ),
      //       onTap: () {},
      //     ),
      //     customerView("Reference By",widget.model
      //     ['reference'] ??
      //         ''),
      //     customerView(
      //       "GST No",
      //       widget.model
      //       ['gstin'] ??
      //           '',
      //     ),
      //   ],
      // ),
    );
  }

  // Widget customerView(key, value) {
  //   return ListTile(
  //     title: Text(key),
  //     subtitle: Text(value),
  //     onTap: () {},
  //   );
  // }

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
