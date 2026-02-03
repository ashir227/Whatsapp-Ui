import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  String selectedcountry = "Pakistan";
  String Selectedcode = "+92";
  String phonenum = "";
  List<String> countries = ["Pakistan", "India", "turkey", "Japan"];
  void changecountry(String country) {
    selectedcountry = country;
    if (country == "Pakistan") {
      Selectedcode = "+92";
    } else if (country == "India") {
      Selectedcode = "+91";
    } else if (country == "turkey") {
      Selectedcode = "+90";
    } else if (country == "Japan") {
      Selectedcode = "+80";
    }
    notifyListeners();
  }

  void setnum(String value) {
    phonenum = value;
    notifyListeners();
  }

  bool get isvalid => phonenum.length == 11;
}

class otp extends ChangeNotifier {}
