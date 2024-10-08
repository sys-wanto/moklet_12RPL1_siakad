import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  var isPasswordHidden = true.obs;
  var rememberUser = false.obs;

  Future<void> auth() async {
    String username = txtUsername.text;
    String password = txtPassword.text;

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Harap isi semua field.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
      );
    } else {
      final url = Uri.parse('https://cors-anywhere.herokuapp.com/http://51.79.136.232:12016/odoo_connect');
    
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'jsonrpc': '2.0',
          'params': {
            'db': "db_siakad",
            'login': username,
            'password': password,
          },
        }),
      );
      
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['result'] != null) {
          print('Authentication successful');
          Get.offAllNamed(Routes.BOTTOMBAR);
        } else {
          print('Authentication failed: ${responseData['error']['message']}');
          Get.snackbar(
          "Error",
          "Autentikasi gagal, cek username & password.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.white,
        );
        }
      } else {
        print('Failed to connect to the server: ${response.statusCode}');
        // Handle connection failure
      }
    }
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleRememberUser(bool value) {
    rememberUser.value = value;
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
