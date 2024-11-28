import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static const String LoggedIn = 'isLoggedIn';
  static const String authToken = 'authToken';

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(authToken, token);

    // print('Token saved: $token');
  }

  Future<String?> retrieveToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(authToken);
  }

  Future<void> setLoggedIn(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(LoggedIn, isLoggedIn);
  }

  Future<bool> getIsLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(LoggedIn) ?? false;
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(LoggedIn);
    await prefs.remove(authToken);
  }
}
