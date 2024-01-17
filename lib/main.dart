import 'package:flutter/material.dart';
import 'package:reddit_challenge/features/splash/screens/splash_screen.dart';
import 'package:reddit_challenge/injection_container.dart';

void main() async {
  await initializeDependancies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'reddit demo challenge',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
