import 'package:complaints_management/api/controllers/user_update_api_controller.dart';
import 'package:complaints_management/screens/home_screen.dart';

import 'package:flutter/material.dart';

import '../api/controllers/user_info_api_controller.dart';
import '../prefs/shared_pref_controller.dart';

class UserUpdateScreen extends StatefulWidget {
  static const String id = "userUpdatePage";

  const UserUpdateScreen({Key? key}) : super(key: key);

  @override
  State<UserUpdateScreen> createState() => _UserUpdateScreenState();
}

class _UserUpdateScreenState extends State<UserUpdateScreen> {
  late TextEditingController nameTextController;

  @override
  void initState() {
    nameTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F6FF),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
            child: Column(
              children: [
                TextField(
                  controller: nameTextController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Your Name'),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(5),
                          backgroundColor: const Color(0xFF003AFC),
                          shape: const StadiumBorder()),
                      onPressed: () async {
                        await update();
                      },
                      child: const Text('SAVE')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> update() async {
    bool status = await UserUpdateApiController().userUpdate(
      name: nameTextController.text,
    );
    if (status == true) {
      UserInfoApiController().userInfo(context);
      Navigator.pushReplacementNamed(context , HomePage.id);
    }
  }
}
