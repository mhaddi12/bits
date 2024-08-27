import 'package:bits/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnBoardingView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Box(
          child: StyledImage(
            image: AssetImage('assets/images/Designer (2).png'),
            style: Style(
                $image.fit.cover(), $image.height(200), $image.width(200)),
          ),
        ),
      ),
    );
  }
}
