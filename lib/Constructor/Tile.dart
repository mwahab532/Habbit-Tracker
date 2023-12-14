import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class mytile extends StatelessWidget {
  String text;
  final IconData? icon;
  final IconData? icon2;

  mytile({required this.text, this.icon, this.icon2});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
