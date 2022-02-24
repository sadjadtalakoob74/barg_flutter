import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginService extends GetxController{
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool userNameValidate = false;
  bool passwordValidate = false;
  final String userName = "admin";
  final String password = "1234";
}