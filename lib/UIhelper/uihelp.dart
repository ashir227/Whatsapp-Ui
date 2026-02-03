import 'dart:async';

import 'package:flutter/material.dart';

class UIhelper {
  // Make it a static method if you want to call it without creating UIhelper instance
  static Widget customButton({
    required VoidCallback callback,
    required String buttonName,
    Color? color, // Optional color
  }) {
    return SizedBox(
      height: 45,
      width: 330,
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        // Just pass the callback here
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(40),
          ),

          backgroundColor: color ?? Color(0xff00A884),
        ),
        child: Text(buttonName, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  static customtext({
    required String text,
    required double height,
    Color? color,
    FontWeight? fontweight,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: height,
        color: color ?? Color(0xFF5E5E5E),
        fontWeight: fontweight,
      ),
    );
  }

  static customsbutton({
    required String buttonName,
    required VoidCallback callback,

    Color? color,
    FontWeight? fontweight,
  }) {
    return TextButton(
      onPressed: callback,
      child: Text(
        buttonName,
        style: TextStyle(color: color ?? Color(0xff0C42CC)),
      ),
    );
  }
}
