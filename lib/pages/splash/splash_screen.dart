import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v1/pages/login/login_view.dart';
import '../../app_provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash_screen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    Timer(
      const Duration(seconds: 3),
          () {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      },
    );
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        appProvider.splashBackground(),
        width: mediaQuery.width,
        height: mediaQuery.height,
        fit: BoxFit.cover,
      ),
    );
  }
}
