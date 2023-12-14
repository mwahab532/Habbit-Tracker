import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier {
  late ThemeData _selectedtheme;

  ThemeData light = ThemeData.light().copyWith(
      primaryColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.grey[900],
      ));

  ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.white,
  );

  Themeprovider({bool? isdarkmode}) {
    _selectedtheme = isdarkmode! ? dark : light;
  }

  void swaptheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (_selectedtheme == dark) {
      _selectedtheme = light;
      pref.setBool('isdarkmode', false);
    } else {
      _selectedtheme = dark;
      pref.setBool('isdarkmode', true);
    }
    notifyListeners();
  }

  ThemeData get getTheme => _selectedtheme;
}
