import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../auth/auth_controller.dart';
import '../models/user.dart';

class LoginController {
  final authControler = AuthController();

  Future<void> googleSignIn(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await _googleSignIn.signIn();
      final user =
          User(name: response!.displayName!, photoUrl: response.photoUrl);
      authControler.setUser(context, user);
    } catch (error) {
      authControler.setUser(context, null);
      print(error);
    }
  }
}
