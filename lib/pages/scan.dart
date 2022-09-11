import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wireless_mobile_scanner/data/scan.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatefulWidget {
  AudioPlayer player = AudioPlayer();
  ScanScreen({super.key});

  Future<void> beep() async {
    await player.stop();
    await player.play(AssetSource('beep.m4a'));
  }

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  MobileScannerController cameraController = MobileScannerController();
  bool _isConnectedToServer = false;
  String Function() _lastScannedData =
      () => scannedData.isNotEmpty ? scannedData.last : "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mobile Scanner'),
          actions: [
            if (_isConnectedToServer)
              IconButton /* Disconnect Server */ (
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(Icons.power_settings_new)),
            IconButton /* List Switch */ (
              onPressed: () => Navigator.pushNamed(context, 'ScannerList'),
              icon: const Icon(Icons.list),
            ),
            IconButton /* Torch Switch*/ (
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton /* Camera Switch */ (
              color: Colors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
            IconButton /* Settings */ (
              onPressed: () => Navigator.pushNamed(context, 'Settings'),
              icon: const Icon(Icons.settings),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: MobileScanner(
                  allowDuplicates: false,
                  controller: cameraController,
                  onDetect: (barcode, args) {
                    if (barcode.rawValue == null) {
                      debugPrint('Failed to scan Barcode');
                    } else {
                      widget.beep();
                      setState(() {
                        final String code = barcode.rawValue!;
                        debugPrint('Barcode found! $code');

                        scannedData.add(code);
                      });
                    }
                  }),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 4),
              child: Hero(
                tag: "LastScan",
                child: ListTile(
                  dense: _lastScannedData().length > 50 || false,
                  leading: const Icon(Icons.qr_code_scanner),
                  title: Text(_lastScannedData()),
                  onTap: () => Navigator.pushNamed(context, 'ScannerList'),
                ),
              ),
            ),
          ],
        ));
  }
}
