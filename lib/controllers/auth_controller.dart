import 'package:flutter/cupertino.dart';

class AuthController extends ChangeNotifier{
  String?  name;
  String? mobileOremail;
  String? type;

   changeName(String newname){
    name=newname;
    notifyListeners();

  }
  currentMobileorEmail(String val){
    mobileOremail=val;
    notifyListeners();
  }
  currentType(String ty){
    type=ty;
    notifyListeners();
  }

  }



