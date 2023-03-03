import 'package:complaints_management/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { token, loggedIn }

class SharedPrefController {
  static final SharedPrefController _instance = SharedPrefController._();

  SharedPrefController._();

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance;
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required UserModel user}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(
        PrefKeys.token.toString(), 'Bearer ${user.token}');
  }

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
