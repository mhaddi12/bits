import 'package:bits/views/user_view.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Box(
              style: Style(
                $box.padding(32), // Padding around the Box
                $box.color(Colors.white), // Background color in light mode
                $on.dark(
                  $box.color(Colors.grey[900]!), // Background color in dark mode
                ),
                $box.borderRadius(16), // Rounded corners
                $box.elevation(8), // Shadow elevation
                $box.shadow.color(Colors.black.withOpacity(0.2)), // Shadow color
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
                      $text.style.color(Colors.black), // Text color in light mode
                      $on.dark(
                        $text.style.color(Colors.white), // Text color in dark mode
                      ),
                    ),
                  ),
                  PressableBox(
                    style: Style(
                      
                      $box.shape.circle(), // Circular shape for the box
                      $box.width(152),
                      $box.height(152),
                    ),
                    child: StyledImage(
                      style: Style(
                        $image.width(152),
                        $image.height(152),
                        $image.fit.cover(),
                        $image.alignment.center(),
                      ),
                      image: const NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
                      ),
                    ),
                  ),

                  TextField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                        color: Colors.grey[700], // Label color in light mode
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  HBox(
                    style: Style(
                      $flex.gap(12), // Space between the CountryCodePicker and TextField
                    ),
                    children: [
                      CountryCodePicker(
                        onChanged: (country) => print(country), // Handle country changes
                        initialSelection: 'PK', // Country code for Pakistan
                        favorite: ['+92', 'PK'], // Favorite country dial code and code
                        showCountryOnly: false, // Show both country name and dial code
                        showOnlyCountryWhenClosed: false, // Show both when closed
                        alignLeft: false, // Align flag and text
                        boxDecoration: BoxDecoration(
                          color: Colors.white, // Background color of the picker
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  PressableBox(
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const UserView()),
                      );
                    },
                    style: Style(
                      $box.width(150), // Button width
                      $box.height(50), // Button height
                      $box.color(Colors.blueAccent), // Button color in light mode
                      $box.borderRadius(12), // Rounded button corners
                      $box.elevation(2), // Button shadow elevation
                      $text.style.color(Colors.white), // Text color in light mode
                      $on.dark(
                        $box.color(Colors.blue[700]!), // Button color in dark mode
                        $text.style.color(Colors.white), // Text color in dark mode
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
    );
  }
}
