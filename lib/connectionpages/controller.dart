import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hesa_v2/asserts/colorss.dart';
import 'package:hesa_v2/connectionpages/about.dart';
import 'package:hesa_v2/connectionpages/automode.dart';

class HesaController extends StatefulWidget {
  const HesaController({super.key});

  @override
  State<HesaController> createState() => _HesaControllerState();
}

class _HesaControllerState extends State<HesaController> {
  double? gap = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Mannual Control',
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
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.offline_bolt,
                color: backgrnd,
              ),
              title: const Text('Autonomus Mode'),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HesaDataReceiver()));
              },
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
                SystemNavigator.pop();
                print('Exit clicked');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Left button
            ElevatedButton(
              onPressed: () => _handleButtonPress("Left"),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(30),
                backgroundColor: textckrbackgnd,
              ),
              child:
                  const Icon(Icons.arrow_left, size: 40, color: Colors.white),
            ),
            SizedBox(width: gap),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Up button
                ElevatedButton(
                  onPressed: () => _handleButtonPress("Up"),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(30),
                    backgroundColor: textckrbackgnd,
                  ),
                  child: const Icon(Icons.arrow_upward,
                      size: 40, color: Colors.white),
                ),
                SizedBox(height: gap),
                // Down button
                ElevatedButton(
                  onPressed: () => _handleButtonPress("Down"),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(30),
                    backgroundColor: textckrbackgnd,
                  ),
                  child: const Icon(Icons.arrow_downward,
                      size: 40, color: Colors.white),
                ),
              ],
            ),
            SizedBox(width: gap),
            // Right button
            ElevatedButton(
              onPressed: () => _handleButtonPress("Right"),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(30),
                backgroundColor: textckrbackgnd,
              ),
              child:
                  const Icon(Icons.arrow_right, size: 40, color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: backgrnd,
    );
  }

  void _handleButtonPress(String direction) {
    print('$direction button pressed');
    // Add any further logic to handle button presses here
  }
}
