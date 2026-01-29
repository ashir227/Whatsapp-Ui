import 'package:flutter/material.dart';
import 'package:whatsap/UIhelper/uihelp.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 45),
            UIhelper.customtext(
              text: "Verifying your number",
              height: 20,
              color: Color(0xff00A884),
              fontweight: FontWeight.w700,
            ),
            SizedBox(height: 20),
            // UIhelper.customtext(text: "You’ve tried to register ${phonenum}", height: height)
          ],
        ),
      ),
    );
  }
}
