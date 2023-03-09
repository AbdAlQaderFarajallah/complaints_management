import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../models/search.dart';
import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class SearchApiController {
  Future<List<Mails>> search(
      {String? text, String? start, String? end, String? statusId}) async {
    var url = Uri.parse(ApiSettings.search).replace(queryParameters: {
      'text': text ?? '',
      'start': start ?? '',
      'end': end ?? '',
      'status_id': statusId ?? ''
    });
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      Search search = Search.fromJson(jsonObject);
      return search.mails!.toList();
    } else if (response.statusCode == 400) {}
    return [];
  }
}
