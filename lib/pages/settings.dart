import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: ListView(children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.desktop_windows),
            title: const Text("Open server panel"),
            onTap: () => Navigator.pushNamed(context, 'Server'),
          ),
        )
      ]),
    );
  }
}
