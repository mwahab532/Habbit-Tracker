import 'package:flutter/material.dart';
import 'package:flutter_application_habittracker/Constructor/Tile.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          mytile(
            text: 'Account',
            icon: (Icons.person),
          ),
          Divider(),
          mytile(
            text: 'Password',
            icon: (Icons.lock),
          ),
          mytile(
            text: 'Language',
            icon: (Icons.language),
          ),
          mytile(
            text: 'Security',
            icon: (Icons.security),
          ),
          mytile(
            text: 'Notification',
            icon: (Icons.notifications),
          ),
        ],
      ),
    );
  }
}
