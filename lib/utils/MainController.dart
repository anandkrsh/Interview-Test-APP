import 'dart:ui';

import 'package:get/get.dart';

class MainController extends GetxController{
  String username="";
  String passWord="";
  var tabIndex = 0.obs;
  var position = Offset(0.0,  100).obs;
  void updateposition(Offset values){
    position.value=values;
  }
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

}