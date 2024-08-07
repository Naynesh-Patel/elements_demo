import 'dart:convert';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/controller/machinery_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewMachinery extends StatefulWidget {
  final Map<String, dynamic> model;

  const ViewMachinery({super.key, required this.model});

  @override
  State<ViewMachinery> createState() => _ViewMachineryState();
}

class _ViewMachineryState extends State<ViewMachinery> {
  MachineryController controller = Get.find();

  RxList<dynamic> sparepartsList = [].obs;

  @override
  void initState() {
    sparepartsList.value = jsonDecode(widget.model['spareparts']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "View Machinery",
        onPressed: () {
          Get.back();
        },
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          viewTile(
              title: "Machine Name", subtitle: widget.model['machine_name']),
          viewTile(
              title: "Machine Type", subtitle: widget.model['machine_type']),
          viewTile(
              title: "Qty", subtitle: widget.model['manufacture_duration']),
          viewTile(
              title: "Manufacture Days",
              subtitle: widget.model['manufacture_duration']),
          const SizedBox(height: 10.0,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Spareparts ",
              style: AppTextStyle.textStyleRegular18.copyWith(backgroundColor: Colors.grey.withOpacity(0.3)),
            ),
          ),
          const SizedBox(height: 10.0,),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: sparepartsList.length,
            itemBuilder: (context, index) {
              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _keyValue( "Name",sparepartsList[index]['name'] ?? ''),
                  _keyValue( "Qty",sparepartsList[index]['qty'] ?? ''),
                ],
              );
            }, separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 15,);

          },
          ),
        ],
      ),
    );
  }

  Widget viewTile({required String title, required String subtitle}) {
    return Container(
      // color: Colors.red,
      child: ListTile(
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        title: Text(
          title,
          style: AppTextStyle.textStyleRegular16,
        ),
        subtitle: Text(subtitle,
            style: AppTextStyle.textStyleRegular14
                .copyWith(color: const Color(0xff555555))),
      ),
    );
  }

  Widget _keyValue(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "$key : ",
          style: AppTextStyle.textStyleRegular16,
        ),
        Flexible(
            child: Text(
              "$value",
              style: AppTextStyle.textStyleRegular14
                  .copyWith(color: const Color(0xff555555)),
            )),
      ],
    );
  }

  Widget verticalSpacing() {
    return const SizedBox(
      height: 6.0,
    );
  }

}
