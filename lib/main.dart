import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsap/Screens/SplashScr.dart';
import 'package:whatsap/provider/provider_class.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Authprovider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
