import 'dart:async';
import 'package:complaints_management/prefs/shared_pref_controller.dart';
import 'package:complaints_management/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'login_and_signup.dart';

class SplashPage extends StatefulWidget {
  static const String id = "SplashPage";

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    Timer(const Duration(seconds: 3), () {
      String route =
          SharedPrefController().loggedIn ? HomePage.id : LoginAndSignupPage.id;
      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: controller.value * 150,
                    width: controller.value * 150,
                    child: Image.asset('images/comments.png'),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Complaints Management System",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: controller.value * 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
