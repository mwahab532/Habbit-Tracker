import 'package:flutter/material.dart';

class newhabit extends StatelessWidget {
  TextEditingController newhabitcontrollar = TextEditingController();
  late VoidCallback onsave;
  late final VoidCallback onCancel;
  newhabit(
      {required this.onsave,
      required this.onCancel,
      required this.newhabitcontrollar});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        keyboardType: TextInputType.text,
        controller: newhabitcontrollar,
        decoration: InputDecoration(
          hintText: "Charcter more then five",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: "New Habit",
          labelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ),
      actions: [
        MaterialButton(
          child: Text("Save"),
          onPressed: onsave,
        ),
        MaterialButton(
          child: Text("cancel"),
          onPressed: onCancel,
        ),
      ],
    );
  }
}
