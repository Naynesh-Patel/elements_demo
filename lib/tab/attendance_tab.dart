import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AttendanceTab extends StatefulWidget {
  const AttendanceTab({super.key});

  @override
  State<AttendanceTab> createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffF9F9F9),
        title: const Text(
          "Attendance",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/ic_notification.svg",
              height: 22,
              width: 22,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            DataTable(

                columns: [
                  DataColumn(
                    label: Text('Name'),
                  ),
                  DataColumn(
                    label: Text('Data'),
                  ),
                  DataColumn(
                    label: Text('CheckIn'),
                  ),
                  DataColumn(
                    label: Text('CheckOut'),
                  ),
                ],
                rows: [

                  DataRow(
                      cells: [
                    DataCell(Text('Dipesh')),
                    DataCell(Text('5/10/2023')),
                    DataCell(Text('10:00 AM')),
                    DataCell(Text('-')),
                  ])
                ])
          ],
        ),
      ),
    );
  }
}
