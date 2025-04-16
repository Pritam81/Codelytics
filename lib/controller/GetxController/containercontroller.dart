import 'package:get/get.dart';

class Containercontroller extends GetxController {
  late RxDouble containerHeight;
  late double screenHeight; // Variable to store screen height

  @override
  void onInit() {
    super.onInit();
    screenHeight = Get.context!.height; // Get screen height
    containerHeight =
        (screenHeight * 0.47).obs; // Initialize with 20% of screen height
  }

  void adjustContainerHeight() {
    containerHeight.value =
        screenHeight * 0.49; // Adjust height to 20% of screen height
  }
}
