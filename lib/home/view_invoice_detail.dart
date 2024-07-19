// import 'package:elements/constant/app_colors.dart';
// import 'package:elements/controller/home_controller.dart';
// import 'package:elements/widget/app%20bar/custom_appbar.dart';
// import 'package:elements/widget/button/custom_button.dart';
// import 'package:elements/widget/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ViewInvoiceDetails extends StatefulWidget {
//   const ViewInvoiceDetails({super.key});
//
//   @override
//   State<ViewInvoiceDetails> createState() => _ViewInvoiceDetailsState();
// }
//
// class _ViewInvoiceDetailsState extends State<ViewInvoiceDetails> {
//   HomeController controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: AppColor.whiteColor,
//         appBar: CustomAppBar(
//           title: 'View invoice Details',
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomTextField(
//                 hintText: "Customer/Company",
//                 labelText: "Tata Steel Pvt.",
//                 enable: false,
//                 focusNode: FocusNode(),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const CustomTextField(
//                 hintText: "Machine Type",
//                 labelText: "ContainerShip",
//                 enable: false,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(vertical: 10),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         const Expanded(
//                           child: Text("Machine 1"),
//                         ),
//                         InkWell(
//                           borderRadius: BorderRadius.circular(10),
//                           onTap: () {},
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 color: const Color(0xffFFFFFF),
//                                 borderRadius: BorderRadius.circular(6),
//                                 border:
//                                     Border.all(color: const Color(0xffD1D1D1))),
//                             padding: const EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 10),
//                             child: const Icon(
//                               Icons.delete,
//                               size: 16,
//                               weight: 16,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const CustomTextField(
//                   hintText: "Delivery Date",
//                   labelText: "18-10-2024",
//                   suffixFixIcon: Icon(
//                     Icons.date_range,
//                     size: 22,
//                   )),
//               const SizedBox(
//                 height: 20,
//               ),
//               const CustomTextField(
//                 hintText: "Total Payment",
//                 labelText: "Rs 50,000",
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const CustomTextField(
//                 hintText: "Total Payment",
//                 labelText: "Rs 50,000",
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               CustomTextField(
//                 hintText: "Advance Payment",
//                 labelText: "Rs 10,000",
//                 enable: false,
//                 focusNode: FocusNode(),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               CustomTextField(
//                 hintText: "Assign Order",
//                 labelText: "Manager 1",
//                 enable: false,
//                 focusNode: FocusNode(),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: CustomButton(
//             color: AppColor.buttonColor,
//             isLoading: false.obs,
//             buttonText: 'Download Pdf',
//             onTap: () {},
//           ),
//         ));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
//
// void main() => runApp(const ViewInvoiceDetails());
//
// class ViewInvoiceDetails extends StatelessWidget {
//   const ViewInvoiceDetails({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: PDFScreen(),
//     );
//   }
// }
//
// class PDFScreen extends StatelessWidget {
//   const PDFScreen({super.key}); //
//
//   final String pdfPath = 'https://codinghouse.in/machinepro/pdf/OrderNo-40.pdf';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF Viewer'),
//       ),
//       body: PDFView(
//         filePath: pdfPath,
//         enableSwipe: true,
//         swipeHorizontal: true,
//         autoSpacing: false,
//         pageFling: false,
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:elements/controller/order_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ViewInvoiceDetails extends StatefulWidget {
  final String pdfUrl;

  const ViewInvoiceDetails({super.key, required this.pdfUrl});

  @override
  // ignore: library_private_types_in_public_api
  _ViewInvoiceDetailsState createState() => _ViewInvoiceDetailsState();
}

class _ViewInvoiceDetailsState extends State<ViewInvoiceDetails> {
  String? localPath;
  String errorMessage = '';
  OrderController orderController = Get.find();

  @override
  void initState() {
    super.initState();
    _downloadPdf();
  }

  Future<void> _downloadPdf() async {
    try {
      final response = await http.get(Uri.parse(widget.pdfUrl));
      final bytes = response.bodyBytes;
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/temp.pdf');
      await file.writeAsBytes(bytes, flush: true);
      setState(() {
        localPath = file.path;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'PDF Viewer',
        onPressed: () {
          Get.back();
        },
      ),
      body: errorMessage.isNotEmpty
          ? Center(child: Text(errorMessage))
          : localPath == null
              ? const CustomLoader()
              : PDFView(
                  filePath: localPath!,
                  enableSwipe: true,
                  // password: "1234",
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: false,
                  onRender: (pages) {
                    setState(() {});
                  },
                  onError: (error) {
                    setState(() {
                      errorMessage = error.toString();
                    });
                  },
                  onViewCreated: (PDFViewController pdfViewController) {},
                ),
      // bottomNavigationBar: CustomButton(
      //     color: AppColor.buttonColor,
      //     buttonText: "Download Pdf",
      //     onTap: () {
      //       _downloadPdf();
      //     },
      //     isLoading: orderController.isPdfLoading),
    );
  }
}
