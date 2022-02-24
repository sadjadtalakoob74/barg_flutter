import 'package:barg_flutter/View/ProfilePage.dart';
import 'package:barg_flutter/ViewModel/MainService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../ViewModel/LoginService.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final mainService = Get.put(MainService());
  final loginController = Get.find<LoginService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/user_default_icon.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(loginController.userName))
            ],
          ),
        ),
        body: Obx(
          () {
            return mainService.data.isEmpty
                ? Shimmer.fromColors(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.image, size: 50.0),
                          subtitle: SizedBox(
                            child: Container(
                              color: Colors.teal,
                            ),
                            height: 10.0,
                          ),
                          title: SizedBox(
                            child: Container(
                              color: Colors.teal,
                            ),
                            height: 20.0,
                          ),
                        );
                      },
                    ),
                    baseColor: Colors.grey,
                    highlightColor: Colors.teal,
                  )
                : ListView.builder(
                    itemCount:
                        mainService.data == null ? 0 : mainService.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var user = mainService.data[index];
                      return Column(
                        children: <Widget>[
                          GestureDetector(
                            child: ListTile(
                              leading: CircleAvatar(
                                child: Image.network(user.picture,
                                    errorBuilder: (context, error,
                                            stackTrace) =>
                                        Image.asset(
                                            "assets/images/user_default_icon.png",
                                            width: 50,
                                            color: Colors.white,
                                            height: 50),
                                    width: 50,
                                    height: 50),
                              ),
                              title: Text(user.name),
                              subtitle: Text(user.email),
                            ),
                            onTap: () {
                              Get.to(const ProfilePage(),
                                  arguments: {'User': user, 'isOwner': true});
                            },
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              user.address + user.address,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                          ),
                          const Divider(),
                        ],
                      );
                    });
          },
        ));
  }
}
