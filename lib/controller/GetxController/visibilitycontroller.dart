import 'package:get/get.dart';

class VisibilityController extends GetxController {
  RxBool isPasswordVisible = true.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
    print("Password visibility toggled: ${isPasswordVisible.value}");
  }
}
