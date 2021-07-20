import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class AuthController {
  User? _user;

  dynamic get user => _user!;

  void setUser(BuildContext context, User? user) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, '/home', arguments: user);

      // Navigator.pushReplacement(
      // context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.pushReplacementNamed(context, '/login');

      // Navigator.pushReplacement(
      // context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  Future<void> saveUser(User user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString('user', user.toJson());
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 3));

    if (instance.containsKey('user')) {
      final json = await instance.get('user') as String;

      setUser(context, User.fromJson(json));
    } else {
      setUser(context, null);
    }
  }
}
