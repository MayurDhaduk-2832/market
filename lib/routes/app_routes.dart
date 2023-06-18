// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH_VIEW = _Paths.SPLASH_VIEW;
  static const LOGIN_VIEW = _Paths.LOGIN_VIEW;
  static const SELECT_VIEW = _Paths.SELECT_VIEW;
  static const REGISTER_VIEW = _Paths.REGISTER_VIEW;
}

abstract class _Paths {
  static const SPLASH_VIEW = '/splashview';
  static const LOGIN_VIEW = '/loginview';
  static const SELECT_VIEW = '/selectview';
  static const REGISTER_VIEW = '/registerview';
}
