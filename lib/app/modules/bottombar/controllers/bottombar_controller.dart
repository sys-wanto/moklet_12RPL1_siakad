import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottombarController extends GetxController {
  var tabIndex = 0;

  void changeIndex(int index) {
    tabIndex = index;
    update();
  }

  BotBar({IconData? ikon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(ikon),
      label: label,
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
