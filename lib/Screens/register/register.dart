import 'package:flutter/material.dart';
import 'package:flutter_interviewtestapp/Screens/homepage/homescreen.dart';
import 'package:flutter_interviewtestapp/Screens/login/login.dart';
import 'package:flutter_interviewtestapp/components/background.dart';
import 'package:flutter_interviewtestapp/constants/string_constants.dart';
import 'package:flutter_interviewtestapp/utils/CommonUtils.dart';
import 'package:flutter_interviewtestapp/utils/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email="";
  String username="";
  String password="";
  String mobilenumber="";
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
                "welcom".tr,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4081),
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
                onChanged: (text) {
                  email = text;
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
                onChanged: (text) {
                  mobilenumber = text;
                },
                decoration: InputDecoration(
                  labelText: "mobile".tr
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10 , right: 50),
              child: TextField(
                onChanged: (text) {
                  username = text;
                },
                decoration: InputDecoration(
                  labelText: "username".tr
                ),
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 10 , right: 50),
              child: TextField(
                onChanged: (text) {
                  password = text;
                },
                decoration: InputDecoration(
                  labelText: "password".tr
                ),
                obscureText: true,
              ),
            ),

            SizedBox(height: size.height * 0.05),

            GestureDetector(
              onTap: (){
if(!email.isHavingValue()||!email.isValidemail())
{
  Get.snackbar("Login", "in valid email address");
return;
  }
if(!password.isHavingValue())
{
  Get.snackbar("Login", "in valid password");
return;
  }
StringConstants.PREF_EMAIL.savedata(email);
StringConstants.PREF_USERNAME.savedata(username);
StringConstants.PREF_MOBILENUMBER.savedata(mobilenumber);

Get.offAllNamed(Routes.HOME);
              },
              child: Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
                    "signup".tr,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()))
                },
                child: Text(
                  "already".tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent
                  ),
                ),
              ),
            )
          ],
        ),
        type: 1,
      ),
    );
  }
}