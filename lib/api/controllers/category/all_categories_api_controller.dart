import 'dart:convert';
import 'dart:io';
import 'package:complaints_management/models/category/all_categories.dart';
import 'package:http/http.dart' as http;
import '../../../prefs/shared_pref_controller.dart';
import '../../api_settings.dart';

class AllCategoriesApiController {
  Future<List<Categories>> allCategories() async {
    var url = Uri.parse(ApiSettings.allCategories);
    var response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: SharedPrefController().token,
      HttpHeaders.acceptHeader: 'application/json'
    });

    if (response.statusCode == 200) {
      var jsonObject = jsonDecode(response.body);
      AllCategories allCat = AllCategories.fromJson(jsonObject);
      return allCat.categories.toList();
    } else {}
    return [];
  }
}
