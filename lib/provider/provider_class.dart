import 'package:flutter/material.dart';

class authprovider extends ChangeNotifier {
  String selectedcountry = "Pakistan";
  String Selectedcode = "+92";
  void changecountry(String country) {
    selectedcountry = country;
    if (country == "Pakistan") {
      Selectedcode = "+92";
    } else if (country == "India") {
      Selectedcode = "+91";
    } else if (country == "turkey") {
      Selectedcode = "+90";
    } else if (country == "Japan") {
      Selectedcode = "80";
    }
    notifyListeners();
  }
}
