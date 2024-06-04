 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogBox {
 CustomDialogBox._();



 static showDialogBox({context, required String titleText,required String contentText,required String data}){
   return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
     return AlertDialog(
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(2),
      ),
      backgroundColor: Colors.white,
      title:  Text(
       titleText,
       textAlign: TextAlign.center,
       style: const TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 22,
           color: Color(0xff555555)),
      ),
      content:  Text(
       contentText,
       textAlign: TextAlign.center,
       style: const TextStyle(
        // fontWeight: FontWeight.w300,
           fontSize: 14,
           color: Color(0xff949494)),
      ),
      actions: [
       Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          InkWell(
           onTap: () {
            Get.back();
           },

           child: Container(
               padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
               decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xffC1C1C1),
               ),
               child: const Text("Cancel",
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 18,
                       fontWeight: FontWeight.w400))),
          ),
          InkWell(
           onTap: () {
            Get.back();
           },
           child: Container(
               padding:
               const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
               decoration: BoxDecoration(
                   color: const Color(0xff01959F), borderRadius: BorderRadius.circular(8)),
               child:  Text(data,
                   style: const TextStyle(
                       color: Colors.white,
                       fontSize: 18,
                       fontWeight: FontWeight.w400))),
          ),
         ],
        ),
       )


       // InkWell(
       //   onTap: () {
       //     Get.back();
       //   },
       //   child: Container(
       //     padding:
       //         const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
       //     decoration: BoxDecoration(
       //         borderRadius: BorderRadius.circular(8),
       //         color: AppColor.buttonColor),
       //     child: const Text(
       //       'Delete',
       //       style: TextStyle(
       //         color: Colors.white,
       //       ),
       //     ),
       //   ),
       // ),
      ],
     );
    },
   );
 }


 }