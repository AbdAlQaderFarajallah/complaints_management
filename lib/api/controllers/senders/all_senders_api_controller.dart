import 'dart:convert';
import 'dart:io';
import 'package:complaints_management/models/all_senders.dart';
import 'package:http/http.dart' as http;
import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class AllSendersApiController {
  Future<List<Senders>> allSenders() async {
    var url = Uri.parse('${ApiSettings.allSenders}?mail=true');
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });
    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      AllSenders allSenders = AllSenders.fromJson(jsonObject);
      return allSenders.senders!;
    } else {}
    return [];
  }
}
