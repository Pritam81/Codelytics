import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newapp/screens/login_screen.dart';
import 'package:newapp/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("App started from main.dart");
    return GetMaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {'/loginscreen': (context) => loginscreen()},
    );
  }
}
