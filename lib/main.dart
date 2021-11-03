import 'package:flutter/material.dart';
import 'package:flutter_interviewtestapp/utils/AppLocales.dart';
import 'package:flutter_interviewtestapp/utils/CommonUtils.dart';
import 'package:flutter_interviewtestapp/utils/app_pages.dart';
import 'package:flutter_interviewtestapp/utils/auth_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/login/login.dart';
import 'constants/string_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 Future<void> intisharedvalues() async {

 }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      initialRoute: Routes.SPLSH,
      initialBinding: BindingsBuilder(
          ()async{
           await intisharedvalues();
            Get.put(AuthService());
           SharedPreferences pre= await SharedPreferences.getInstance();
           AuthService.to.setprefs(pre);
          }
      ),
      title: 'flutter_interviewtestapp',
      translations: AppLocales(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'SP'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.routes,
    );


  }
}
