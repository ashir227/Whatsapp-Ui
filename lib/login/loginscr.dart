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
      floatingActionButton: Consumer(
        builder: (context, auth, _) {
          return FloatingActionButton(
            backgroundColor: context.watch<Authprovider>().isvalid
                ? Color(0xff00A884)
                : Colors.grey,

            onPressed: context.watch<Authprovider>().isvalid
                ? () {
                    print(
                      context.watch<Authprovider>().Selectedcode +
                          context.watch<Authprovider>().selectedcountry,
                    );
                  }
                : null,
            child: const Icon(Icons.arrow_forward),
          );
        },
      ),
    );
  }
}
