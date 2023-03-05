import 'package:complaints_management/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { token, loggedIn, name, email, role }

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
        PrefKeys.token.toString(), 'Bearer ${user.token!}');
    await _sharedPreferences.setString(
        PrefKeys.name.toString(), user.user!.name!);
    await _sharedPreferences.setString(
        PrefKeys.email.toString(), user.user!.email!);
    await _sharedPreferences.setString(
        PrefKeys.role.toString(), user.user!.role!.name!);
  }

  Future<void> remove({required String key}) async {
    await _sharedPreferences.remove(key);
  }

  Future<void> saveName({required String key}) async {
    await _sharedPreferences.setString(PrefKeys.name.toString(), key);
  }

  String get token =>
      _sharedPreferences.getString(PrefKeys.token.toString()) ?? '';

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get name =>
      _sharedPreferences.getString(PrefKeys.name.toString()) ?? '';

  String get email =>
      _sharedPreferences.getString(PrefKeys.email.toString()) ?? '';

  String get role =>
      _sharedPreferences.getString(PrefKeys.role.toString()) ?? '';

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
