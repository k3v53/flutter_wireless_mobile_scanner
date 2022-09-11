import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_wireless_mobile_scanner/data/scan.dart';

class ScannerList extends StatefulWidget {
  const ScannerList({super.key});

  @override
  State<ScannerList> createState() => _ScannerListState();
}

class _ScannerListState extends State<ScannerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of scans"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () => setState(() => scannedData = []),
          )
        ],
      ),
      body: ListView(
        children: [
          for (var e in scannedData)
            Card(
              child: ListTile(title: Text(e)),
            )
        ],
      ),
    );
  }
}
