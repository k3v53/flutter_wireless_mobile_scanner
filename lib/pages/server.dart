import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ServerScreen extends StatefulWidget {
  const ServerScreen({super.key});

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  bool serverIsRunning = false;
  String serverIp = "";
  void toggleServer() async {
    String? ip = await NetworkInfo().getWifiIP();
    setState(() {
      serverIsRunning = !serverIsRunning;
      serverIp = ip ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Card /* Toggle Server */ (
            child: ListTile(
              trailing: const Icon(Icons.supervised_user_circle_outlined),
              title: Text("${serverIsRunning ? "Stop" : "Start"} server"),
              onTap: toggleServer,
            ),
          ),
          AnimatedSwitcher /* Connect to server QR Code */ (
            duration: const Duration(milliseconds: 250),
            child: serverIsRunning
                ? Card(
                    child: Column(
                      children: [
                        QrImage(
                          data: serverIp,
                        ),
                        const Text("Scan the qr code to connect to the server",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                : Container(),
          )
        ]),
      ),
    );
  }
}
