import 'package:bits/views/home_screen.dart';
import 'package:bits/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mix/mix.dart';

import 'bottom_navigation.dart';

class EmailVerify extends StatefulWidget {
  String email;

  EmailVerify({super.key, required this.email});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  _EmailVerifyState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: VBox(children: [
            Box(
                style: Style(
                  $box.width(300),
                  $box.height(300),
                ),
                child: Lottie.asset('assets/images/check_mail.json')),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            StyledText(
              "We send a verification Link on your ",
              style: Style(),
            ),
            StyledText(
              "${widget.email}",
              style: Style(
                $text.style.fontWeight(FontWeight.bold),
                $text.style.fontSize(16),
                $text.style.color.blue(),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            PressableBox(
              onPress: () {
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavigation()));

              },

              style: Style(
                $box.width(150),
                $box.height(50),
                $box.color(
                     Colors.orangeAccent),
                $box.borderRadius(25),
                $box.elevation(2),
                $text.style.color(Colors.white),
                $text.style.fontWeight.w600(),
              ),
              child: Center(
                child: StyledText(
                  "Lets chat",
                  style: Style(
                    $text.style.fontSize(16),
                    $text.style.fontWeight.w600(),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
