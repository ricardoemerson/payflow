import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/modules/models/user.dart';

import 'modules/barcode_scanner/barcode_scanner_page.dart';
import 'modules/home/home_page.dart';
import 'modules/insert_boleto/insert_boleto_page.dart';
import 'modules/login/login_page.dart';
import 'modules/splash/splash_page.dart';
import 'shared/themes/themes.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark
          .copyWith(statusBarIconBrightness: Brightness.light),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.orange,
      ),
      home: SplashPage(),
      // initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(
              user: ModalRoute.of(context)!.settings.arguments as User,
            ),
        '/barcode_scanner': (context) => BarcodeScannerPage(),
        '/insert_boleto': (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null
                  ? ModalRoute.of(context)!.settings.arguments as String
                  : null,
            ),
      },
    );
  }
}
