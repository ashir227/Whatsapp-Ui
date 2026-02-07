import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsap/UIhelper/uihelp.dart';

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

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  String getOtp() {
    return controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 45),
            UIhelper.customtext(
              text: "Verifying your number",
              height: 20,
              color: Color(0xff00A884),
              fontweight: FontWeight.w700,
            ),
            const SizedBox(height: 20),
            UIhelper.customtext(
              text: "Waiting to automatically detect an SMS sent to",
              height: 15,
            ),
            UIhelper.customtext(
              text: widget.phoneNumber, // ✅ correct
              height: 15,
            ),

            const SizedBox(height: 20),

            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 15),
                children: [
                  const TextSpan(text: "Enter the 6-digit code. "),
                  TextSpan(
                    text: "Wrong number?",
                    style: const TextStyle(
                      color: Color(0xff00A884),
                      fontWeight: FontWeight.w600,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: 45,
                  child: TextField(
                    controller: controllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    decoration: const InputDecoration(counterText: ""),
                  ),
                );
              }),
            ),

            const SizedBox(height: 80),

            ElevatedButton(
              onPressed: () async {
                String otp = getOtp();

                if (otp.length != 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Enter valid 6 digit OTP")),
                  );
                  return;
                }

                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: otp,
                  );

                  await FirebaseAuth.instance.signInWithCredential(credential);

                  // ✅ SUCCESS
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("OTP Verified Successfully")),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Invalid OTP")));
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff00A884),
              ),
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
