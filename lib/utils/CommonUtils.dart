

import 'auth_service.dart';

class CommonUtils{




}

extension  StringProcess on String{

bool isHavingValue(){
  bool result=false;
  if(this.isNotEmpty&&this!="null")
    {
      result =true;
    }
  return result;
}
bool isValidemail() {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);
}

void savedata( dynamic valuetype) {

  if (valuetype is int) {
    AuthService.to.sharedpref.setInt(this, valuetype);
  } else if (valuetype is String) {
    AuthService.to.sharedpref.setString(this, valuetype);
  } else if (valuetype is bool) {
    AuthService.to.sharedpref.setBool(this, valuetype);
  } else if (valuetype is double) {
    AuthService.to.sharedpref.setDouble(this, valuetype);
  }
}

dynamic loaddata( Object valuetype,{dynamic defaultvalue}) {
  try {
    if (valuetype == 1) {
      return AuthService.to.sharedpref.getString(this) ?? defaultvalue??"";
    } else if (valuetype == 2) {
      return AuthService.to.sharedpref.getInt(this) ?? defaultvalue??0;
    } else if (valuetype == 3) {
      return AuthService.to.sharedpref.getBool(this) ?? defaultvalue??false;
    } else if (valuetype == 4) {
      return AuthService.to.sharedpref.getDouble(this) ?? defaultvalue??0.0;
    }
    // return retunvalue;
  } catch (e) {
    print(e);

  }
}
}