import 'package:flutter/material.dart';
import 'package:whatsap/Screens/SplashScr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Color(0xff00A884)),
        useMaterial3: false,
        fontFamily: "Regular",
      ),
      home: SplashScreen(),
    );
  }
}
