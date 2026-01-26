import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsap/Screens/Ver_num.dart';
import 'package:whatsap/UIhelper/uihelp.dart';
import 'package:whatsap/provider/provider_class.dart';

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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: context.watch<Authprovider>().Selectedcode,
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
                  child: TextField(
                    focusNode: FocusNode(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      context.read<Authprovider>().setnum(value);
                    },
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
          bool isValid = context.watch<Authprovider>().isvalid;

          return Padding(
            padding: const EdgeInsets.all(16.0), // button ke around space
            child: SizedBox(
              width: double.infinity, // full width
              height: 50, // WhatsApp style height
              child: ElevatedButton(
                onPressed: isValid
                    ? () {
                        print(
                          context.watch<Authprovider>().Selectedcode +
                              context.watch<Authprovider>().selectedcountry,
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isValid ? Color(0xff00A884) : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // circular edges
                  ),
                ),
                child: Text(
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
}
