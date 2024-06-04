import 'package:elements/constant/app_colors.dart';
import 'package:elements/spareparts/update_spareparts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SparepartsTab extends StatefulWidget {
  const SparepartsTab({super.key});

  @override
  State<SparepartsTab> createState() => _SparepartsTabState();
}

class _SparepartsTabState extends State<SparepartsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            'Stocks',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Spareparts 1',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555555)),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 115,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffD1D1D1))),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          hintText: '20 piece',
                          hintStyle: TextStyle(
                              color: Color(0xff949494),
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xffD1D1D1))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: SvgPicture.asset(
                          'assets/svg/ic_edit.svg',
                          height: 16,
                          width: 16,
                        )),
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Spareparts 2',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555555)),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 115,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffD1D1D1))),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          hintText: '20 piece',
                          hintStyle: TextStyle(
                              color: Color(0xff949494),
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xffD1D1D1))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: SvgPicture.asset(
                          'assets/svg/ic_edit.svg',
                          height: 16,
                          width: 16,
                        )),
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Spareparts 3',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555555)),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 115,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffD1D1D1))),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          hintText: '20 piece',
                          hintStyle: TextStyle(
                              color: Color(0xff949494),
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xffD1D1D1))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: SvgPicture.asset(
                          'assets/svg/ic_edit.svg',
                          height: 16,
                          width: 16,
                        )),
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: const Text(
                'Spareparts 4',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff555555)),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 115,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xffD1D1D1))),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          hintText: '20 piece',
                          hintStyle: TextStyle(
                              color: Color(0xff949494),
                              fontSize: 16,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xffD1D1D1))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: SvgPicture.asset(
                          'assets/svg/ic_edit.svg',
                          height: 16,
                          width: 16,
                        )),
                  ),
                ],
              ),
            ),
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
            Get.to(const UpdateSpareparts());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
