import 'package:flutter/material.dart';
import './screens/onboarding_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.soraTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: OnboardingScreen(),
    );
  }
}

