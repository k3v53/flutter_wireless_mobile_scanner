import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wireless_mobile_scanner/pages/scan.dart';
import 'package:flutter_wireless_mobile_scanner/pages/scanner_list.dart';
import 'package:flutter_wireless_mobile_scanner/pages/settings.dart';

import 'pages/server.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Scanner',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: (Platform.isAndroid || Platform.isIOS || kIsWeb)
          ? ScanScreen()
          : const ServerScreen(),
      routes: {
        'Server': (context) => const ServerScreen(key: Key('ServerScreen')),
        'Scan': (context) => ScanScreen(key: const Key('ScanScreen')),
        'ScannerList': (context) => const ScannerList(),
        'Settings': (context) => const Settings(key: Key('Settings'))
      },
    );
  }
}
