import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class CreateMailApiController {
  Future<void> createMali(
      {required String subject,
      required String senderId,
      required String archiveNumber,
      required String description,
      required String decision,
      required String archiveDate,
      required String statusId}) async {
    var url = Uri.parse(ApiSettings.createMail);
    await http.post(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    }, body: {
      'subject': subject,
      'description' : description,
      'sender_id': senderId,
      'archive_number': archiveNumber,
      'archive_date': archiveDate,
      'decision': decision,
      'status_id': statusId,
      'final_decision': '',
      'tags': jsonEncode([1]),
      'activities': jsonEncode([
        {"body": "any text", "user_id": 260}
      ]),
    });
  }
}
