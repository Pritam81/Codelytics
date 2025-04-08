// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:newapp/common/colors.dart';
import 'package:newapp/controller/GetxController/visibilitycontroller.dart';
import 'package:get/get.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({super.key});

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final VisibilityController controller = Get.put(VisibilityController());

  @override
  Widget build(BuildContext context) {
    print("App started from login_screen.dart");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: height * 0.10),
          Align(
            alignment: Alignment.bottomCenter,

            child: Image.asset('assets/images/leet_code_logo.png', width: 250),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: height * 0.46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
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
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Obx(
                        () => TextFormField(
                          obscureText: controller.isPasswordVisible.value,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(color: Colors.black54),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black54,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                controller.togglePasswordVisibility();
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),

                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 109,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text('Login'),
                    ),
                    SizedBox(height: height * 0.009),
                    Text(
                      "or you can sign in with",
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),

                    SizedBox(height: height * 0.02),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/google_logo.png',
                            width: 32,
                          ),
                          SizedBox(width: width * 0.09),
                          Image.asset(
                            'assets/images/github_logo.png',
                            width: 35,
                          ),
                          SizedBox(width: width * 0.09),
                          Image.asset(
                            'assets/images/facebook_logo.png',
                            width: 32,
                          ),
                          SizedBox(width: width * 0.09),
                          Image.asset(
                            'assets/images/linkedin_logo.png',
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
