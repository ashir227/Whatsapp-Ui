import 'package:flutter/material.dart';
import 'package:whatsap/UIhelper/uihelp.dart';

class Chatscr extends StatelessWidget {
  const Chatscr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(tabs: [Tab(icon: Icon(Icons.camera_alt))]),
        toolbarHeight: 130,
        title: UIhelper.customtext(
          text: "Whatsapp",
          height: 20,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff008069),
      ),
    );
  }
}
