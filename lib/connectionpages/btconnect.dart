// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:bluetooth_classic/bluetooth_classic.dart';
import 'package:bluetooth_classic/models/device.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:hesa_v2/asserts/colorss.dart';
import 'package:hesa_v2/connectionpages/controller.dart';

class BlueClassic extends StatefulWidget {
  const BlueClassic({super.key});

  @override
  State<BlueClassic> createState() => _MyAppState();
}

class _MyAppState extends State<BlueClassic> {
  String _buttontext = "Connect To HESA";
  String _platformVersion = 'Unknown';
  final _bluetoothClassicPlugin = BluetoothClassic();
  final bool _scanning = false;
  int _deviceStatus = Device.disconnected;
  final List<String> _messages = [];
  String showtext = "Not Found";
  String isconnect = "Connecting.....";

  @override
  void initState() {
    super.initState();

    initPlatformState();
    _bluetoothClassicPlugin.onDeviceStatusChanged().listen((event) {
      setState(() {
        _deviceStatus = event;
      });
    });
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _bluetoothClassicPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> checkBluetooth() async {
    // Check if Bluetooth is supported
    if (await FlutterBluePlus.isSupported == false) {
      setState(() {
        isconnect = "Bluetooth not supported by this device";
      });
      return;
    }
    // For Android, turn on Bluetooth if it's off
    if (Platform.isAndroid) {
      try {
        await FlutterBluePlus.turnOn();
      } catch (e) {
        _showAlert(context, "Bluetooth Permission is Denied");
      }
    }
  }

  // Connect automatically to HC-05 using its MAC address
  Future<void> _connectToDevice(BuildContext context) async {
    try {
      checkBluetooth();
      await _bluetoothClassicPlugin.connect(
        "00:00:13:00:04:56", // HC-05 MAC address
        "00001101-0000-1000-8000-00805f9b34fb", // Serial port profile UUID
      );
      setState(() {
        //  _messages.add("Connected to HESA");
        //});
        // Show the connection status alert for 2 seconds
        _buttontext = "Connected";
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HesaController()));
      });
    } catch (e) {
      print("Failed to connect: $e");
      // Show the failure status alert for 2 seconds
      //_showAlert(context, "Failed to connect to HESA");
      _buttontext = "Failed";
    }
  }

  // Function to show an alert dialog for 2 seconds
  Future<void> _showAlert(BuildContext context, String message) async {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(""),
            ),
          ],
        );
      },
    );

    // Wait for 2 seconds and close the dialog
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop(); // Close the alert dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "HESA",
          style: TextStyle(color: textclr),
        ),
        backgroundColor: backgrnd,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _connectToDevice(context);
            _buttontext = "Connecting ...";
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: textclr,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(100),
            shadowColor: textckrbackgnd, // Shadow during elevation
            elevation: 5, // Default elevation
            surfaceTintColor: Colors.grey, // Effect color
          ),
          child: Text(
            _buttontext,
            style: const TextStyle(color: backgrnd, fontSize: 20),
          ),
        ),
      ),
      backgroundColor: backgrnd,
    );
  }
}
