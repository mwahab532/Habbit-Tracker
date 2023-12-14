import 'package:flutter/material.dart';
import 'package:flutter_application_habittracker/provider/Themeprovider.dart';
import 'package:flutter_application_habittracker/view/introduction.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("newbox");

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();

  runApp(
    ChangeNotifierProvider(
      child: HabbiteApp(),
      create: (context) => Themeprovider(
        isdarkmode: false,
      ),
    ),
  );
}

class HabbiteApp extends StatefulWidget {
  @override
  State<HabbiteApp> createState() => _HabbiteAppState();
}

class _HabbiteAppState extends State<HabbiteApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Themeprovider>(
      builder: (context, Themeprovider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Habit Tracker",
          theme: Themeprovider.getTheme,
          home: IntroductionScreens(),
        );
      },
    );
  }
}
