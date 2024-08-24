import 'dart:io';

import 'package:bits/views/register_email.dart';
import 'package:bits/views/user_view.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mix/mix.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonenumber = TextEditingController();

  File? file;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenhight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: InkWell(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Box(
                style: Style(
                  $box.width(screenWidth),
                  $box.height(screenhight / 1.5),
                  $box.padding(32),
                  // Padding around the Box
                  $box.color(Colors.white),
                  // Background color in light mode
                  $on.dark(
                    $box.color(
                        Colors.grey[900]!), // Background color in dark mode
                  ),
                  $box.borderRadius(16),
                  // Rounded corners
                  $box.elevation(8),
                  // Shadow elevation
                  $box.shadow
                      .color(Colors.black.withOpacity(0.2)), // Shadow color
                ),
                child: VBox(
                  style: Style(
                    $flex.mainAxisAlignment.center(),
                    $flex.crossAxisAlignment.center(),
                    $flex.gap(20), // Space between children
                  ),
                  children: [
                    StyledText(
                      "Register",
                      style: Style(
                        $text.style.fontSize(24),
                        $text.style.fontWeight.bold(),
                        $text.style.color(Colors.black),
                        // Text color in light mode
                        $on.dark(
                          $text.style
                              .color(Colors.white), // Text color in dark mode
                        ),
                      ),
                    ),
                    ZBox(children: [
                      PressableBox(
                        onPress: ()=> {
                          getImage()
                        },
                        style: Style(
                          $box.border.all(
                            width: 2,
                          ),
                          $box.shape.circle(), // Circular shape for the box
                          $box.width(152),
                          $box.height(152),
                          $on.light(
                              $box.color(Colors.black),
                              $on.dark(
                                $box.color(Colors.white70),
                                $box.border.all(width: 2, color: Colors.white),
                              ) // Text color in dark mode
                              ),
                        ),
                        child: ClipOval(
                          // borderRadius: BorderRadius.circular(90),
                          child: StyledImage(
                            style: Style(
                              $image.width(152),
                              $image.height(152),
                              $image.fit.cover(),
                              $image.alignment.center(),
                            ),
                            image: file == null
                                ? NetworkImage(
                                    'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
                                  )
                                : FileImage(file!),
                          ),
                        ),
                      ),

                      if(file==null)
                      Positioned(
                        bottom: 7,
                        right: 2,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade400,
                          // radius: 18,
                          child: Box(
                            style: Style(
                                // $box.width(20),
                                // $box.height(20),

                                ),
                            child: Center(
                              child: StyledIcon(
                                  style: Style($icon.color(Colors.black)),
                                  Icons.add),
                            ),
                          ),
                        ),
                      )
                    ]),
                    TextFormField(

                      controller: namecontroller,
                      decoration: InputDecoration(
                        hintText: "Name",
                        hoverColor: Colors.black54,
                        focusColor: Colors.black,
                        enabled: true,
                        labelStyle: TextStyle(
                          color: Colors.grey[700], // Label color in light mode
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                    ),
                    HBox(
                      style: Style(
                        $flex.gap(
                            12), // Space between the CountryCodePicker and TextField
                      ),
                      children: [
                        // CountryCodePicker(
                        //   onChanged: (country) => print(country), // Handle country changes
                        //   initialSelection: 'PK', // Country code for Pakistan
                        //   favorite: ['+92', 'PK'], // Favorite country dial code and code
                        //   showCountryOnly: false, // Show both country name and dial code
                        //   showOnlyCountryWhenClosed: false, // Show both when closed
                        //   alignLeft: false, // Align flag and text
                        //   boxDecoration: BoxDecoration(
                        //     color: Colors.white, // Background color of the picker
                        //     borderRadius: BorderRadius.circular(12),
                        //   ),
                        // ),
                        Expanded(
                          child: InternationalPhoneNumberInput(

                            onInputChanged: (PhoneNumber number) {
                              print(number
                                  .phoneNumber); // Get formatted phone number
                            },
                            selectorConfig: SelectorConfig(
                              selectorType: PhoneInputSelectorType.DROPDOWN,
                            ),
                            initialValue: PhoneNumber(isoCode: 'PK'),
                            // Set the initial country code
                            textFieldController: phonenumber,
                            inputDecoration: InputDecoration(
                              labelText: "Phone Number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.black),
                              ),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                            ),
                            formatInput: true,
                            // Automatically formats the phone number
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    PressableBox(
                      onPress: () {
                        //if(namecontroller.text.isEmpty||phonenumber.text.isEmpty){
                          if(namecontroller.text.isEmpty)
                            {
                              Get.snackbar(
                                  snackPosition: SnackPosition.TOP,
                                icon: Icon(Icons.sms_failed_outlined),
                                "Failed",
                                "Name Field is Empty",
                                backgroundColor: Colors.grey,
                                colorText: Colors.red,

                              );
                              return;
                            }
                          else if(phonenumber.text.isEmpty){

                            Get.snackbar(
                              "Failed",
                              "Number Field is Empty",
                              backgroundColor: Colors.grey,
                              colorText: Colors.red,
                              snackPosition: SnackPosition.TOP,
                            );

                            return ;
                          }
                          else{
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => RegisterEmail()),
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
                              .color(Colors.white), // Text color in dark mode
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getImage() async {
    try {
      print("taken");
      var imagetaken =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagetaken == null) return;

      setState(() {
        print("good");
     // File(imagetaken!.path) as XFile?;
        file =File( imagetaken.path);
        print(file);
        //imagetaken =
      });
    } catch (e) {
      print("Platform Exception: $e");
    }
  }
}
