import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sellproducts/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    splash();
  }

  splash() async {
    final prefs = await SharedPreferences.getInstance();
    String? vLogin = prefs.getString("LOGIN");
    if (vLogin != "") {
      isLogin = true;
    }
    Timer(
      const Duration(seconds: 3),
      () {
        isLogin
            ? Navigator.pushReplacementNamed(context, Routes.SELECT_VIEW)
            : Navigator.pushReplacementNamed(context, Routes.SELECT_VIEW);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 25),
            Text(
              "Sell Products",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
