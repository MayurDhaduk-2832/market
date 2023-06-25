// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:sellproducts/modules/language/view/language_view.dart';
import 'package:sellproducts/modules/login/view/login_view.dart';
import 'package:sellproducts/modules/register/view/register_view.dart';
import 'package:sellproducts/modules/select_screen/view/select_view.dart';
import 'package:sellproducts/modules/splash/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  // static const INITIAL = Routes.NOTIFICATION;
  static const INITIAL = Routes.SPLASH_VIEW;
  // static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_VIEW,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.SELECT_VIEW,
      page: () => const SelectView(),
    ),
    GetPage(
      name: _Paths.LOGIN_VIEW,
      page: () => const LoginView(),
    ),
    GetPage(
      name: _Paths.REGISTER_VIEW,
      page: () => const RegisterView(),
    ),
    GetPage(
      name: _Paths.LANGUAGE_VIEW,
      page: () => const LanguageView(),
    ),
  ];
}
