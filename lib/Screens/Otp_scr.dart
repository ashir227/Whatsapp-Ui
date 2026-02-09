import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsap/UIhelper/uihelp.dart';
import 'package:whatsap/login/Profileinfo.dart';

class Otp extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  const Otp({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  final List<FocusNode> focusNodes = List.generate(
    6,
    (_) => FocusNode(),
  ); // 🔹 Added focus nodes

  String getOtp() => controllers.map((c) => c.text).join();

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose(); // 🔹 Dispose focus nodes
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 45),
            UIhelper.customtext(
              text: "You’ve tried to register ${widget.phoneNumber}",
              height: 15,
            ),
            UIhelper.customtext(
              text: "recently. Wait before requesting an sms or a call",
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UIhelper.customtext(text: "with your code.", height: 15),
                UIhelper.customsbutton(
                  buttonName: "Wrong number?",
                  callback: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 45,
                  child: TextField(
                    controller: controllers[index],
                    focusNode: focusNodes[index], // 🔹 Set focus node
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: const InputDecoration(counterText: ""),
                    onChanged: (value) {
                      if (value.length == 1 && index < 5) {
                        // 🔹 Move to next box automatically
                        focusNodes[index + 1].requestFocus();
                      } else if (value.isEmpty && index > 0) {
                        // 🔹 Backspace moves to previous
                        focusNodes[index - 1].requestFocus();
                      }

                      setState(() {}); // 🔹 Update Next button enabled
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: getOtp().length == 6
                    ? _verifyOtp
                    : null, // 🔹 Enable only if 6 digits
                style: ElevatedButton.styleFrom(
                  backgroundColor: getOtp().length == 6
                      ? const Color(0xff00A884)
                      : Colors.grey, // 🔹 Change color dynamically
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _verifyOtp() async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: getOtp(),
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Profile_info()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Invalid OTP")));
    }
  }
}
