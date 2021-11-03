part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();

  static const HOME = _Paths.HOME;
  static const SPLSH = _Paths.SPLASH;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const REGISTERSCREEN = _Paths.REGISTERSCREEN;

  static const SETTINGS = _Paths.SETTINGS;

  static const LOGIN = _Paths.LOGIN;
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}

abstract class _Paths {
  static const MAINVIEW = '/MainView';
  static const HOME = '/HomePageScreen';
  static const PROFILE = '/ProfileScreen';
  static const SETTINGS = '/Screen2';
  static const LOGIN = '/LoginScreen';
  static const SPLASH = '/SplashPage';
  static const REGISTERSCREEN = '/RegisterScreen';
  static const DASHBOARD = '/Screen1';
}
