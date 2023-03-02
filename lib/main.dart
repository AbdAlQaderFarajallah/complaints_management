import 'package:complaints_management/screens/home_screen.dart';
import 'package:complaints_management/screens/new_inbox_screen.dart';
import 'package:flutter/material.dart';

import 'screens/login_and_signup.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage .id,
      routes: {
        // TestPage.id: (context) => const TestPage(),
        SplashPage.id: (context) => const SplashPage(),
        LoginAndSignupPage.id: (context) => const LoginAndSignupPage(),
        HomePage.id: (context) => const HomePage(),
        // DetailsPage.id: (context) => const DetailsPage(),
        NewInboxPage.id: (context) => const NewInboxPage(),
        // SenderSearchScreen.id: (context) => const SenderSearchScreen(),
        // CategoryPage.id: (context) => const CategoryPage(),
        // TagsPage.id: (context) => const TagsPage(),
        // StatusPage.id: (context) => const StatusPage(),
        // SearchPage.id: (context) => const SearchPage(),
      },
    );
  }
}
