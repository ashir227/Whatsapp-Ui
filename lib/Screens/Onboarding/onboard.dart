import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsap/UIhelper/uihelp.dart';
import 'package:whatsap/login/loginscr.dart';
import 'package:whatsap/provider/provider_class.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  TextEditingController phonenum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/image 1.png"),
            SizedBox(height: 20),
            UIhelper.customtext(
              text: "Welcome to WhatsApp",
              height: 24,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIhelper.customtext(
                  text: "Read out",
                  height: 14,
                  color: Color(0xff5E5E5E),
                ),
                UIhelper.customsbutton(
                  buttonName: "Privacy Policy",
                  callback: () {},
                ),
                UIhelper.customtext(
                  text: "Tap ''Agree and continue''",
                  height: 14,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIhelper.customtext(text: "to accept the", height: 14),
                UIhelper.customsbutton(
                  buttonName: "Teams of Service",
                  callback: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: UIhelper.customButton(
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => loginscr()),
          );
        },
        buttonName: "Agree and continue",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
