import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../models/all_statuses.dart';
import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class AllTagsApiController {
  Future<List<Statuses>> allTags() async {
    var url = Uri.parse(ApiSettings.allStatuses);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      AllStatuses allStatuses = AllStatuses.fromJson(jsonObject);
      return allStatuses.statuses!.toList();
    } else {}
    return [];
  }
}
