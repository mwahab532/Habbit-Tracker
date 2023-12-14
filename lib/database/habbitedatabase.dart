import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class habitedatabase {
  List habitelist = [];
  final Box _box = Hive.box("newbox");

  void createdeflautedata() {
    List habitlist = [
      ["Excersice", false, 0, 60],
      ["Running", false, 0, 60],
    ];
  }

  void loaddata() {
    habitelist = _box.get("HABITLIST");
  }

  void updatedata() {
    _box.put("HABITLIST", habitelist);
  }
}
