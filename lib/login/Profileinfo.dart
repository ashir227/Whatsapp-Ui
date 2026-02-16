import 'package:flutter/material.dart';
import 'package:whatsap/UIhelper/uihelp.dart';

class Profile_info extends StatefulWidget {
  const Profile_info({super.key});

  @override
  State<Profile_info> createState() => _Profile_infoState();
}

class _Profile_infoState extends State<Profile_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            UIhelper.customtext(
              text: "Profile info",
              height: 20,
              color: Color(0xff00A884),
              fontweight: FontWeight.w700,
            ),
            SizedBox(height: 70),
            UIhelper.customtext(
              text: "Please provide your name and an optional",
              height: 20,
            ),
            UIhelper.customtext(text: "profile photo", height: 20),
          ],
        ),
      ),
    );
  }
}
