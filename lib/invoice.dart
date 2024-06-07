import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9F9),
          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              'Invoice',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Color(0xff000000),
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(
                'assets/svg/ic_notification.svg',
                height: 22,
                width: 22,
              ),
            )
          ],
        ),
        body: Container(
          height: 80,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffC9C9C9)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/invoice.png",
                height: 50,
                width: 50,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ContainerShip.pdf",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color(0xff555555),
                    ),
                  ),
                  Text(
                    "Thu Jan 06 at 17.20  3.24KB",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Color(0xff848484),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/share.png",
                  height: 24,
                  width: 24,
                ),
              )
            ],
          ),
        ));
  }
}
