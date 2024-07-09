import 'package:elements/controller/customer_controller.dart';
import 'package:elements/widget/app%20bar/custom_appbar.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerViewDetail extends StatefulWidget {
  final bool isUpdate;
  const CustomerViewDetail({super.key, this.isUpdate = false});

  @override
  State<CustomerViewDetail> createState() => _CustomerViewDetailState();
}

class _CustomerViewDetailState extends State<CustomerViewDetail> {
  CustomerController controller = Get.find();
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
                CustomTextField(
                  enable: false,
                  textEditingController:
                      controller.companyTextEditingController,
                  hintText: "tata",
                  labelText: "Company",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  enable: false,
                  textEditingController: controller.ownerTextEditingController,
                  hintText: "Ratan tata",
                  labelText: "Owner Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  enable: false,
                  textEditingController:
                      controller.contactTextEditingController,
                  onTap: () async {
                    final call = Uri.parse('tel:+91 7359085239');
                    if (await canLaunchUrl(call)) {
                      launchUrl(call);
                    } else {
                      throw 'Could not launch $call';
                    }
                  },
                  textInputType: const TextInputType.numberWithOptions(),
                  hintText: "99656 25693",
                  labelText: "Contact No.",
                  suffixFixIcon: const Icon(
                    Icons.call,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  enable: false,
                  textEditingController:
                      controller.addressTextEditingController,
                  textInputType: const TextInputType.numberWithOptions(),
                  hintText: "Surat,Gujrat",
                  labelText: "Address",
                  suffixFixIcon: const Icon(
                    Icons.location_on_outlined,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  enable: false,
                  textEditingController:
                      controller.websiteTextEditingController,
                  textInputType: const TextInputType.numberWithOptions(),
                  hintText: " www.tatasteel.com",
                  labelText: "Website",
                  suffixFixIcon: Image.asset("assets/images/website.png"),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  enable: false,
                  textEditingController:
                      controller.referenceTextEditingController,
                  hintText: "L & T Pvt",
                  labelText: "Reference By",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
