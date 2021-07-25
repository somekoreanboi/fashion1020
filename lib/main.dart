import 'package:fashion1020/managers/auth_manager.dart';
import 'package:fashion1020/screens/my_profile_screen.dart';
import 'package:fashion1020/screens/notification_screen.dart';
import 'package:fashion1020/screens/post_screen.dart';
import 'package:fashion1020/screens/search_screen.dart';
import 'package:fashion1020/screens/splash_screen.dart';
import 'package:fashion1020/screens/view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/view': (context) => ViewScreen(),
        '/search': (context) => SearchScreen(),
        '/notification': (context) => NotificationScreen(),
        '/post': (context) => PostScreen(),
        '/my_profile': (context) => MyProfileScreen(),
      },
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
}
