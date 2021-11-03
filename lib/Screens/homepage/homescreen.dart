import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interviewtestapp/Screens/profilescreen/profilescreen.dart';
import 'package:flutter_interviewtestapp/constants/string_constants.dart';
import 'package:flutter_interviewtestapp/main.dart';
import 'package:flutter_interviewtestapp/utils/CommonUtils.dart';
import 'package:flutter_interviewtestapp/utils/MainController.dart';
import 'package:flutter_interviewtestapp/utils/app_pages.dart';
import 'package:flutter_interviewtestapp/utils/auth_service.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../animatedroundbutton.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => new _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _pageIndex = 0;
  PageController? _pageController;
  late Offset position ;


  List<Widget> tabPages = [
    Screen1(),
    Screen2(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    position = Offset(0.0,  100);

    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("hello".tr, style: TextStyle(color: Colors
            .white)),
        backgroundColor: Colors.pinkAccent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.pinkAccent,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home".tr),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), label: "message".tr),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "profile".tr),
        ],

      ),
      body:  Stack(
    children: [
      PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
        GetBuilder<MainController>(
          init: MainController(),
          builder: (maincontroll){
    return
    Positioned(
    right: -50,
    top: maincontroll.position.value.dy,
    child: Draggable(
    axis: Axis.vertical,
    feedback: AnimatedRoundExpandableButton(
    calbackevent: (int index){
    }
    ),
    child: AnimatedRoundExpandableButton(
    calbackevent: (int index){

    if(index == 1){
Get.updateLocale(Locale("en","US"));
    }
    if(index == 2){
    AuthService.to.logout();

    StringConstants.PREF_EMAIL.savedata("");
    StringConstants.PREF_USERNAME.savedata("");
    StringConstants.PREF_EMAIL.savedata("");
    Get.offNamedUntil(Routes.LOGIN, (route) => false);
    }

    if(index == 3){
      Get.updateLocale(Locale("de","SP"));

    }

    }

    ),
    onDraggableCanceled: (Velocity velocity, Offset offset){
    setState(() {
    var position = offset;
    maincontroll.updateposition(position - offset/2.5);
    }
    );
    },
    ));
    }
    )

    ],
  )

      );

  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
     this._pageController!.animateToPage(
        index, duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut);
  }
}


class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(child: SvgPicture.asset("assets/images/splach.svg"),),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child:Container(
                child:Row(

                  children: [
                    Image.asset("assets/images/avatar.png" , color: Colors.pinkAccent,width: 100,height: 100,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Message One" ,style: TextStyle(fontSize:15,color: Colors.black,fontWeight: FontWeight.bold ),),
                          Text("First Message Happy dewali" ,style: TextStyle(fontSize:12,color: Colors.black,fontWeight: FontWeight.normal ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(child: Text("Screen 3")),
    );
  }
}