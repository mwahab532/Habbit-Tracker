import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_habittracker/view/home.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreens extends StatelessWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WelCome To Habit Tracker"),
      ),
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: 'Learn to Go',
              body: 'This app will keep the record \n of your daily routine',
              image: FlutterLogo(
                size: 120,
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Create your activity',
              body: 'keep to your data in your hands',
              image: FlutterLogo(
                size: 120,
              ),
              decoration: getPageDecoration(),
            ),
            PageViewModel(
              title: 'Confrim',
              body: 'Are you sure you want use this App',
              image: FlutterLogo(
                size: 120,
              ),
              decoration: getPageDecoration(),
            ),
          ],
          onDone: () {
            if (kDebugMode) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ));
            }
          },
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: true,
          showSkipButton: true,
          skip: const Text("Skip",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
          next: const Icon(Icons.forward),
          done: const Text("Done",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
          dotsDecorator: getDotsDecorator()),
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
      imagePadding: EdgeInsets.only(top: 120),
      pageColor: Colors.white,
      bodyPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
      titlePadding: EdgeInsets.only(top: 50),
      bodyTextStyle: TextStyle(color: Colors.black54, fontSize: 15),
    );
  }

  //method to customize the dots style
  DotsDecorator getDotsDecorator() {
    return const DotsDecorator(
      spacing: EdgeInsets.symmetric(horizontal: 2),
      activeColor: Colors.black,
      color: Colors.grey,
      activeSize: Size(12, 5),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
    );
  }
}
