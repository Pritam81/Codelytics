import 'package:flutter/material.dart';
import 'package:newapp/controller/GetxController/containercontroller.dart';
import 'package:newapp/controller/GetxController/visibilitycontroller.dart';
import 'package:get/get.dart';
import 'package:newapp/controller/text_editing_controller/textcontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  final VisibilityController controller = Get.put(VisibilityController());
  final TextEditingController usernameController = TextEditingController();
  final Containercontroller containerControllerObject = Get.put(
    Containercontroller(),
  );

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
            SizedBox(height: height * 0.05),
            Align(
              alignment: Alignment.bottomCenter,

              child: Image.asset(
                'assets/images/leet_code_logo.png',
                width: 250,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Obx(() {
                return Container(
                  height: containerControllerObject.containerHeight.value,
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
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
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
                                labelStyle: const TextStyle(
                                  color: Colors.black54,
                                ),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.black54,
                                ),
                                enabled: true,

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 78.0),
                            child: Text(
                              'Enter your LeetCode handle!',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                              ),
                            ),
                          ),

                          SizedBox(height: height * 0.01),

                          ElevatedButton(
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                var prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString(
                                  'username',
                                  usernameController.text.trim(),
                                );
                                prefs.setBool("islogin", true);
                                navigator?.pushReplacementNamed('/dashboard');
                              } else {
                                containerControllerObject.adjustContainerHeight();
                              }
                            },
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
                                horizontal: 73,
                              ),
                              child: const Text('Continue'),
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
                            onPressed: () {
                              var prefs = SharedPreferences.getInstance();
                              prefs.then((value) {
                                value.setString('username', 'Pritam_STP');
                                value.setBool("islogin", true);
                                navigator?.pushReplacementNamed('/dashboard');
                              });
                            },
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
                          SizedBox(height: height * 0.01),
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          ElevatedButton(
                            onPressed: () {
                              launchUrl(
                                Uri.parse(
                                  "https://leetcode.com/accounts/signup/",
                                ),
                              );
                            },
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
                              child: const Text('Create Account'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: height * 0.04),
            Text("Powered By"),
            Image.asset(
              'assets/images/app_logo.png',
              width: 100,
            ), // Add your logo here
          ],
        ),
      ),
    );
  }
}
