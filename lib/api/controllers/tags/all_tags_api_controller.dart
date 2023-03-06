import 'dart:convert';
import 'dart:io';
import 'package:complaints_management/models/all_tags.dart';
import 'package:http/http.dart' as http;
import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class AllTagsApiController {
  Future<List<Tags>> allTags() async {
    var url = Uri.parse(ApiSettings.allTags);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      AllTags allTags = AllTags.fromJson(jsonObject);
      return allTags.tags!.toList();
    } else {}
    return [];
  }
}
