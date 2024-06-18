import 'package:elements/bill_history/add_bill_history.dart';
import 'package:elements/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BillHistory extends StatefulWidget {
  const BillHistory({super.key});

  @override
  State<BillHistory> createState() => _BillHistoryState();
}

class _BillHistoryState extends State<BillHistory> {
  bool value = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Bill History",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
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
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xffC9C9C9)),
                  color: const Color(0xffFFFFFF)),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    hintText: "Search...",
                    hintStyle: const TextStyle(color: Color(0xffBEBEBE)),
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.search_rounded,
                        color: Color(0xffBEBEBE),
                      ),
                      color: const Color.fromRGBO(93, 25, 72, 1),
                      onPressed: () {},
                    )),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  // color: const Color(0xffDFF8FA),
                  border: Border.all(color: const Color(0xffD1D1D1)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/invoice.png",
                            height: 36,
                            width: 36,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ContainerShip.pdf",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                    color: Color(0xff555555),
                                  ),
                                ),
                                Text(
                                  "Thu Jan 06 at 17.20  3.24KB",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff848484),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "E",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff01959F)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: const Color(0xffD1D1D1))),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: SvgPicture.asset(
                                  'assets/svg/ic_edit.svg',
                                  height: 16,
                                  width: 16,
                                )),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: const Color(0xffD1D1D1))),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: const Icon(
                                Icons.delete,
                                size: 16,
                                weight: 16,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                      color: const Color(0xffD1D1D1))),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: const Icon(
                                Icons.share,
                                size: 16,
                                weight: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])),
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
            Get.to(const AddBillHistory());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
