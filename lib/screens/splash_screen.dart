import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

   Future.delayed(const Duration(seconds: 3), () {
      loginstatus(); // Change this to your desired route
    });
  }

  @override
  Widget build(BuildContext context) {
    print("App started from splash_screen.dart");
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_logo.png', width: 500, height: 200),

            const Text(
              'Your Coding Journey, Simplified.',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  void loginstatus() async {
    var prefs = await SharedPreferences.getInstance();
    var islogin = prefs.getBool('islogin');
    if (islogin != null && islogin == true) {
      navigator?.pushReplacementNamed('/dashboard');
    } else {
      navigator?.pushReplacementNamed('/loginscreen');
    }
  }
}
