import 'package:nb_utils/nb_utils.dart';

import '../utils/constants.dart';


class SessionManager {
  //set login to true or false
  Future<void> setIsLogin(bool isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(PREFS_ISLOGIN, isLogin);
  }
  //fcm token
  Future<bool> getIsLogin() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(PREFS_ISLOGIN) ?? false;
  }
  //set jwt token
  Future<void> setJwtToken(String jwtToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PREFS_JWTTOKEN, jwtToken);
    print(await getJwtToken());
  }

  //get jwt token
  Future<String?> getJwtToken() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(PREFS_JWTTOKEN) ?? null;
  }


//set data into shared preferences like this
  Future<void> saveUserInfo(Map<String,dynamic> response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

  }


}
