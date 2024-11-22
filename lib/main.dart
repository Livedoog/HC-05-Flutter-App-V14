import 'package:flutter/material.dart';

import 'package:hesa_v2/connectionpages/btconnect.dart';

// Make sure this is the correct path to your BluetoothCheck widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, title: 'HESA', home: BlueClassic()
        //home: BlueClassic(), // Set BluetoothCheck as the home widget
        );
  }
}
