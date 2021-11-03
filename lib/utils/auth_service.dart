import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  SharedPreferences get sharedpref =>appprefs!;
  static AuthService get to => Get.find();
  //static UserPreferences get userprefclass => Get.find();

  /// Mocks a login process
  SharedPreferences? appprefs;
  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;

  void setloginstatus(bool status) {
    isLoggedIn.value = status;
  }

  void setprefs(SharedPreferences sharepref)
  {
    appprefs=sharepref;
  }
  void logout() {
    isLoggedIn.value = false;

  }

}
