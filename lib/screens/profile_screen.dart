import 'package:complaints_management/prefs/shared_pref_controller.dart';
import 'package:complaints_management/screens/user_update_screen.dart';
import 'package:flutter/material.dart';

import '../api/controllers/auth/auth_api_controller.dart';
import 'login_and_signup.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = "ProfilePage";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6FF),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child:
                    Image.asset("images/person.png", width: 150, height: 150)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name : ${SharedPrefController().name}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(width: 20),
                TextButton(onPressed: () {
                  Navigator.pushNamed(context, UserUpdateScreen.id);
                }, child: const Text('Edit'))
              ],
            ),
            const SizedBox(height: 20),
            Text('Email : ${SharedPrefController().email}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 20),
            Text('Role : ${SharedPrefController().role}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 50),
            SizedBox(
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(5),
                      backgroundColor: const Color(0xFF003AFC),
                      shape: const StadiumBorder()),
                  onPressed: () async {
                    await logout(context);
                  },
                  child: const Text('LOGOUT')),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    bool loggedOut = await AuthApiController().logout();
    if (loggedOut)
      Navigator.pushReplacementNamed(context, LoginAndSignupPage.id);
  }
}
