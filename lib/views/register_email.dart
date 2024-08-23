import 'package:bits/views/user_view.dart';
import 'package:bits/views/verify_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:lottie/lottie.dart';
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
    return GetBuilder(
      assignId: true,
      builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.white,
          body:

          InkWell(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Center(
              child: SingleChildScrollView(
                child: VBox(
                    style: Style(
                        $flex.mainAxisAlignment.center(),
                        $box.padding.all(15)
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: StyledText("Email", style: Style(
                          $text.style.color(Colors.black),
                          $text.style.fontSize(20),
                          $text.style.fontWeight(FontWeight.bold),

                        ),),
                      ),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.025),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(

                          hintText: "Enter your email",
                          hoverColor: Colors.black54,
                          focusColor: Colors.black,
                          enabled: true,

                          labelStyle: TextStyle(
                            color: Colors
                                .grey[700], // Label color in light mode
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.black),
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.05),
                      GetX(

                        initState: (_) {},
                        builder: (logic) {
                          return PressableBox(
                            onPress: () {
                              //if(namecontroller.text.isEmpty||phonenumber.text.isEmpty){
                              if (emailController.text.isEmpty) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(content: Text("Email Fields is Empty",style: TextStyle(color: Colors.red),))
                                // );

                                return;
                              }

                              else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) =>
                                      EmailVerify(
                                        email: emailController.text,)),
                                );
                              }
                            },
                            style: Style(
                              $box.width(150),
                              // Button width
                              $box.height(50),
                              // Button height
                              $box.color(Colors.blueAccent),
                              // Button color in light mode
                              $box.borderRadius(12),
                              // Rounded button corners
                              $box.elevation(2),
                              // Button shadow elevation
                              $text.style.color(Colors.white),
                              // Text color in light mode
                              $on.dark(
                                $box.color(Colors.blue[700]!),
                                // Button color in dark mode
                                $text.style
                                    .color(
                                    Colors.white), // Text color in dark mode
                              ),
                            ),
                            child: Center(
                              child: StyledText(
                                "Continue",
                                style: Style(
                                  $text.style.fontSize(16),
                                  $text.style.fontWeight.bold(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
