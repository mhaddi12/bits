import 'dart:io';
import 'package:bits/views/register_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mix/mix.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? file;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
      resizeToAvoidBottomInset: true,
      body: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Box(
                style: Style(
                  $box.width(screenWidth),
                  $box.height(screenHeight),
                  $box.padding(32),
                  $box.color(isDarkMode ? Colors.black : Colors.white),
                  $box.elevation(0),
                ),
                child: VBox(
                  style: Style(
                    $flex.mainAxisAlignment.center(),
                    $flex.crossAxisAlignment.center(),
                    $flex.gap(20),
                  ),
                  children: [
                    StyledText(
                      "Register",
                      style: Style(
                        $text.style.fontSize(24),
                        $text.style.fontWeight.w600(),
                        $text.style
                            .color(isDarkMode ? Colors.white : Colors.black),
                      ),
                    ),
                    PressableBox(
                      onPress: () => getImage(),
                      style: Style(
                        $box.border.all(
                          width: 2,
                          color: isDarkMode
                              ? Colors.grey.shade700
                              : Colors.grey.shade300,
                        ),
                        $box.shape.circle(),
                        $box.width(152),
                        $box.height(152),
                        $box.shadow(
                          color: isDarkMode
                              ? Colors.grey.shade900
                              : Colors.grey.shade500,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                        $box.color(isDarkMode ? Colors.black : Colors.white),
                      ),
                      child: Stack(
                        children: [
                          ClipOval(
                            child: StyledImage(
                              style: Style(
                                $image.width(152),
                                $image.height(152),
                                $image.fit.cover(),
                                $image.alignment.center(),
                              ),
                              image: file == null
                                  ? const NetworkImage(
                                      'https://static.vecteezy.com/system/resources/previews/005/544/718/non_2x/profile-icon-design-free-vector.jpg',
                                    )
                                  : FileImage(file!),
                            ),
                          ),
                          if (file == null)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: isDarkMode
                                    ? Colors.grey.shade800
                                    : Colors.white,
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                  size: 20,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    TextFormField(
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.grey[900],
                      ),
                      controller: nameController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(
                            color: isDarkMode
                                ? Colors.grey[400]
                                : Colors.grey[700]),
                        hintText: "Name",
                        enabled: true,
                        labelStyle: TextStyle(
                            color: isDarkMode
                                ? Colors.grey[400]
                                : Colors.grey[700]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: isDarkMode
                                  ? Colors.grey
                                  : Colors.grey.shade400),
                        ),
                        filled: true,
                        fillColor: isDarkMode
                            ? Colors.grey.shade900
                            : Colors.grey.shade100,
                      ),
                    ),
                    HBox(
                      style: Style($flex.gap(12)),
                      children: [
                        Expanded(
                          child: InternationalPhoneNumberInput(
                            textStyle: TextStyle(
                              color:
                                  isDarkMode ? Colors.white : Colors.grey[900],
                            ),
                            onInputChanged: (number) {
                              print(number.phoneNumber);
                            },
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.DROPDOWN,
                            ),
                            initialValue: PhoneNumber(isoCode: 'PK'),
                            textFieldController: phoneController,
                            inputDecoration: InputDecoration(
                              hintText: "Phone Number",
                              hintStyle: TextStyle(
                                  color: isDarkMode
                                      ? Colors.grey[400]
                                      : Colors.grey[700]),
                              labelStyle: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.grey[900]),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: isDarkMode
                                        ? Colors.grey
                                        : Colors.grey.shade400),
                              ),
                              filled: true,
                              fillColor: isDarkMode
                                  ? Colors.grey.shade900
                                  : Colors.grey.shade100,
                            ),
                            formatInput: true,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    PressableBox(
                      onPress: () {
                        if (nameController.text.isEmpty) {
                          Get.snackbar(
                            "Failed",
                            "Name Field is Empty",
                            backgroundColor:
                                isDarkMode ? Colors.grey[900] : Colors.grey,
                            colorText: Colors.red,
                            snackPosition: SnackPosition.TOP,
                            icon:  Icon(Icons.sms_failed_outlined,color: Colors.red,),
                          );
                          return;
                        } else if (phoneController.text.isEmpty) {
                          Get.snackbar(
                            "Failed",
                            "Number Field is Empty",
                            backgroundColor:
                                isDarkMode ? Colors.grey[900] : Colors.grey,
                            colorText: Colors.red,
                            snackPosition: SnackPosition.TOP,
                          );
                          return;
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const RegisterEmail(),
                            ),
                          );
                        }
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
                          "Continue",
                          style: Style(
                            $text.style.fontSize(16),
                            $text.style.fontWeight.w600(),
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
      var imageTaken =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageTaken == null) return;

      setState(() {
        file = File(imageTaken.path);
      });
    } catch (e) {
      print("Platform Exception: $e");
    }
  }
}
