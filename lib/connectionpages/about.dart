import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hesa_v2/asserts/colorss.dart';
import 'package:hesa_v2/connectionpages/controller.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "About",
            style: TextStyle(color: textclr, fontSize: 20),
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
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AboutSection()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: backgrnd,
              ),
              title: const Text('About'),
              onTap: () {},
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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About Hexabot",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textckrbackgnd),
            ),
            SizedBox(height: 16),
            Text(
              "The Hexabot project is an innovative undertaking by students of Easwari Engineering College."
              "It is part of the Innovation Lab initiatives aimed at fostering creativity and technological advancements.",
              style: TextStyle(fontSize: 16, height: 1.5, color: textclr),
            ),
            SizedBox(height: 16),
            Text(
              "Project Objective",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textckrbackgnd),
            ),
            SizedBox(height: 8),
            Text(
              "The goal of this project is to develop a mobile-controlled Hexabot, which can be operated using this app. "
              "The app allows users to control the robot's movements in different directions  seamlessly, "
              "highlighting the practical applications of robotics and innovation.",
              style: TextStyle(fontSize: 16, height: 1.5, color: textclr),
            ),
            SizedBox(height: 16),
            Text(
              "Acknowledgments",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textckrbackgnd),
            ),
            SizedBox(height: 8),
            Text(
              "This project was made by Robotics and Automation 3rd year students of Easwari Engineering College"
              "\nAakash Kannaa R"
              "\nIswarya B"
              "\nKishore P R"
              "\n\nMade with the guildance of  Dr.S.Rajkamal [Assistant Professor]",
              style: TextStyle(fontSize: 16, height: 1.5, color: textclr),
            ),
          ],
        ),
      ),
      backgroundColor: backgrnd,
    );
  }
}
