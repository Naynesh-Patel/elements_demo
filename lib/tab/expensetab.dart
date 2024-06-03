import 'package:flutter/material.dart';

class ExpensetTab extends StatefulWidget {
  const ExpensetTab({super.key});

  @override
  State<ExpensetTab> createState() => _ExpensetTabState();
}

class _ExpensetTabState extends State<ExpensetTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Text("ExpensetTab")],
      ),
    );
  }
}
