import 'package:flutter/material.dart';
import 'package:newapp/controller/GetxController/visibilitycontroller.dart';
import 'package:get/get.dart';
import 'package:newapp/controller/text_editing_controller/textcontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  final VisibilityController controller = Get.put(VisibilityController());
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("App started from login_screen.dart");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(
        255,
        255,
        255,
        255,
      ), // GitHub dark mode background

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.10),
            Align(
              alignment: Alignment.bottomCenter,

              child: Image.asset(
                'assets/images/leet_code_logo.png',
                width: 250,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Container(
                  height: height * 0.40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 25,
                          right: 25,
                          bottom: 3,
                        ),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: const TextStyle(color: Colors.black54),
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Colors.black54,
                            ),
                            enabled: true,

                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 78.0),
                        child: Text(
                          'Enter your LeetCode handle!',
                          style: TextStyle(color: Colors.black54, fontSize: 13),
                        ),
                      ),

                      SizedBox(height: height * 0.01),

                      ElevatedButton(
                        onPressed: () async {
                          var prefs = await SharedPreferences.getInstance();
                          prefs.setString(
                            'username',
                            usernameController.text.trim(),
                          );
                          prefs.setBool("islogin", true);
                          navigator?.pushReplacementNamed('/dashboard');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 13.0,
                            horizontal: 73,
                          ),
                          child: const Text('Continue'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            191,
                            0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.02),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 27.0),
                              child: Divider(
                                color: Colors.black54,
                                thickness: 0.8,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 27.0),
                              child: Divider(
                                color: Colors.black54,
                                thickness: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.02),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            255,
                            191,
                            0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 13.0,
                            horizontal: 55,
                          ),
                          child: const Text('Sign in as guest'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
