import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class CreateCategoryApiController {
  Future<void> createCategory({required String name}) async {
    var url = Uri.parse(ApiSettings.createCategories);
    var response = await http.post(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    }, body: {
      'name': name
    });
  }
}
