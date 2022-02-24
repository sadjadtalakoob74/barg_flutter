import 'package:barg_flutter/View/LoginPage.dart';
import 'package:barg_flutter/View/MainPage.dart';
import 'package:barg_flutter/View/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barg Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: "/login",
          page: () => const LoginPage(),
        ),
        GetPage(
          name: "/main",
          page: () => const MainPage(),
        ),
        GetPage(
          name: "/profile",
          page: () => const ProfilePage(),
        ),
      ],
      initialRoute: "/login",
    );
  }
}
