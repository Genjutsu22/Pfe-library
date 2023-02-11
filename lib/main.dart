import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/BookPage.dart';
import 'package:myapp/BookslistPage.dart';
import 'package:myapp/CategoryPage.dart';
import 'package:myapp/Home_Screen.dart';
import 'package:myapp/LoginPage.dart';
import 'package:myapp/OnboardingPage.dart';
import 'package:myapp/ProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_auth/firebase_auth.dart';

int? isFirstLaunch;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isFirstLaunch = prefs.getInt('isFirstLaunch');
  await prefs.setInt('isFirstLaunch', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff0F111D),
        primarySwatch: Colors.grey,
      ),
      initialRoute: (isFirstLaunch == 0 || isFirstLaunch == null)
          ? "onboardingpage"
          : "/",
      routes: {
        "loginpage": (context) => const LoginScreen(),
        "/": (context) => const HomePage(),
        "categorypage": (context) => CategoryPage(),
        "bookpage": (context) => BookPage(),
        "onboardingpage": (context) => const OnboardingPage(),
        "bookslistpage": (context) => const BookslistPage(),
        "profilepage": (context) => const ProfilePage(),
      },
    );
  }
}
