import 'package:elements/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

// final int SHORT_DELAY = 1000; // 1seconds

void showToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColor.buttonColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

Future<DateTime?> openDatePicker(context,
    {required DateTime firstDate, lastDate}) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: firstDate,
    lastDate: lastDate,
/*    builder: (context, Widget? child) {
      return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.teal,
              primaryColorDark: Colors.black,
              accentColor: Colors.black,
            ),
          ),
          child: child!);
    },*/
  );
}

String getDateInDDMMMYY(date) {
  var d12 = DateFormat('dd-MMM-yyyy').format(date);
  return d12;
}


int daysBetween(f, t) {
  DateTime from=DateFormat("dd-MMM-yyyy").parse(f);
  DateTime to=DateFormat("dd-MMM-yyyy").parse(t);
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  int daysCount= (from.difference(to).inHours / 24).round();
  if(daysCount == 0){
    return 1;
  }else{
    return daysCount.abs();
  }

  // return (DateFormat("dd-MMM-yyyy")
  //             .parse(to)
  //             .difference(DateFormat("dd-MMM-yyyy").parse(from))
  //             .inHours /
  //         24)
  //     .round();
}

String getDate(String date) {
  DateTime dateTime = DateTime.parse(date);
  var outputFormat = DateFormat('dd MMM yyyy');
  var outputDate = outputFormat.format(dateTime);
  return outputDate.toString();
}

String  getDateInDDMMYY(date) {
  var d12 = DateFormat('dd MMMM yyyy').format(date);
  return d12;
}

String  getDateInDMYYYY(date) {
  var d12  = DateFormat('d/M/yyyy').format(date);
  return d12;
}

bool isValidEmail(email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isValidPhoneNumber(String? value) =>
    RegExp(r'(^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$)')
        .hasMatch(value ?? '');

Future<void> openPhoneCall({number}) async {
  Uri phoneno = Uri.parse('tel:${number}');
  if (await launchUrl(phoneno)) {
  } else {}
}

Future<void> openGmail() async {
  const uri = 'mailto:test@example.org?subject=Greetings&body=Hello%20World';
  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    throw 'Could not launch $uri';
  }
}

/*Future<bool> isInternetAvailable()async{
  ConnectivityResult result = await (Connectivity().checkConnectivity());
  if(result == ConnectivityResult.mobile){
   return true;
  }else if(result == ConnectivityResult.wifi){
    return true;
  }
  return false;
}*/
