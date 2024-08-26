import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bits/views/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mix/mix.dart';

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({super.key});

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus(); // Corrected focus handling
        },
        child: Center(
          child: SingleChildScrollView(
            child: VBox(
              style: Style(
                $flex.mainAxisAlignment.center(),
                $box.padding.all(15),
                $box.height(size.height),
                $on.dark(
                  $box.color(Colors.grey[900]!),
                ),
              ),
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Hello world!',
                      textStyle: const TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 4,
                  pause: const Duration(milliseconds: 500),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: StyledText(
                    "Email",
                    style: Style(
                      $text.style.color(Colors.black),
                      $text.style.fontSize(20),
                      $text.style.fontWeight(FontWeight.bold),
                      $on.dark(
                        $text.style.color(Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!GetUtils.isEmail(value!))
                      return  "Email is not valid";
                    else
                      return null;
                  },
                  style: TextStyle(color: Colors.black),
                  controller: emailController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(color: Colors.black),
                    hintText: "Enter your email",
                    hoverColor: Colors.black54,
                    focusColor: Colors.black,
                    enabled: true,
                    // labelStyle: TextStyle(
                    //   color: Colors.grey[700], // Label color in light mode
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                PressableBox(
                  onPress: () {
                    if (emailController.text.isEmpty) {
                      // Displaying a snackbar message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Email Field is Empty",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                      return;
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => EmailVerify(
                            email: emailController.text,
                          ),
                        ),
                      );
                    }
                  },
                  style: Style(
                    $box.width(150),
                    $box.height(50),
                    $box.color(Colors.blueAccent),
                    $box.borderRadius(12),
                    $box.elevation(2),
                    $text.style.color(Colors.white),
                    $on.dark(
                      $box.color(Colors.blue[700]!),
                      $text.style.color(Colors.white),
                    ),
                  ),
                  child: Center(
                    child: StyledText(
                      "Continue",
                      style: Style(
                        $text.style.fontSize(16),
                        $text.style.fontWeight.bold(),
                        $on.dark(
                          $text.style.color(Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
