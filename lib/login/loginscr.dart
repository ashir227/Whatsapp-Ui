import 'package:flutter/material.dart';
import 'package:whatsap/UIhelper/uihelp.dart';

class loginscrn extends StatefulWidget {
  const loginscrn({super.key});

  @override
  State<loginscrn> createState() => _loginscrnState();
}

class _loginscrnState extends State<loginscrn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: UIhelper.customtext(
          text: "Enter your phone number",
          height: 20,
          color: Color(0xff00A884),
          fontweight: FontWeight.w700,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            UIhelper.customtext(
              text: "WhatsApp will need to verify your phone",
              height: 14,
            ),
            SizedBox(height: 6),
            UIhelper.customtext(
              text: "number. Carrier charges may apply.",
              height: 14,
            ),
            SizedBox(height: 1),
            UIhelper.customsbutton(
              buttonName: " What’s my number?",
              callback: () {},
            ),
          ],
        ),
      ),
    );
  }
}
