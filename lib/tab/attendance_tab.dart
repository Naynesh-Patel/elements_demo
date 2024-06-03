import 'package:flutter/material.dart';

class AttendanceTab extends StatefulWidget {
  const AttendanceTab({super.key});

  @override
  State<AttendanceTab> createState() => _AttendanceTabState();
}

class _AttendanceTabState extends State<AttendanceTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("AttendanceTab")],
      ),
    );
  }
}
