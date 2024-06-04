import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant/app_colors.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_field.dart';

class UpdateSpareparts extends StatefulWidget {
  const UpdateSpareparts({super.key});

  @override
  State<UpdateSpareparts> createState() => _UpdateSparepartsState();
}

class _UpdateSparepartsState extends State<UpdateSpareparts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text('Update Spareparts',
        style: TextStyle(
           fontSize: 20,fontWeight: FontWeight.w400,color: Color(0xff272727)
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 15,),
            const CustomTextField(
              hintText: "Steel Bolt",
              labelText: "Name",
            ),
            SizedBox(height: 15,),
            const CustomTextField(
              hintText: "20",
              labelText: "Qty",
            ),
          ],
        ),
      ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Update',
            onTap: () {},
          ),
        )
    );
  }
}
