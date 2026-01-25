import 'package:flutter/material.dart';
import 'package:whatsap/Screens/Ver_num.dart';
import 'package:whatsap/UIhelper/uihelp.dart';

class loginscrn extends StatefulWidget {
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
              height: 15,
            ),
            SizedBox(height: 6),
            UIhelper.customtext(
              text: "number. Carrier charges may apply.",
              height: 15,
            ),
            SizedBox(height: 1),
            UIhelper.customsbutton(
              color: Color(0xff00A884),
              buttonName: " What's my number?",
              callback: () {},
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 65, right: 65),
              child: DropdownButtonFormField(items: ["Pakistan","India","Turkey","Japan"].map((c){
                return
              }), onChanged: onChanged)
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "+91",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff00A884)),
                      ),
                      focusedBorder: UnderlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 172,
                  child: TextField(keyboardType: TextInputType.number),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: UIhelper.customButton(
        callback: () {
          if (countries == "Pakistan") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ver_n()),
            );
          }
        },
        buttonName: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
