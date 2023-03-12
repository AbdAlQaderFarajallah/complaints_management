import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../models/category/mails_of_category.dart';
import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class MailsOfCategoriesApiController {
  Future<List<Mail>> mailsOfCategories({required String id}) async {
    var url = Uri.parse('${ApiSettings.allCategories}/$id/mails');
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      MailsOfCategory allMails = MailsOfCategory.fromJson(jsonObject);
      List<Mail> mails = [];
        for (var sender in allMails.category.senders) {
         mails.addAll(sender.mails);
        }
      return mails;
    } else {}
    return [];
  }
}
