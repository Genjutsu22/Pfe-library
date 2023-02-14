import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Home_Screen.dart';
import 'package:myapp/LoginPage.dart';
import 'package:myapp/wait_connection.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return HomePage();
        else {
          return Wait_connection();
        }
      },
      stream: FirebaseAuth.instance.authStateChanges(),
    ));
  }
}
