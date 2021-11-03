import 'package:flutter/material.dart';
import 'package:flutter_interviewtestapp/Screens/forgetpassword.dart';
import 'package:flutter_interviewtestapp/Screens/homepage/homescreen.dart';
import 'package:flutter_interviewtestapp/Screens/register/register.dart';
import 'package:flutter_interviewtestapp/components/background.dart';
import 'package:flutter_interviewtestapp/constants/string_constants.dart';
import 'package:flutter_interviewtestapp/utils/CommonUtils.dart';
import 'package:flutter_interviewtestapp/utils/app_pages.dart';
import 'package:flutter_interviewtestapp/utils/auth_service.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String Email = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10 , right: 50),
              child: Text(
                "welcomback".tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                  fontSize: 30
                ),
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10 , right: 50),
              child: TextField(
                onChanged: (value){
                  setState(() {
                    Email = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: "email".tr
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10 , right: 50),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "password".tr
                ),
                obscureText: true,
              ),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()))
              },
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Text(
                  "forgotpassword".tr,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFFF4081)
                  ),
                ),
              ),
            ),

            SizedBox(height: size.height * 0.05),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: (){
                  print("the value of email is : $Email");
                  StringConstants.PREF_EMAIL.savedata( Email);
                  AuthService.to.setloginstatus(true);
                  Get.offNamedUntil(Routes.HOME,(route) => false);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageScreen()));

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(80.0),
                    gradient: new LinearGradient(
                      colors: [
                        Color(0xFFFF4081),
                        Color(0xFFF48FB1)
                      ]
                    )
                  ),
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    "login".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: GestureDetector(
                onTap: () => {
Get.toNamed(Routes.REGISTERSCREEN)
                },
                child: Text(
                  "donthave".tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF4081)
                  ),
                ),
              ),
            )
          ],
        ),
        type:  2,
      ),
    );
  }
}