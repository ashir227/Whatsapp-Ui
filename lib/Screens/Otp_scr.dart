import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsap/UIhelper/uihelp.dart';

class Otp extends StatefulWidget {
  final dynamic phonenum;

  const Otp({super.key, required this.phonenum});

  @override
  State<Otp> createState() => _OtpState();
}

// String fullname = context.read<AuthProvider>().
class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 45),
            UIhelper.customtext(
              text: "Verifying your number",
              height: 20,
              color: Color(0xff00A884),
              fontweight: FontWeight.w700,
            ),
            SizedBox(height: 20),
            UIhelper.customtext(
              text: "You’ve tried to register ${widget.phonenum} ",

              height: 15,
            ),
            UIhelper.customtext(
              text: "recently. Wait before requesting an sms or a call.",
              height: 15,
            ),
            UIhelper.customtext(text: " with your code", height: 15),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Wrong number?"),
            ),
          ],
        ),
      ),
    );
  }
}
