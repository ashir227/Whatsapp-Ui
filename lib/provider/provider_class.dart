import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  String selectedcountry = "Pakistan";
  String Selectedcode = "+92"; // capital S is okay if used consistently
  String phonenum = "";
  List<String> countries = ["Pakistan", "India", "Turkey", "Japan"];

  void changecountry(String country) {
    selectedcountry = country;
    if (country == "Pakistan")
      Selectedcode = "+92";
    else if (country == "India")
      Selectedcode = "+91";
    else if (country == "Turkey")
      Selectedcode = "+90";
    else if (country == "Japan")
      Selectedcode = "+80";

    notifyListeners(); // 🔑 must be called after any change
  }

  void setnum(String value) {
    phonenum = value;
    notifyListeners();
  }

  // ✅ 13 digit friendly logic
  bool get isvalid {
    // number part only, without country code
    return phonenum.length >= 7 && phonenum.length <= 11;
  }

  void imagepick() {}
}
