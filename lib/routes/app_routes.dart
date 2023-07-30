// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH_VIEW = _Paths.SPLASH_VIEW;
  static const LOGIN_VIEW = _Paths.LOGIN_VIEW;
  static const SELECT_VIEW = _Paths.SELECT_VIEW;
  static const REGISTER_VIEW = _Paths.REGISTER_VIEW;
  static const LANGUAGE_VIEW = _Paths.LANGUAGE_VIEW;
  static const BOTTOM_VIEW = _Paths.BOTTOM_VIEW;
  static const PRODUCT_VIEW = _Paths.PRODUCT_VIEW;
  static const BUSINESS_ADD_VIEW = _Paths.BUSINESS_ADD_VIEW;
  static const HOME_VIEW = _Paths.HOME_VIEW;
}

abstract class _Paths {
  static const SPLASH_VIEW = '/splashview';
  static const LOGIN_VIEW = '/loginview';
  static const SELECT_VIEW = '/selectview';
  static const REGISTER_VIEW = '/registerview';
  static const LANGUAGE_VIEW = '/languageview';
  static const BOTTOM_VIEW = '/bottomview';
  static const PRODUCT_VIEW = '/productview';
  static const BUSINESS_ADD_VIEW = '/businessaddview';
  static const HOME_VIEW = '/homeview';
}
