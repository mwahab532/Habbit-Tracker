import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_habittracker/Constructor/habittile.dart';
import 'package:flutter_application_habittracker/Constructor/mydrawer.dart';
import 'package:flutter_application_habittracker/Constructor/newhabit.dart';
import 'package:flutter_application_habittracker/database/habbitedatabase.dart';
import 'package:flutter_application_habittracker/provider/Themeprovider.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _box = Hive.box("newbox");

  habitedatabase db = habitedatabase();
  int counter = 0;
  @override
  void initState() {
    if (_box.get("HABITLIST") == null) {
      db.createdeflautedata();
    } else {
      Home();
      db.loaddata();
    }
    super.initState();
  }

  void habitstarted(int index) {
    var startime = DateTime.now();

    int elaspedtime = db.habitelist[index][2];

    setState(() {
      db.habitelist[index][1] = !db.habitelist[index][1];
    });
    if (db.habitelist[index][1]) {
      Timer.periodic(
        Duration(seconds: 1),
        (timer) {
          setState(() {
            if (db.habitelist[index][1] == false) {
              timer.cancel();
            }
            var currentime = DateTime.now();
            db.habitelist[index][2] = elaspedtime +
                currentime.second -
                startime.second +
                60 *
                    (currentime.minute -
                        startime.minute +
                        60 * 60 * (currentime.hour - startime.hour));
          });
        },
      );
    }
    db.updatedata();
  }

  void settingsOpend(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Settings for " + db.habitelist[index][0]),
        );
      },
    );
  }

  void Delete(int index) {
    setState(() {
      db.habitelist.remove([db.habitelist[index], false, 0, 60]);
    });
    db.updatedata();
  }

  TextEditingController newhabitcontrollar = TextEditingController();
  void createnewhabit() {
    showDialog(
      context: context,
      builder: (context) {
        return newhabit(
          newhabitcontrollar: newhabitcontrollar,
          onsave: onsave,
          onCancel: oncancel,
        );
      },
    );
  }

  Future<void> onsave() async {
    setState(
      () {
        if (newhabitcontrollar.text.isEmpty) {
          throw Exception("Error!Please add habbit name");
        } else if (newhabitcontrollar.text.length < 5) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Your habit name must be more then 5 characterz"),
              );
            },
          );
        } else {
          db.habitelist.add(
            [newhabitcontrollar.text, false, 0, 60],
          );
        }
      },
    );
    newhabitcontrollar.clear();
    Navigator.pop(context);
    db.updatedata();
  }

  void oncancel() {
    newhabitcontrollar.clear();
    Navigator.pop(context);
  }

  void deletehabit(int index) {
    setState(
      () {
        db.habitelist.removeAt(index);
      },
    );
    db.updatedata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Habit Tracker",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.brightness_6,
                color: Colors.white,
              ),
              onPressed: () {
                Themeprovider themeprovider = Provider.of<Themeprovider>(
                  context,
                  listen: false,
                );
                themeprovider.swaptheme();
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 15),
          child: ListView.builder(
            itemCount: db.habitelist.length,
            itemBuilder: (context, index) {
              return habittile(
                habitname: db.habitelist[index][0],
                habithastarted: db.habitelist[index][1],
                timespent: db.habitelist[index][2],
                goaltime: db.habitelist[index][3],
                ontap: () {
                  habitstarted(index);
                },
                settingstapped: (context) => settingsOpend(index),
                deletestapped: (context) => deletehabit(index),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey.shade900,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: createnewhabit,
        ),
        drawer: mydrawer(),
      ),
    );
  }
}
