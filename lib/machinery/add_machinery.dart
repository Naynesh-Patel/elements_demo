import 'package:elements/constant/app_colors.dart';
import 'package:elements/widget/custom_appbar.dart';
import 'package:elements/widget/custom_button.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMachinery extends StatefulWidget {
  const AddMachinery({super.key});

  @override
  State<AddMachinery> createState() => _AddMachineryState();
}

class _AddMachineryState extends State<AddMachinery> {
  bool value = false;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: "Add Machinery",
          onPressed: () {

          },
          action: [
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.add))
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              const CustomTextField(
                hintText: "Containership",
                labelText: "Name",
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                hintText: "Select Quatity ",
                labelText: "Manufacture Duration",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Add Spareparts',
                    style: TextStyle(
                        color: Color(0xff555555),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.add_rounded,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                    value: value,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ), //Ch
                  const Expanded(
                      child: Text(
                    "SpareParts 1",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  )),
                  Expanded(
                    child: Container(
                      height: 44,
                      width: 44,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: const Color(0xffD1D1D1), width: 1),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Qty',
                              hintStyle: TextStyle(color: Color(0xffD1D1D1))),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomButton(
            color: AppColor.buttonColor,
            buttonText: 'Add',
            onTap: () {},
          ),
        ));
  }
}
