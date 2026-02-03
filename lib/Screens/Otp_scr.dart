import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsap/UIhelper/uihelp.dart';

class Otp extends StatefulWidget {
  final dynamic phonenum;

  Otp({super.key, required this.phonenum});

  @override
  State<Otp> createState() => _OtpState();
}

// String fullname = context.read<AuthProvider>().
class _OtpState extends State<Otp> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNode = List.generate(6, (_) => FocusNode());
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
            // UIhelper.customtext(
            //   text: "recently. Wait before requesting an sms or a call.",
            //   height: 15,
            // ),

            // UIhelper.customtext(text: " ", height: 15),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  const TextSpan(text: "with your code "),
                  TextSpan(
                    text: "Wrong number?",
                    style: const TextStyle(
                      color: Color(0xff00A884),
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pop(context);
                      },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 45,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: controllers[index],
                    focusNode: focusNode[index],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
