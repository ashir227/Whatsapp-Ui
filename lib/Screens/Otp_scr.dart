import 'package:firebase_auth/firebase_auth.dart';
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

  final List<FocusNode> focusNodes = List.generate(
    6,
    (_) => FocusNode(),
  ); // 🔹 Focus nodes for auto-move

  String getOtp() => controllers.map((c) => c.text).join();

  @override
  void dispose() {
    for (var c in controllers) c.dispose();
    for (var f in focusNodes) f.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 45),
            // 🔹 WhatsApp style multi-line text above OTP boxes
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIhelper.customtext(
                    text:
                        "You’ve tried to register ${widget.phoneNumber}", // 🔹 Dynamic phone number
                    height: 18,
                  ),
                  const SizedBox(height: 5),
                  UIhelper.customtext(
                    text: "Recently. Wait before requesting an SMS or a call.",
                    height: 15,
                  ),
                  const SizedBox(height: 5),
                  UIhelper.customtext(
                    text: "with your code. Wrong number?",
                    height: 15,
                    color: Colors.blue, // 🔹 Wrong number link style
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // 🔹 OTP boxes row
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
                        focusNodes[index + 1]
                            .requestFocus(); // 🔹 Auto move next
                      } else if (value.isEmpty && index > 0) {
                        focusNodes[index - 1]
                            .requestFocus(); // 🔹 Backspace previous
                      }
                      setState(() {}); // 🔹 Update Next button enabled
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 40),
            // 🔹 Next button
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: getOtp().length == 6 ? _verifyOtp : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: getOtp().length == 6
                      ? const Color(0xff00A884)
                      : Colors.grey,
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("OTP Verified Successfully")),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Invalid OTP")));
    }
  }
}
