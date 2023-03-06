import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class CreateTagApiController {
  Future<void> createTag({required String name}) async {
    var url = Uri.parse(ApiSettings.allTags);
    await http.post(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    }, body: {
      'name': name
    });
  }
}
