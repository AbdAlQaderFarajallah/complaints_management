import 'dart:convert';
import 'dart:io';

import 'package:complaints_management/models/user_update.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../prefs/shared_pref_controller.dart';
import '../api_settings.dart';

class UserUpdateApiController {
  Future<bool> userUpdate(BuildContext context, {required String name}) async {
    var url = Uri.parse(ApiSettings.userUpdate);
    var response = await http.post(url, body: {
      'name': name
    }, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      UserUpdate user = UserUpdate.fromJson(jsonObject);
      return true;
    } else if (response.statusCode == 401 || response.statusCode == 400) {}
    return false;
  }
}
