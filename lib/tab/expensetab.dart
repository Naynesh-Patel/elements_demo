import 'package:elements/constant/app_colors.dart';
import 'package:elements/constant/app_text_style.dart';
import 'package:elements/constant/methods.dart';
import 'package:elements/controller/expense_controller.dart';
import 'package:elements/expense/add_expense.dart';
import 'package:elements/widget/app%20bar/home_app_bar.dart';
import 'package:elements/widget/custom_datepiker.dart';
import 'package:elements/widget/custom_loader.dart';
import 'package:elements/widget/custom_text_field.dart';
import 'package:elements/widget/dialogs/custom_dialogbox.dart';
import 'package:elements/widget/empty_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';

class ExpenseTab extends StatefulWidget {
  final bool isUpdate;

  const ExpenseTab({super.key, this.isUpdate = false});

  @override
  State<ExpenseTab> createState() => _ExpenseTabState();
}

class _ExpenseTabState extends State<ExpenseTab> {
  ExpenseController expenseController = Get.find();

  @override
  void initState() {
    setState(() {
      expenseController.startDate = null;
      expenseController.endDate = null;
      expenseController.nameTextEditingController.clear();
      expenseController.expenseTypeEditingController.clear();
      expenseController.getExpense();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: HomeAppBar(
        title: "Expense",
        action: [
          InkWell(
            onTap: () {
              showFilterSheet();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical:6.0,horizontal: 6.0),
              child: Image.asset(
                "assets/images/filtter.png",
                height: 20,
                width: 20,
              ),
            ),
          ),
          const SizedBox(width: 10.0,),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Obx(
          () => expenseController.isGetExpenseLoading.value
              ? const CustomLoader()
              : expenseController.expenseList.isEmpty
                  ? const EmptyView()
                  :  Column(
            children: [
              _tableTopContent(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: expenseController.expenseList.length,
                  itemBuilder: (context, index) {
                  return _tableView(
                      index: index,
                  );
                },),
              )
            ],
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
          ),
          backgroundColor: AppColor.buttonColor,
          onPressed: () {
            Get.to(const AddExpense());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }


  Widget _tableTopContent() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      decoration: const BoxDecoration(color: Color(0xffF1F1F1)),
      child: Row(
        children: [
          Expanded(
              child: Container(
                // color: Colors.red,
                child: Text(
                  "Name",
                  style: AppTextStyle.textStyleRegular14
                      .copyWith(color: AppColor.selectColor),
                ),
              )),
          Expanded(
              child: Container(
                  // color: Colors.yellow,
                  child: Text("Expense Type",textAlign: TextAlign.center, style: AppTextStyle.textStyleRegular14))),
          Expanded(
            child: Container(
              // color: Colors.grey,
              child: InkWell(
                onTap: () {
                  Get.to(const CustomDatePicker());
                },
                child:  Text(
                  "Date",textAlign: TextAlign.end,
                  style: AppTextStyle.textStyleRegular14
                      .copyWith(color: AppColor.selectColor),
                ),
              ),
            ),
          ),
                const SizedBox(
                 width: 14.0,)
        ],
      ),
    );
  }

  Widget _tableView({required int index}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Container(
            // color: Colors.yellow,
            child: Row(
              children: [
                Expanded(
                    child: Text(
                      "${expenseController.expenseList[index]['user_name']??''}",
                      style: AppTextStyle.textStyleRegular14
                          .copyWith(color: AppColor.blackColor),
                    )),
                Expanded(
                    child: Text("${expenseController.expenseList[index]['expense_type']??''} : ${expenseController.expenseList[index]['price']??''}",textAlign: TextAlign.center,
                        style: AppTextStyle.textStyleLight12
                            .copyWith(color: const Color(0xff555555)))),
                  Expanded(
                      child: Text(getDateInDMYYYY(DateTime.parse(expenseController.expenseList[index] ['created_at']??'')),
                          textAlign: TextAlign.end,
                          style: AppTextStyle.textStyleLight12
                              .copyWith(color: const Color(0xff555555)))),
                SizedBox(
                  width: 14.0,
                  height: Get.height*0.032,
                  // color: Colors.red,
                  child: PopupMenuButton(
                    onSelected: (value) {
                     if(value == "edit"){
                       Get.to(AddExpense(model: expenseController.expenseList[index],));
                     }else{
                       CustomDialogBox.showDeleteDialog(
                         context: context,
                         bodyText: "Do you really want to cancel these records? This process cannot be undone.",
                         onCancelTap: () {
                           Get.back();
                         },
                         onDeleteTap: () {
                           expenseController.deleteExpense(index: index);
                         },
                       );
                     }
                    },
                    surfaceTintColor: Colors.white,
                    color: Colors.white,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "edit",
                        height: 35,
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: "delete",
                        height: 35,
                        child: Text('Delete'),
                      ),
                    ],
                    icon: const Icon(Icons.more_vert,size: 18,),
                  ),
                ),
                ]
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Divider(
            height: 1,
          ),
        ],
      ),
    );
  }

  showFilterSheet(){
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0)
      ),
      context: context, builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return Container(
          // color: Colors.red,
          height: Get.height * 0.48,
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filter",style: AppTextStyle.textStyleBold16.copyWith(color: AppColor.buttonColor),),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      }, child: const Icon(Icons.cancel,color: AppColor.buttonColor,))
                ],
              ),
              const SizedBox(height: 20.0,),
              CustomTextField(
                textEditingController: expenseController.nameTextEditingController,
                hintText: "Name",
                labelText: "Name",
              ),
              const SizedBox(height: 20.0,),
              CustomTextField(
                textEditingController: expenseController.expenseTypeEditingController,
                hintText: "Expense Type",
                labelText: "Expense Type",
              ),
              const SizedBox(height: 20.0,),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                        textEditingController: TextEditingController(text: expenseController.startDate!= null ? DateFormat('dd-MMM-yyyy').format(expenseController.startDate!):''),
                        hintText: "Start Date",
                        labelText: "Start Date",
                        readOnly: true,
                        showCursor: false,
                        onTap: () async {
                          Map<String,dynamic>? map = await  Get.to(CustomDatePicker(
                            startDefaultDate: expenseController.startDate,
                            endDefaultDate: expenseController.endDate,
                          ));
                          if(map!= null){
                            expenseController.startDate = map['startDate'];
                            expenseController.endDate = map['endDate'];
                            setState(() {

                            });
                          }
                        },
                      )),
                  const SizedBox(width: 16.0,),
                  Expanded(
                    child: CustomTextField(
                      textEditingController: TextEditingController(text: expenseController.endDate!= null ? DateFormat('dd-MMM-yyyy').format(expenseController.endDate!):''),
                      hintText: "End Date",
                      labelText: "End Date",
                      readOnly: true,
                      showCursor: false,
                      onTap: () async {
                        Map<String,dynamic>? map = await  Get.to(CustomDatePicker(
                          startDefaultDate: expenseController.startDate,
                          endDefaultDate: expenseController.endDate,
                        ));
                        if(map!= null){
                          expenseController.startDate = map['startDate'];
                          expenseController.endDate = map['endDate'];
                          setState(() {

                          });
                        }
                      },
                    ),),
                ],
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          expenseController.getExpense();
                          Get.back();
                        },
                        child: Container(
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                          decoration: BoxDecoration(
                              color: AppColor.buttonColor,
                              borderRadius: BorderRadius.circular(24.0)
                          ),
                          child: Text("Apply Filter",textAlign: TextAlign.center,style: AppTextStyle.textStyleRegular14.copyWith(color: AppColor.whiteColor),),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0,),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          expenseController.nameTextEditingController.clear();
                          expenseController.expenseTypeEditingController.clear();
                          expenseController.getExpense();
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.buttonColor),
                              borderRadius: BorderRadius.circular(24.0)
                          ),
                          child: Text("Reset Filter",textAlign: TextAlign.center,style: AppTextStyle.textStyleRegular14,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
            ],
          ),
        );
      },);
    },);
  }

}
