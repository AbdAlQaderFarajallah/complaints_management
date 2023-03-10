import 'package:complaints_management/prefs/shared_pref_controller.dart';
import 'package:complaints_management/screens/all_senders.dart';
import 'package:complaints_management/screens/filters_screen.dart';
import 'package:complaints_management/screens/home_screen.dart';
import 'package:complaints_management/screens/new_inbox_screen.dart';
import 'package:complaints_management/screens/profile_screen.dart';
import 'package:complaints_management/screens/single_status_screen.dart';
import 'package:complaints_management/screens/user_update_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/category_screen.dart';
import 'screens/login_and_signup.dart';
import 'screens/search_screen.dart';
import 'screens/sender_search_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/status_screen.dart';
import 'screens/tags_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().initPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        SplashPage.id: (context) => const SplashPage(),
        LoginAndSignupPage.id: (context) => const LoginAndSignupPage(),
        HomePage.id: (context) => const HomePage(),
        // DetailsPage.id: (context) => const DetailsPage(),
        NewInboxPage.id: (context) => const NewInboxPage(),
        SenderSearchScreen.id: (context) => const SenderSearchScreen(),
        CategoryPage.id: (context) => const CategoryPage(),
        TagsPage.id: (context) => const TagsPage(),
        StatusPage.id: (context) => const StatusPage(),
        SearchPage.id: (context) => const SearchPage(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        UserUpdateScreen.id: (context) => const UserUpdateScreen(),
        SingleStatusScreen.id: (context) => SingleStatusScreen(data: '1'),
        FiltersScreen.id: (context) => const FiltersScreen(),
        AllSenderScreen.id: (context) => const AllSenderScreen(),
      },
    );
  }
}
