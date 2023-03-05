import 'dart:convert';
import 'dart:io';
import 'package:complaints_management/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../prefs/shared_pref_controller.dart';
import '../api_settings.dart';

class UserInfoApiController {
  Future<bool> userInfo(BuildContext context) async {
    var url = Uri.parse(ApiSettings.userInfo);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(jsonObject);
      SharedPrefController().remove(key: 'name');
      SharedPrefController().saveName(key: user.user!.name!);
      return true;
    } else if (response.statusCode == 400) {}
    return false;
  }
}
