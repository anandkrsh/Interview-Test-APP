import 'package:flutter/material.dart';
import 'package:flutter_interviewtestapp/constants/string_constants.dart';
import 'package:flutter_interviewtestapp/utils/CommonUtils.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ListView(
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 100,
          child: Image.asset("assets/images/avatar.png" , color: Colors.pinkAccent,),

        ),
        SizedBox(height: size.height* 0.05,),
        Row(
          children: [

             Container(
                 padding: EdgeInsets.only(left: 10),

                 width: size.width* 0.40,
                 child: Text("name".tr , textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold))), Container(
               width: size.width* 0.05,
                 child: Text(":" , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))), Container(
               width: size.width* 0.40,
                 child: Text("${StringConstants.PREF_USERNAME.loaddata(1)}" , textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold))),

          ],
        ),
        SizedBox(height: size.height* 0.05,),

        Row(
          children: [

             Container(
               padding: EdgeInsets.only(left: 10),
               width: size.width* 0.40,
                 child: Text("mobile".tr , textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold),)), Container(
               width: size.width* 0.05,
                 child: Text(":" , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))), Container(
               width: size.width* 0.40,
                 child: Text("${StringConstants.PREF_MOBILENUMBER.loaddata(1)}" , textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold))),

          ],
        ),
        SizedBox(height: size.height* 0.05,),

        Row(
          children: [

             Container(
                 padding: EdgeInsets.only(left: 10),

                 width: size.width* 0.40,
                 child: Text("email".tr , textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold))), Container(
               width: size.width* 0.05,
                 child: Text(":" , textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))), Container(
               width: size.width* 0.40,
                 child: Text("${StringConstants.PREF_EMAIL.loaddata( 1)}" , textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.bold))),

          ],
        ),

      ],
    );
  }
}
