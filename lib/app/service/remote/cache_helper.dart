import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachHelper{
 static final box = GetStorage();
  static init() async{
    await SharedPreferences.getInstance();
  }

 static void changeTheme({@required value}) => box.write('darkmode', value);
 static bool RedeTheme() => box.read('darkmode');

}