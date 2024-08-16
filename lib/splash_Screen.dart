import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/loginscreens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 170, 136, 32),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Image.asset('images/Tiplogo.png', height: 50, width: 50)),
      ),
    );
  }
}
