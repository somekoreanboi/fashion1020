import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:fashion1020/widgets/my_tabbed_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // return SomethingWentWrong();
          //TODO: implement this
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          // return MyAwesomeApp();
          //TODO: implement this
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MySplashScreen();
      },
    );
  }
}

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        function: () => Firebase.initializeApp(),
        duration: 3000,
        splash: 'images/beta_splash.png',
        splashIconSize: 200,
        nextScreen: MyTabbedPages(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white);
  }
}
