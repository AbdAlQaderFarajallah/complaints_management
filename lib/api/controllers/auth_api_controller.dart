import 'dart:convert';
import 'dart:io';
import 'package:complaints_management/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../helpers/helpers.dart';
import '../../prefs/shared_pref_controller.dart';
import '../api_settings.dart';

class AuthApiController with Helpers {
  Future<bool> login(BuildContext context,
      {required String email, required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response =
        await http.post(url, body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(jsonObject);
      SharedPrefController().save(user: user);
      return true;
    } else if (response.statusCode == 400) {}
    return false;
  }

  //****************************************************************************

  Future<bool> register(BuildContext context,
      {required String email,
      required String name,
      required String password}) async {
    var url = Uri.parse(ApiSettings.register);
    var response = await http.post(url, headers: {
      HttpHeaders.acceptHeader: 'application/json'
    }, body: {
      'email': email,
      'name': name,
      'password': password,
      'password_confirmation': password,
    });
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      UserModel user = UserModel.fromJson(jsonObject);
      SharedPrefController().save(user: user);
      return true;
    } else if (response.statusCode == 400) {
      showSnackBar(
        context: context,
        message: jsonDecode(response.body)['error']['email'][0],
        error: true,
      );
    }
    return false;
  }

  //****************************************************************************

  Future<bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.post(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      SharedPrefController().clear();
      return true;
    }
    return false;
  }
}
