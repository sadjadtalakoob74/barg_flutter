import 'dart:convert';
import 'package:barg_flutter/Model/user_data.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainService extends GetxController {
  List<User> data = <User>[].obs;

  void loadJsonData() async {
    await Future.delayed(const Duration(seconds: 4));
    var jsonText = await rootBundle.loadString('assets/json/userPrfofile.json');
    data.addAll(
        List<User>.from(json.decode(jsonText).map((x) => User.fromJson(x))));
  }

  @override
  void onInit() {
    super.onInit();
    loadJsonData();
  }
}
