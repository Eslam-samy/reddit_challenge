import 'dart:async';

import 'package:flutter/material.dart';
import 'package:reddit_challenge/features/home/home_tabs_screen.dart';
import 'package:reddit_challenge/features/splash/widgets/logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
// Wait for 3 seconds and then navigate to the next screen
    Timer(
      const Duration(seconds: 5),
      () {
        _navigateToHomeScreen();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LogoWidget(),
      ),
    );
  }

  void _navigateToHomeScreen() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const HomeTapsScreen()));
  }
}
