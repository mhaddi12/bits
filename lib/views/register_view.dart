import 'dart:io';
import 'package:bits/views/register_email.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mix/mix.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? file;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Chatbox',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      'Connect\nfriends\neasily &\nquickly',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Our chat app is the perfect way to stay\nconnected with friends and family.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.facebook),
                          onPressed: () {
                            // Handle Facebook sign-in
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.g_translate),
                          onPressed: () {
                            // Handle Google sign-in
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.apple),
                          onPressed: () {
                            // Handle Apple sign-in
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('OR', style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle Sign up with email
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text('Sign up with mail'),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        // Handle Log in
                      },
                      child: Text(
                        'Existing account? Log in',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ],
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
