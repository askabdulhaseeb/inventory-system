import 'package:shared_preferences/shared_preferences.dart';

class UserLocalData {
  final int a = 0;
  static SharedPreferences _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future<bool> signout() => _preferences.clear();

  static const String _uidKey = 'UIDKEY';
  static const String _username = 'USERNAME';
  static const String _displayNameKey = 'DISPLAYNAMEKEY';
  static const String _imageURL = 'IMAGEURLKEY';
  static const String _emailKey = 'EMAILKEY';

  //
  // setter
  //
  static Future setUID(String uid) async =>
      _preferences.setString(_uidKey, uid ?? '');
  static Future setUsername(String email) async => _preferences.setString(
      _username, email.substring(0, email.indexOf('@')).trim() ?? '');
  static Future setDisplayName(String displayName) async =>
      _preferences.setString(_displayNameKey, displayName ?? '');
  static Future setImageURL(String imageURL) async =>
      _preferences.setString(_imageURL, imageURL ?? '');
  static Future setEmail(String email) async =>
      _preferences.setString(_emailKey, email ?? '');

  //
  // getter
  //
  static String getUID() => _preferences.getString(_uidKey) ?? '';
  static String getUsername() => _preferences.getString(_username) ?? '';
  static String getDisplayName() =>
      _preferences.getString(_displayNameKey) ?? '';
  static String getImageURL() => _preferences.getString(_imageURL) ?? '';
  static String getEmail() => _preferences.getString(_emailKey) ?? '';
}
