import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/http/interface/request_base.dart';
import 'package:image_picker/image_picker.dart';

import 'package:newapp/common/colors.dart';
import 'package:get/get.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  bool hidePassword = true;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedGender;
  final List<String> genderOptions = ['Male', 'Female', 'Other'];

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  void clearController() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    passwordController.clear();
    setState(() {});
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      clearController();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form submitted successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                "Registration",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 15),
            const Divider(color: Color.fromARGB(255, 208, 204, 204)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Enter your Name",
                  prefixIcon: Icon(Icons.person, color: primary),
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) => value!.isEmpty ? "Name is required" : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Enter your email",
                  hintText: "example@gmail.com",
                  prefixIcon: Icon(Icons.mail, color: primary),
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value!.contains('@') ? null : "Enter a valid email",
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: selectedGender,
                      decoration: InputDecoration(
                        labelText: "Gender",
                        prefixIcon: Icon(
                          Icons.person_2_outlined,
                          color: primary,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      items:
                          genderOptions.map((String gender) {
                            return DropdownMenuItem<String>(
                              value: gender,
                              child: Text(gender),
                            );
                          }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                      validator:
                          (value) =>
                              value == null ? "Gender is required" : null,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone",
                        hintText: "99XXXXXXXX",
                        prefixIcon: Icon(Icons.call, color: primary),
                        border: OutlineInputBorder(),
                      ),
                      validator:
                          (value) =>
                              value!.length == 10
                                  ? null
                                  : "Enter a valid phone number",
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passwordController,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock, color: primary),
                  suffixIcon: IconButton(
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
                validator:
                    (value) =>
                        value!.length >= 6
                            ? null
                            : "Password must be at least 6 characters",
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => pickImage(ImageSource.camera),
                  tooltip: 'Pick from Camera',
                  child: const Icon(Icons.camera_alt),
                ),
                const SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () => pickImage(ImageSource.gallery),
                  tooltip: 'Pick from Gallery',
                  child: const Icon(Icons.photo_library),
                ),
              ],
            ),
            const SizedBox(height: 10),
            _image == null
                ? const Text('No image selected.')
                : Image.file(File(_image!.path), height: 100),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: submitForm, child: const Text("Submit")),

            ListTile(
              leading: IconButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),

                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.light),
                            title: Text("Light"),
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                              Get.back();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.dark_mode),
                            title: Text("Dark"),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                              Get.back();
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.brightness_4),
                            title: Text("System"),
                            onTap: () {
                              Get.changeTheme(ThemeData.fallback());
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.view_agenda),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
