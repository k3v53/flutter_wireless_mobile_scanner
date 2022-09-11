import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ServerScreen extends StatefulWidget {
  const ServerScreen({super.key});

  @override
  State<ServerScreen> createState() => _ServerScreenState();
}

class _ServerScreenState extends State<ServerScreen> {
  bool serverIsRunning = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Server"),
      ),
      body: Column(children: [
        Card(
          child: ListTile(
            trailing: const Icon(Icons.supervised_user_circle_outlined),
            title: Text("${serverIsRunning ? "Stop" : "Start"} server"),
            onTap: () => setState(() {
              serverIsRunning = !serverIsRunning;
            }),
          ),
        ),
      ]),
    );
  }
}
