import 'dart:io';
import 'package:http/http.dart' as http;

import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class UserUpdateApiController {
  Future<bool> userUpdate({required String name}) async {
    var url = Uri.parse(ApiSettings.userUpdate);
    var response = await http.post(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    }, body: {
      'name': name,
      'image': ''
    });
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 401 || response.statusCode == 400) {}
    return false;
  }
}
