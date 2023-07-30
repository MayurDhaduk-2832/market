// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:sellproducts/modules/bottom_bar.dart/view/bottom_bar.dart';
import 'package:sellproducts/modules/business/view/business_add.dart';
import 'package:sellproducts/modules/home/view/home_page.dart';
import 'package:sellproducts/modules/language/view/language_view.dart';
import 'package:sellproducts/modules/login/view/login_view.dart';
import 'package:sellproducts/modules/product/view/product_view.dart';
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
    GetPage(
      name: _Paths.BOTTOM_VIEW,
      page: () => const BottomBarView(),
    ),
    GetPage(
      name: _Paths.PRODUCT_VIEW,
      page: () => const ProductView(),
    ),
    GetPage(
      name: _Paths.BUSINESS_ADD_VIEW,
      page: () => const BusinessAddScreen(),
    ),
    GetPage(
      name: _Paths.HOME_VIEW,
      page: () => const HomeScreen(),
    ),
  ];
}
