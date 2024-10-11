import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:test1/app/data/services/constant.dart';
import '../../../routes/app_pages.dart';
import '../../../data/repositories/repository_login.dart';

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  var isPasswordHidden = true.obs;
  var rememberUser = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRememberUser(bool value) {
    rememberUser.value = value;
  }

  void authLogin() async {
  String username = txtUsername.text;
  String password = txtPassword.text;

  var params = {
    'db': DB_NAME,
    'username': username,
    'password': password,
  };

  var loginResponse = await RepositoryLogin().login(body: params);

  if (loginResponse != null) {
    final responseString = await loginResponse.stream.bytesToString();
    final Map<String, dynamic> jsonResponse = json.decode(responseString);
    
    if (!jsonResponse['is_error']) {
      print('Authentication successful');
          Get.offAllNamed(Routes.BOTTOMBAR);
    } else {
      Get.snackbar(
        "Error",
        "Autentikasi gagal: ${jsonResponse['message']}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    }
  } else {
    Get.snackbar(
      "Error",
      "Gagal terhubung ke server.",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.white,
    );
  }
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
