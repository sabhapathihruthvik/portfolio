// In components/intro_section.dart

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/profile-pic.png', // Your image file
              width: MediaQuery.of(context).size.width /
                  2.5, // Adjust width for balance
              height: MediaQuery.of(context).size.height * 0.8, // Adjust height
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 40), // Space between image and text
            Expanded(
              // Ensures no overflow and better space management
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, I am HRUTHVIK SABHAPATHI',
                    style: GoogleFonts.patrickHand(
                      textStyle: const TextStyle(
                        fontSize: 60, // Larger font for the main title
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Computer Science Student.',
                    style: GoogleFonts.patrickHand(
                      textStyle: const TextStyle(
                        fontSize: 30, // Adjusted tagline font size
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Typewriter effect text for skills
                  Row(
                    children: [
                      Text(
                        'I ',
                        style: GoogleFonts.patrickHand(
                          textStyle: const TextStyle(
                            fontSize: 30, // Font for static text
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // ignore: deprecated_member_use
                      TypewriterAnimatedTextKit(
                        text: const [
                          'develop Flutter apps',
                          'Create AI/ML models',
                          'Explore new technologies and frameworks.',
                        ],
                        speed: const Duration(milliseconds: 150),
                        textStyle: GoogleFonts.patrickHand(
                          fontSize: 30,
                          //fontWeight: FontWeight.w400,
                          color: Colors.deepPurple,
                        ),
                        totalRepeatCount: 1,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Driven by challenges and ready to create impactful digital experiences.',
                    style: GoogleFonts.patrickHand(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
