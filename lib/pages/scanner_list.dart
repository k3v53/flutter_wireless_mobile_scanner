import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScannerList extends StatefulWidget {
  const ScannerList({super.key});

  @override
  State<ScannerList> createState() => _ScannerListState();
}

class _ScannerListState extends State<ScannerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List of scans")),
      body: ListView(
        children: [],
      ),
    );
  }
}
