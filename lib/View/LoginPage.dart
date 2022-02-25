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
                          height: 30.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: TextField(
                            keyboardType: TextInputType.text,
                            style: const TextStyle(fontSize: 14.0),
                            controller: loginService.userNameController,
                            autofillHints: const [AutofillHints.username],
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFF6c8ebf),
                                      width: 2.0),
                                ),
                                labelText: 'Enter your username',
                                errorText: UsernameValidator.validate(
                                    loginService.userNameValidator),
                                labelStyle: const TextStyle(
                                    fontSize: 14.0, color: Colors.black),
                                hintStyle: const TextStyle(
                                    fontSize: 10.0, color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
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
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xFF6c8ebf),
                                      width: 2.0),
                                ),
                                labelText: 'Enter your password',
                                errorText: PasswordValidator.validate(
                                    loginService.passwordValidator),
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
                          key: (const Key("LoginButton")),
                          color: const Color(0xFFf8cecc),
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
                              borderRadius: BorderRadius.circular(14.0),
                              side: const BorderSide(
                                  color: Color(0xFFb85450), width: 1.5)),
                          onPressed: () {
                            setState(() {
                              loginService.userNameController.text.isEmpty
                                  ? loginService.userNameValidator = true
                                  : loginService.userNameValidator = false;
                              loginService.passwordController.text.isEmpty
                                  ? loginService.passwordValidator = true
                                  : loginService.passwordValidator = false;
                              if (loginService
                                      .userNameController.text.isNotEmpty &&
                                  loginService
                                      .passwordController.text.isNotEmpty) {
                                if (loginService.userNameController.text
                                            .trim() ==
                                        loginService.userName &&
                                    loginService.passwordController.text
                                            .trim() ==
                                        loginService.password) {
                                  Get.snackbar("Success", "Logged In.");
                                  Get.toNamed("/main");
                                } else {
                                  Get.snackbar("Failed",
                                      "Username or Password is incorrect, Retry.");
                                }
                              }
                            });
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
