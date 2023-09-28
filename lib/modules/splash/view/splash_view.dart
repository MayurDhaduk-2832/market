import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/routes/app_pages.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    splash();
  }

  splash() async {
    bool? isLogin = PrefService.getBool("isLogin");
    Timer(
      const Duration(seconds: 3),
      () {
        isLogin
            ? Get.offAndToNamed(Routes.BOTTOM_VIEW)
            : Get.offAndToNamed(Routes.SELECT_VIEW);
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
