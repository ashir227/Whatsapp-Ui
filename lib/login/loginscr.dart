import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsap/Screens/Otp_scr.dart';
import 'package:whatsap/UIhelper/uihelp.dart';
import 'package:whatsap/provider/provider_class.dart';

class loginscr extends StatefulWidget {
  @override
  State<loginscr> createState() => _loginscrState();
}

class _loginscrState extends State<loginscr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 50),
            UIhelper.customtext(
              text: "Enter your phone number",
              height: 20,
              color: const Color(0xff00A884),

              fontweight: FontWeight.w700,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65),
              child: DropdownButtonFormField<String>(
                value: context.watch<Authprovider>().selectedcountry,
                items: context.watch<Authprovider>().countries.map((c) {
                  return DropdownMenuItem<String>(value: c, child: Text(c));
                }).toList(),
                onChanged: (Value) {
                  context.read<Authprovider>().changecountry(Value!);
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: context.watch<Authprovider>().Selectedcode,
                      border: const UnderlineInputBorder(),
                      focusedBorder: const UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 172,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        context.read<Authprovider>().setnum(value.trim()),
                    decoration: const InputDecoration(
                      hintText: "Phone number",
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<Authprovider>(
        builder: (context, auth, _) {
          bool isValid = auth.isvalid;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: isValid ? () => _verifyPhone(context, auth) : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isValid
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
          );
        },
      ),
    );
  }

  // 🔑 Minimal Change: Firebase callbacks properly handled
  void _verifyPhone(BuildContext context, Authprovider auth) async {
    String fullNumber = auth.Selectedcode + auth.phonenum;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: fullNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          // auto sign-in
          await FirebaseAuth.instance.signInWithCredential(credential);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Phone number automatically verified"),
            ),
          );
        },
        verificationFailed: (FirebaseException e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Verification failed: ${e.message}")),
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  Otp(verificationId: verificationId, phoneNumber: fullNumber),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
    }
  }
}
