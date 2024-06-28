

import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref{
  static late final SharedPreferences _myPref;

  static void init() async {
    _myPref = await SharedPreferences.getInstance();
  }

  static void setUser(String username) {
    _myPref.setString("user", username);
  }

  static String getUserName(){
    return _myPref.getString("user")??'';
  }

  static void registerUser(){
    _myPref.setBool("register", true);
  }

  static void unRegisterUser(){
    _myPref.setBool("register", false);
  }

  static bool? isRegistered(){
    return _myPref.getBool("register");
  }
}