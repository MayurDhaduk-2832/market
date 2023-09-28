import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/api/login_api.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/login/model/login_view_model.dart';

class LoginScreenController extends GetxController {
  RxInt iSelect = 0.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginModel loginModel = LoginModel();

  login() async {
    Map<String, dynamic> body = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    loginModel = await LoginApi.loginApi(body);

    PrefService.setValue(LocaleKeys.SPIsLogin, true);
    PrefService.setValue(LocaleKeys.SPUserName, loginModel.username ?? "");
    PrefService.setValue(LocaleKeys.SPUserId, loginModel.id ?? "");
    PrefService.setValue(LocaleKeys.SPUserRole, loginModel.role ?? "");
  }
}
