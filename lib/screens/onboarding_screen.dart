import 'package:flutter/material.dart';
import './main_screen.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Layer 1: The Background Image
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            child:  Image.asset(
              'assets/Image Onboarding.png', 
              fit: BoxFit.cover, // This makes the image fill the screen
            ),
          ),

          // Layer 2: The Content (Lower Half)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35, // Occupies 50% of screen
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20,0,20,13),
              
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.translate(
                    offset: Offset(0, -40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fall in Love with',
                          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Coffee in Blissful',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Delight',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  
                  Transform.translate(
                    offset: Offset(0, -30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                        'Welcome to our cozy coffee corner, where',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'every cup is a delightful for you.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(MainScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), 
                      ),
                      backgroundColor: Color(0xFFC67C4E),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                    ),
                    child: Text('Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        fontWeight: FontWeight.w600,
                        ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}