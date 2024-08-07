import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

class Pdf extends StatefulWidget {
  const Pdf({super.key});

  @override
  State<Pdf> createState() => _PdfState();
}

class _PdfState extends State<Pdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Bill History",
          onPressed: () {
            Get.back();
          },
        ),
      body: const PDF().fromUrl(
        "https://pdfobject.com/pdf/sample.pdf",
        placeholder: (double progress) => Center(child: Text('$progress %')),
        errorWidget: (dynamic error) => Center(child: Text(error.toString())),
      )
    );
  }

}
