import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsap/Screens/Chat/chat.dart';
import 'package:whatsap/UIhelper/uihelp.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:whatsap/provider/provider_class.dart';

class Profile_info extends StatefulWidget {
  const Profile_info({super.key});

  @override
  State<Profile_info> createState() => _Profile_infoState();
}

class _Profile_infoState extends State<Profile_info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            UIhelper.customtext(
              text: "Profile info",
              height: 20,
              color: Color(0xff00A884),
              fontweight: FontWeight.w700,
            ),
            SizedBox(height: 70),
            UIhelper.customtext(
              text: "Please provide your name and an optional",
              height: 16,
            ),
            UIhelper.customtext(text: "profile photo", height: 16),
            SizedBox(height: 40),

            Consumer<profilepro>(
              builder: (context, provider, child) {
                final imageFile = provider.image;

                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(60),
                    onTap: () {
                      provider.pickImage();
                    },
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: imageFile != null
                          ? FileImage(imageFile)
                          : null,
                      child: imageFile == null
                          ? const Icon(
                              Icons.camera_alt,
                              size: 30,
                              color: Colors.grey,
                            )
                          : null,
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 20),
            SizedBox(
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 66, 164, 69),
                      width: 1.7,
                    ),
                  ),
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: UIhelper.customButton(
        callback: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Chatscr()),
          );
        },
        buttonName: "Next",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
