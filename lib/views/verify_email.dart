import 'package:bits/views/user_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mix/mix.dart';

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
            // PressableBox(
            //   onPress: () {
            //     //if(namecontroller.text.isEmpty||phonenumber.text.isEmpty){
            //
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (_) => UserView()),
            //     );
            //   },
            //   style: Style(
            //     $box.width(150),
            //     // Button width
            //     $box.height(50),
            //     // Button height
            //     $box.color(Colors.blueAccent),
            //     // Button color in light mode
            //     $box.borderRadius(12),
            //     // Rounded button corners
            //     $box.elevation(2),
            //     // Button shadow elevation
            //     $text.style.color(Colors.white),
            //     // Text color in light mode
            //     $on.dark(
            //       $box.color(Colors.blue[700]!),
            //       // Button color in dark mode
            //       $text.style.color(Colors.white), // Text color in dark mode
            //     ),
            //   ),
            //   child: Center(
            //     child: StyledText(
            //       "Verify",
            //       style: Style(
            //         $text.style.fontSize(16),
            //         $text.style.fontWeight.bold(),
            //       ),
            //     ),
            //   ),
            // ),
          ]),
        ),
      ),
    );
  }
}
