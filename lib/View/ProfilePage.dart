import 'package:barg_flutter/Model/user_data.dart';
import 'package:barg_flutter/ViewModel/ProfileService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ViewModel/LoginService.dart';
import '../ViewModel/MainService.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profilePageController = Get.put(ProfileService());
  final mainPageController = Get.find<MainService>();
  final loginController = Get.find<LoginService>();
  var rcvdData = {};

  @override
  Widget build(BuildContext context) {
    rcvdData = ModalRoute.of(context)?.settings.arguments as Map;
    var user = rcvdData["User"] as User;
    var isOwner = rcvdData["isOwner"] as bool;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFfff2cc),
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Color(0xFFd6b656), width: 2)),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // choose selected person from prev page
                Get.to(const ProfilePage(),
                    preventDuplicates: false,
                    arguments: {'User': user, 'isOwner': true});
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFF8fbb74),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: const Color(0xFFd5e8d4),
                  child: Image.asset(
                    'assets/images/user_default_ic.png',
                    fit: BoxFit.contain,
                    height: 22,
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(loginController.userName, style: const TextStyle(color: Colors.black)))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "Balance: " + user.balance,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              const Text('age: '),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 6,
                              ),
                              Text(user.age.toString()),
                            ],
                          ),
                        ),
                        Text('registered: ' +
                            user.registered.split("-")[3] +
                            user.registered.split("-")[4])
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              'about: ' + user.about,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ),
                          isOwner == true
                              ? GestureDetector(
                                  onTap: () {
                                    Get.snackbar(
                                        "Edit", "Edit button Pressed !");
                                  },
                                  child: Align(
                                    child: Container(
                                      height: 40,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        border: Border.all(
                                            color: Colors.black, width: 1.0),
                                        borderRadius: const BorderRadius.all(
                                            Radius.elliptical(100, 50)),
                                      ),
                                      child: const Center(
                                          child: Text(
                                        'Edit',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFe1d5e7),
                    border: Border.all(
                      color: const Color(0xFF9673a6),
                      width: 5,
                    ))),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft, child: Text("Friends")),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: user.friends.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: user.friends.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    profilePageController.isFriend = false;
                                    await Future.forEach<User>(
                                        mainPageController.data,
                                        (element) async => {
                                              if (user.friends[index].guid ==
                                                  element.guid)
                                                {
                                                  profilePageController
                                                      .isFriend = true,
                                                  await Get.toNamed("/profile",
                                                      arguments: {
                                                        'User': element,
                                                        'isOwner': false
                                                      },
                                                      preventDuplicates: false),
                                                }
                                            });

                                    if (!profilePageController.isFriend) {
                                      Get.snackbar("Error", "User not found.");
                                    }
                                  },
                                  child: Chip(
                                    label: Text(
                                      user.friends[index].name,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12.0),
                                    ),
                                    backgroundColor: const Color(0xFF0050ef),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          )
                        : const Center(
                            child: Text(
                            "No Friends",
                            style: TextStyle(color: Colors.red),
                          )),
                  )
                ])),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft, child: Text("greeting")),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Text(
                user.greeting,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFF1ba1e2),
                  border: Border.all(
                    color: const Color(0xFF006eaf),
                    width: 5,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
