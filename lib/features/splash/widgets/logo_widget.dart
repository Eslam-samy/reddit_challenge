import 'package:flutter/material.dart';
import 'package:reddit_challenge/core/constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      splashLogoSrc,
      width: 70,
      height: 70,
    );
  }
}
