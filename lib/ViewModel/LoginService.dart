import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginService extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool userNameValidator = false;
  bool passwordValidator = false;
  final String userName = "admin";
  final String password = "1234";
}

class UsernameValidator extends GetxController {
  static String? validate(bool validator) {
    return validator ? 'Username Can\'t Be Empty' : null;
  }
}

class PasswordValidator extends GetxController {
  static String? validate(bool validator) {
    return validator ? 'Password Can\'t Be Empty' : null;
  }
}
