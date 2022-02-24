import 'package:barg_flutter/ViewModel/LoginService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginService = Get.put(LoginService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 3.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const Image(
                          image: AssetImage("assets/images/ngo-logo.png"),
                          height: 240,
                          width: 200,
                          alignment: Alignment.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            style: const TextStyle(fontSize: 14.0),
                            controller: loginService.userNameController,
                            autofillHints: const [AutofillHints.username],
                            decoration: InputDecoration(
                                labelText: 'Enter your username',
                                errorText: loginService.userNameValidate
                                    ? 'Username Can\'t Be Empty'
                                    : null,
                                labelStyle: const TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                                hintStyle: const TextStyle(
                                    fontSize: 10.0, color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          height: 1.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            obscureText: true,
                            controller: loginService.passwordController,
                            style: const TextStyle(fontSize: 14.0),
                            autofillHints: const [AutofillHints.password],
                            decoration: InputDecoration(
                                labelText: 'Enter your password',
                                errorText: loginService.passwordValidate
                                    ? 'Password Can\'t Be Empty'
                                    : null,
                                labelStyle: const TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                                hintStyle: const TextStyle(
                                    fontSize: 10.0, color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        RaisedButton(
                          color: Colors.teal,
                          textColor: Colors.black,
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width / 2,
                            child: const Center(
                              child: Text("Login",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  )),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)),
                          onPressed: () {
                            loginService.userNameController.text.isEmpty
                                ? loginService.userNameValidate = true
                                : loginService.userNameValidate = false;
                            loginService.passwordController.text.isEmpty
                                ? loginService.passwordValidate = true
                                : loginService.passwordValidate = false;
                            if (loginService
                                    .userNameController.text.isNotEmpty &&
                                loginService
                                    .passwordController.text.isNotEmpty) {
                              if (loginService.userNameController.text.trim() ==
                                      loginService.userName &&
                                  loginService.passwordController.text.trim() ==
                                      loginService.password) {
                                Get.snackbar("Success", "Logged In.");
                                Get.toNamed("/main");
                              } else {
                                Get.snackbar("Failed",
                                    "Username or Password is incorrect, Retry.");
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
