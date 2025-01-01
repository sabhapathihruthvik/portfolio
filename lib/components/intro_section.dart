import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Center(
        child: isDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Image.asset(
                      'assets/profile-pic.png',
                      width: MediaQuery.of(context).size.width / 3.5,
                      height: MediaQuery.of(context).size.height * 0.6,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 40),
                  Flexible(
                    flex: 5,
                    child: _buildTextSection(context),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/profile-pic.png',
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  _buildTextSection(context),
                ],
              ),
      ),
    );
  }

  Widget _buildTextSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, I am HRUTHVIK SABHAPATHI',
          style: GoogleFonts.patrickHand(
            textStyle: const TextStyle(
              fontSize: 40,
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
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 30),
        // Wrapping the typewriter animation to prevent overflow
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 5,
          children: [
            Text(
              'I ',
              style: GoogleFonts.patrickHand(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            Flexible(
              child: AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  TyperAnimatedText(
                    'LOVE TO DEVELOP FLUTTER APPS.',
                    textStyle: GoogleFonts.patrickHand(
                      fontSize: 24,
                      color: Colors.deepOrange,
                    ),
                    speed: const Duration(milliseconds: 150),
                  ),
                  TyperAnimatedText(
                    'LIKE TO EXPLORE AI/ML.',
                    textStyle: GoogleFonts.patrickHand(
                      fontSize: 24,
                      color: Colors.deepOrange,
                    ),
                    speed: const Duration(milliseconds: 150),
                  ),
                  TyperAnimatedText(
                    'AM INTERESTED TO LEARN NEW TECH!',
                    textStyle: GoogleFonts.patrickHand(
                      fontSize: 24,
                      color: Colors.deepOrange,
                    ),
                    speed: const Duration(milliseconds: 150),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Driven by challenges and ready to create impactful digital experiences.',
          style: GoogleFonts.patrickHand(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Feel free to explore my portfolio and connect with me to create something amazing together!',
          style: GoogleFonts.patrickHand(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:google_fonts/google_fonts.dart';

// class IntroSection extends StatelessWidget {
//   const IntroSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = MediaQuery.of(context).size.width > 800;

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
//       child: Center(
//         child: isDesktop
//             ? Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Flexible(
//                     flex: 3,
//                     child: Image.asset(
//                       'assets/profile-pic.png',
//                       width: MediaQuery.of(context).size.width / 3.5,
//                       height: MediaQuery.of(context).size.height * 0.6,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   const SizedBox(width: 40),
//                   Flexible(
//                     flex: 5,
//                     child: _buildTextSection(context),
//                   ),
//                 ],
//               )
//             : Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/profile-pic.png',
//                     width: MediaQuery.of(context).size.width * 0.6,
//                     height: MediaQuery.of(context).size.height * 0.3,
//                     fit: BoxFit.contain,
//                   ),
//                   const SizedBox(height: 20),
//                   _buildTextSection(context),
//                 ],
//               ),
//       ),
//     );
//   }

//   Widget _buildTextSection(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Hi, I am HRUTHVIK SABHAPATHI',
//           style: GoogleFonts.patrickHand(
//             textStyle: const TextStyle(
//               fontSize: 40,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           'Computer Science Student.',
//           style: GoogleFonts.patrickHand(
//             textStyle: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w400,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(height: 30),
//         Row(
//           children: [
//             Text(
//               'I ',
//               style: GoogleFonts.patrickHand(
//                 textStyle: const TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             // ignore: deprecated_member_use
//             TypewriterAnimatedTextKit(
//               text: const [
//                 'LOVE TO DEVELOP FLUTTER APPS.',
//                 'LIKE TO EXPLORE AI/ML.',
//                 'AM INTERESTED TO LEARN NEW TECH!',
//               ],
//               speed: const Duration(milliseconds: 150),
//               textStyle: GoogleFonts.patrickHand(
//                 fontSize: 24,
//                 color: Colors.deepOrange,
//               ),
//               totalRepeatCount: 1,
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Text(
//           'Driven by challenges and ready to create impactful digital experiences.',
//           style: GoogleFonts.patrickHand(
//             textStyle: const TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.w400,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Text(
//           'Feel free to explore my portfolio and connect with me to create something amazing together!',
//           style: GoogleFonts.patrickHand(
//             textStyle: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }















// // In components/intro_section.dart

// import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:google_fonts/google_fonts.dart';

// class IntroSection extends StatelessWidget {
//   const IntroSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
//       child: Center(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               'assets/profile-pic.png', // Your image file
//               width: MediaQuery.of(context).size.width /
//                   3.5, // Adjust width for balance
//               height: MediaQuery.of(context).size.height * 0.8, // Adjust height
//               fit: BoxFit.contain,
//             ),
//             const SizedBox(width: 40), // Space between image and text
//             Expanded(
//               // Ensures no overflow and better space management
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Hi, I am HRUTHVIK SABHAPATHI',
//                     style: GoogleFonts.patrickHand(
//                       textStyle: const TextStyle(
//                         fontSize: 60, // Larger font for the main title
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Computer Science Student.',
//                     style: GoogleFonts.patrickHand(
//                       textStyle: const TextStyle(
//                         fontSize: 30, // Adjusted tagline font size
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   // Typewriter effect text for skills
//                   Row(
//                     children: [
//                       Text(
//                         'I ',
//                         style: GoogleFonts.patrickHand(
//                           textStyle: const TextStyle(
//                             fontSize: 30, // Font for static text
//                             fontWeight: FontWeight.w400,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       // ignore: deprecated_member_use
//                       TypewriterAnimatedTextKit(
//                         text: const [
//                           'LOVE TO DEVELOP FLUTTER APPS.',
//                           'LIKE TO EXPLORE AI/ML.',
//                           'AM INTERESTED TO LEARN NEW TECH!',
//                         ],
//                         speed: const Duration(milliseconds: 150),
//                         textStyle: GoogleFonts.patrickHand(
//                           fontSize: 30,
//                           //fontWeight: FontWeight.w400,
//                           color: Colors.deepOrange,
//                         ),
//                         totalRepeatCount: 1,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Driven by challenges and ready to create impactful digital experiences.',
//                     style: GoogleFonts.patrickHand(
//                       textStyle: const TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w400,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     'Feel free to explore my portfolio and connect with me to create something amazing together!',
//                     style: GoogleFonts.patrickHand(
//                       textStyle: const TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
