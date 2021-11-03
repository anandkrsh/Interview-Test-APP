import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interviewtestapp/constants/string_constants.dart';
import 'package:flutter_interviewtestapp/utils/CommonUtils.dart';
import 'package:flutter_interviewtestapp/utils/app_pages.dart';
import 'package:flutter_interviewtestapp/utils/auth_service.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  AnimationController? controler;
Animation<double>? splashanimation;

  @override
  void initState() {
    Get.put(  SharedPreferences.getInstance());

    controler = AnimationController(vsync: this,duration: Duration(seconds: 3));
    splashanimation=Tween<double>(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controler!, curve: Curves.linear));

    super.initState();

    controler!.forward();
    controler!.addStatusListener((status) {
      if(status==AnimationStatus.completed)
        {
          print("  Login test ${"${StringConstants.PREF_EMAIL.loaddata(1)}".isHavingValue()}");
          bool logintype="${StringConstants.PREF_EMAIL.loaddata(1)}".isHavingValue();
          AuthService.to.setloginstatus(logintype);
          if(logintype)
          {
            Get.offNamed(Routes.HOME);
          }else{
            Get.offNamed(Routes.LOGIN);
          }
        }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controler!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: AnimatedBuilder(
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(scale:splashanimation!.value,
              child: SvgPicture.asset("assets/images/splach.svg"),);
          },
          animation: controler!,),

      ),
    );
  }
}
