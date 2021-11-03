import 'package:flutter_interviewtestapp/Screens/splashpage.dart';
import 'package:get/get.dart';
import 'package:flutter_interviewtestapp/Screens/homepage/homescreen.dart';
import 'package:flutter_interviewtestapp/Screens/login/login.dart';
import 'package:flutter_interviewtestapp/Screens/login/mainview.dart';
import 'package:flutter_interviewtestapp/Screens/profilescreen/profilescreen.dart';
import 'package:flutter_interviewtestapp/Screens/register/register.dart';
import 'package:flutter_interviewtestapp/utils/auth_middleware.dart';



part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: '/',
      page: () => MainView(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(

            name: _Paths.SPLASH, page: ()=>SplashPage()
        ),
        GetPage(
            middlewares: [
              EnsureNotAuthedMiddleware()
            ],
            name: _Paths.LOGIN, page: ()=>LoginScreen()
        ),
        GetPage(
            name: _Paths.REGISTERSCREEN, page: ()=>RegisterScreen()
        ),
        GetPage(
            middlewares: [
              EnsureAuthMiddleware()
            ],
            name: _Paths.HOME, page: ()=>HomePageScreen(),
            children: [
              GetPage(
                  name: _Paths.DASHBOARD, page: ()=>Screen1()
              ),
              GetPage(
                  name: _Paths.SETTINGS, page: ()=>Screen2()
              ),
              GetPage(
                  name: _Paths.PROFILE, page: ()=>ProfileScreen()
              ),
            ]
        ),

      ],
    ),
  ];
}
