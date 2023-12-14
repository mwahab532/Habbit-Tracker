import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_habittracker/view/settings.dart';

class mydrawer extends StatelessWidget {
  const mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: FlutterLogo(
              size: 100,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text(
                "S e t t i n g s",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              SystemNavigator.pop();
            },
            child: ListTile(
              leading: Icon(
                Icons.logout,
              ),
              title: Text(
                "E x i t e",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
