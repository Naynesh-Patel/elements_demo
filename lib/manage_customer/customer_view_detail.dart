import 'package:elements/widget/custom_appbar.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerViewDetail extends StatefulWidget {
  final bool isUpdate;
  const CustomerViewDetail({super.key, this.isUpdate = false});

  @override
  State<CustomerViewDetail> createState() => _CustomerViewDetailState();
}

class _CustomerViewDetailState extends State<CustomerViewDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        onPressed: () {
          Get.back();
        },
        title: 'View Customer/Company Details',
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Profile :',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff555555)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Image.asset(
                        'assets/images/user_p.png',
                        height: 80,
                        width: 80,
                      ),
                      Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: const Color(0xff01959F),
                              // shape: BoxShape.circle,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 18,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                const CustomTextField(
                  hintText: "Company",
                  labelText: "tata",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  hintText: "Owner Name",
                  labelText: "Ratan tata",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  hintText: "Owner Name",
                  labelText: "Ratan tata",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  textInputType: TextInputType.numberWithOptions(),
                  hintText: "Contact No.",
                  labelText: "99656 25693",
                  suffixFixWidget: Icon(
                    Icons.call,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  textInputType: TextInputType.numberWithOptions(),
                  hintText: "Address",
                  labelText: "Surat,Gujrat",
                  suffixFixWidget: Icon(
                    Icons.location_on_outlined,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  textInputType: TextInputType.numberWithOptions(),
                  hintText: "Website",
                  labelText: "www.tatasteel.com",
                  suffixFixWidget: Icon(
                    Icons.location_on_outlined,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextField(
                  hintText: "Reference By",
                  labelText: "L & T Pvt",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
