import 'dart:convert';
import 'package:e_commerce/data/model/authentication_response/authentication_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefsUtils {

  String userKey = "user";
  String userTokenKey = "token";

  void setUser(User user) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userKey, jsonEncode(user.toJson()));
  }

  Future<User?> getUser() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userAsString = prefs.getString(userKey);
    if (userAsString == null) return null;

    return User.fromJson(jsonDecode(userAsString));
  }

  void setToken(String token) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userTokenKey, token);
  }

  Future<String?> getToken() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userTokenKey);
  }
}