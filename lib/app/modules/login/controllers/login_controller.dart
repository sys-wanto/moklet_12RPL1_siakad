import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:get/get.dart';

import '../../../data/services/constant.dart';
import '../../../routes/app_pages.dart';
import '../../../data/repositories/repository_login.dart';

class LoginController extends GetxController {
  var txtUsername = TextEditingController().obs;
  var txtPassword = TextEditingController().obs;
  var isPasswordHidden = true.obs;
  var rememberUser = false.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRememberUser(bool? value) {
    rememberUser.value = value ?? false;
  }

  void authLogin() async {
    String username = txtUsername.value.text;
    String password = txtPassword.value.text;

    var params = {
      'db': DB_NAME,
      'username': username,
      'password': password,
    };

    isLoading.value = true;
    errorMessage.value = '';

    var loginResponse = await RepositoryLogin().login(body: params);

    if (loginResponse != null) {
      final responseString = await loginResponse.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseString);
      
      if (!jsonResponse['is_error']) {
        Get.offAllNamed(Routes.BOTTOMBAR);
      } else {
        errorMessage.value = jsonResponse['message'];
        Get.snackbar(
          "Error",
          "Autentikasi gagal: ${jsonResponse['message']}",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
      }
    } else {
      errorMessage.value = 'Gagal terhubung ke server.';
      Get.snackbar(
        "Error",
        "Gagal terhubung ke server.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    }
    isLoading.value = false;
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
