import 'package:flutter/material.dart';
import 'package:hesa_v2/asserts/colorss.dart';
import 'package:hesa_v2/connectionpages/about.dart';
import 'package:hesa_v2/connectionpages/controller.dart';

class HesaDataReceiver extends StatefulWidget {
  const HesaDataReceiver({super.key});

  @override
  State<HesaDataReceiver> createState() => _HesaDataReceiverState();
}

class _HesaDataReceiverState extends State<HesaDataReceiver> {
  final TextEditingController _input1Controller = TextEditingController();
  final TextEditingController _input2Controller = TextEditingController();
  final TextEditingController _input3Controller = TextEditingController();
  String txtbut = "Automate";

  Future<void> _submitData() async {
    setState(() {
      txtbut = "Automating. . . ";
    });

    // Simulate a delay (e.g., for processing)
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      txtbut = "Failed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Enter the Link Lengths',
            style: TextStyle(color: textclr),
          ),
          centerTitle: true,
          backgroundColor: backgrnd,
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: textclr,
                )),
          )),
      drawer: Drawer(
        backgroundColor: textclr,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: backgrnd,
              ),
              child: Text(
                'Control Panel',
                style: TextStyle(
                  color: textclr,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.connect_without_contact,
                color: backgrnd,
              ),
              title: const Text('Mannual Mode'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HesaController()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.offline_bolt,
                color: backgrnd,
              ),
              title: const Text('Autonomus Mode'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: backgrnd,
              ),
              title: const Text('About'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AboutSection()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.exit_to_app,
                color: backgrnd,
              ),
              title: const Text('Exit'),
              onTap: () {
                // Handle exit action

                print('Exit clicked');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _input1Controller,
              decoration: const InputDecoration(
                labelText: 'LENGTH OF COXA',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _input2Controller,
              decoration: const InputDecoration(
                labelText: 'LENGTH OF FEMUR',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _input3Controller,
              decoration: const InputDecoration(
                labelText: 'LENGTH OF TIBIA',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitData,
              child: Text(
                txtbut,
                style: const TextStyle(color: backgrnd),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: backgrnd,
    );
  }
}
