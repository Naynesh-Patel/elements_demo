import 'package:elements/constant/app_colors.dart';
import 'package:elements/controller/company_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCompany extends StatefulWidget {
  const SelectCompany({super.key});

  @override
  State<SelectCompany> createState() => _SelectCompanyState();
}

class _SelectCompanyState extends State<SelectCompany> {
  @override
  void initState() {
    super.initState();
    companyController.getCompany();
  }

  CompanyController companyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Select Company',
        onPressed: () {
          Get.back();
        },
      ),
      body: Obx(() => companyController.isGetCompanyLoading.value
          ? const CustomLoader()
          : companyController.companyList.isEmpty
              ? const EmptyView()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: companyController.companyList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        companyController
                                .selectCompanyTextEditingController.text =
                            companyController.companyList[index]['name'] ?? '';

                        Get.back();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: AppColor.borderColor))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              companyController.companyList[index]['name'] ??
                                  "",
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),

      // Obx(() => companyController.isGetCompanyLoading.value
      //     ? const CustomLoader()
      //     : companyController.companyList.isEmpty
      //         ? const EmptyView()
      //         : ListView.separated(
      //             shrinkWrap: true,
      //             itemCount: companyController.companyList.length,
      //             physics: const BouncingScrollPhysics(),
      //             padding: const EdgeInsets.symmetric(
      //                 vertical: 16.0, horizontal: 16),
      //             itemBuilder: (context, index) {
      //               return InkWell(
      //                 onTap: () {
      //                   companyController
      //                           .selectCompanyTextEditingController.text =
      //                       companyController.companyList[index]['name'] ?? '';
      //
      //                   Get.back();
      //                 },
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                         companyController.companyList[index]['name'] ??
      //                             '',
      //                         style: AppTextStyle.textStyleRegular16.copyWith(
      //                           color: const Color(0xff555555),
      //                         )),
      //                     const SizedBox(
      //                       height: 10,
      //                     ),
      //                     Container(
      //                       color: Colors.grey,
      //                       height: 1,
      //                     )
      //                   ],
      //                 ),
      //               );
      //             },
      //             separatorBuilder: (BuildContext context, int index) {
      //               return const SizedBox(
      //                 height: 20.0,
      //               );
      //             },
      //           )),
    );
  }
}
