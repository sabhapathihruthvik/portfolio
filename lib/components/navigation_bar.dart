// File: components/navigation_bar.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // Track hover state for each section (specific to each nav item)
  final Map<String, bool> _hoverStates = {};
  bool _isHoveredOnTitle = false; // Track hover state for title text

  // Sections for Navbar
  final List<String> _sections = [
    'Intro',
    'Skills',
    'Projects',
    'Internships',
    'About me',
    'Contact'
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          // Title with Hover Effect
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHoveredOnTitle = true; // When mouse enters the title
              });
            },
            onExit: (_) {
              setState(() {
                _isHoveredOnTitle = false; // When mouse exits the title
              });
            },
            child: Text(
              'Fenrir Flameborn',
              style: GoogleFonts.shantellSans(
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          // Image shown on hover over the title text
          AnimatedOpacity(
            opacity: _isHoveredOnTitle ? 1.0 : 0.0, // Show when hovered
            duration: const Duration(milliseconds: 300),
            child: _isHoveredOnTitle
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset(
                      'assets/fenrir.jpg', // Make sure the image exists in assets
                      width: 30,
                      height: 30,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
      actions: _sections
          .map(
            (section) => _buildNavItem(section), // Generate for each item
          )
          .toList(),
    );
  }

  // Builds each nav item with hover effect
  Widget _buildNavItem(String section) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoverStates[section] = true; // Mark section as hovered
        });
      },
      onExit: (_) {
        setState(() {
          _hoverStates[section] = false; // Reset when mouse exits
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          children: [
            Transform.translate(
              offset: _hoverStates[section] == true
                  ? const Offset(0, -5) // Move the hovered item up
                  : const Offset(0, 0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  section,
                  style: GoogleFonts.merienda(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            // Only show the purple line under the hovered item
            if (_hoverStates[section] == true)
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 2,
                color: Colors.purple,
                width: _calculateWidthForSection(section),
              ),
          ],
        ),
      ),
    );
  }

  // Dynamically calculate the width of the line based on the text length
  double _calculateWidthForSection(String section) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: section,
        style: GoogleFonts.merienda(textStyle: TextStyle(color: Colors.white)),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }
}
