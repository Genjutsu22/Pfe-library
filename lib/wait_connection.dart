import 'dart:async';

import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:myapp/AuthPage.dart';
import 'package:myapp/LoginPage.dart';

class Wait_connection extends StatefulWidget {
  const Wait_connection({super.key});

  @override
  State<Wait_connection> createState() => _Wait_connectionState();
}

class _Wait_connectionState extends State<Wait_connection> {
  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isconnected = false;
  @override
  void initState() {
    super.initState();
    start();
  }

  void checkconnect() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      isconnected = true;
    } else {
      isconnected = false;
    }
    setState(() {});
  }

  start() {
    subscription = Connectivity().onConnectivityChanged.listen((event) async {
      checkconnect();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0F111D),
        body: isconnected
            ? const LoginScreen()
            : SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("ESTG-Library",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 236, 235, 235),
                                  fontFamily: "kanit",
                                  fontSize: 29)),
                          SizedBox(
                            height: 120,
                          ),
                          Image.asset(
                            "assets/images/wait.png",
                            width: 160,
                            height: 160,
                          ),
                          Text(isconnected ? "Connecte" : "non connecte !",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "kanit",
                                  fontSize: 17)),
                        ],
                      ),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ));
  }
}
