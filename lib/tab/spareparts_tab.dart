import 'package:flutter/material.dart';

class SparepartsTab extends StatefulWidget {
  const SparepartsTab({super.key});

  @override
  State<SparepartsTab> createState() => _SparepartsTabState();
}

class _SparepartsTabState extends State<SparepartsTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [Center(child: Text("SparepartsTab"))],
      ),
    );
  }
}
