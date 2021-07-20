import 'package:flutter/material.dart';

import '../../shared/themes/themes.dart';
import '../../widgets/social_login_button.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              width: screenSize.width,
              height: screenSize.height * 0.31,
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.person,
                width: 208,
                height: 333,
              ),
            ),
            Positioned(
              top: 400,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.logomini),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: Text(
                      'Organize seus boletos em um só lugar',
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: SocialLoginButton(
                      onTap: () => controller.googleSignIn(context),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
