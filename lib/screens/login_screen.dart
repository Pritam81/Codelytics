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
        226,
        168,
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 25.0,
                        left: 25,
                        right: 25,
                        bottom: 10,
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
                    Text(
                      'Enter your LeetCode handle!',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),

                    SizedBox(height: height * 0.01),

                    FloatingActionButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onPressed: () async {
                        var prefs = await SharedPreferences.getInstance();
                        prefs.setString(
                          'username',
                          usernameController.text.trim(),
                        );
                        prefs.setBool("islogin", true);
                        navigator?.pushReplacementNamed('/dashboard');
                      },
                      backgroundColor: const Color.fromARGB(255, 255, 191, 0),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black54,
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    const Text(
                      'OR',
                      style: TextStyle(color: Colors.black54, fontSize: 13),
                    ),
                    SizedBox(height: height * 0.02),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign in as guest'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 191, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    Image.asset('assets/images/app_logo.png', width: 120),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
