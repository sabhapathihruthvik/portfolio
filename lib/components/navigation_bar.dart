import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final Map<String, bool> _hoverStates = {};
  bool _isHoveredOnTitle = false;
  final List<String> _sections = [
    'Intro',
    'Skills',
    'Projects',
    'Internships',
    'About me',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return AppBar(
      backgroundColor: const Color.fromARGB(0, 157, 19, 19),
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHoveredOnTitle = true;
              });
            },
            onExit: (_) {
              setState(() {
                _isHoveredOnTitle = false;
              });
            },
            child: Text(
              'Fenrir',
              style: GoogleFonts.shantellSans(
                textStyle: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: _isHoveredOnTitle ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: _isHoveredOnTitle
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image.asset(
                      'assets/fenrir.jpg',
                      width: 30,
                      height: 30,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
      centerTitle: false,
      actions: isDesktop
          ? [
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: _sections
                        .map((section) => _buildNavItem(section))
                        .toList(),
                  ),
                ),
              ),
            ]
          : [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  _showPopupMenu(context);
                },
              ),
            ],
    );
  }

  Widget _buildNavItem(String section) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoverStates[section] = true;
        });
      },
      onExit: (_) {
        setState(() {
          _hoverStates[section] = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.translate(
              offset: _hoverStates[section] == true
                  ? const Offset(0, -5)
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

  double _calculateWidthForSection(String section) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: section,
        style: GoogleFonts.merienda(
            textStyle: const TextStyle(color: Colors.white)),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }

  void _showPopupMenu(BuildContext context) {
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 80, 20, 20),
      items: _sections
          .map(
            (section) => PopupMenuItem<String>(
              value: section,
              child: Text(
                section,
                style: GoogleFonts.merienda(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ).then((selectedSection) {
      if (selectedSection != null) {
        // Handle navigation on selection
      }
    });
  }
}


// // File: components/navigation_bar.dart
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   final Map<String, bool> _hoverStates = {};
//   bool _isHoveredOnTitle = false;
//   final List<String> _sections = [
//     'Intro',
//     'Skills',
//     'Projects',
//     'Internships',
//     'About me',
//     'Contact',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = MediaQuery.of(context).size.width > 800;

//     return AppBar(
//       backgroundColor: const Color.fromARGB(0, 157, 19, 19),
//       elevation: 0,
//       title: Row(
//         children: [
//           MouseRegion(
//             onEnter: (_) {
//               setState(() {
//                 _isHoveredOnTitle = true;
//               });
//             },
//             onExit: (_) {
//               setState(() {
//                 _isHoveredOnTitle = false;
//               });
//             },
//             child: Text(
//               'Fenrir',
//               style: GoogleFonts.shantellSans(
//                 textStyle: const TextStyle(color: Colors.white, fontSize: 24),
//               ),
//             ),
//           ),
//           AnimatedOpacity(
//             opacity: _isHoveredOnTitle ? 1.0 : 0.0,
//             duration: const Duration(milliseconds: 300),
//             child: _isHoveredOnTitle
//                 ? Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: Image.asset(
//                       'assets/fenrir.jpg',
//                       width: 30,
//                       height: 30,
//                     ),
//                   )
//                 : const SizedBox.shrink(),
//           ),
//         ],
//       ),
//       centerTitle: false,
//       actions: isDesktop
//           ? _sections.map((section) => _buildNavItem(section)).toList()
//           : [
//               IconButton(
//                 icon: const Icon(Icons.menu, color: Colors.white),
//                 onPressed: () {
//                   _showPopupMenu(context);
//                 },
//               ),
//             ],
//     );
//   }

//   Widget _buildNavItem(String section) {
//     return MouseRegion(
//       onEnter: (_) {
//         setState(() {
//           _hoverStates[section] = true;
//         });
//       },
//       onExit: (_) {
//         setState(() {
//           _hoverStates[section] = false;
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Transform.translate(
//               offset: _hoverStates[section] == true
//                   ? const Offset(0, -5)
//                   : const Offset(0, 0),
//               child: TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   section,
//                   style: GoogleFonts.merienda(
//                     textStyle: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             if (_hoverStates[section] == true)
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 height: 2,
//                 color: Colors.purple,
//                 width: _calculateWidthForSection(section),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   double _calculateWidthForSection(String section) {
//     TextPainter textPainter = TextPainter(
//       text: TextSpan(
//         text: section,
//         style: GoogleFonts.merienda(
//             textStyle: const TextStyle(color: Colors.white)),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     return textPainter.width;
//   }

//   void _showPopupMenu(BuildContext context) {
//     showMenu(
//       context: context,
//       position: const RelativeRect.fromLTRB(100, 80, 20, 20),
//       items: _sections
//           .map(
//             (section) => PopupMenuItem<String>(
//               value: section,
//               child: Text(
//                 section,
//                 style: GoogleFonts.merienda(
//                   textStyle: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//             ),
//           )
//           .toList(),
//     ).then((selectedSection) {
//       if (selectedSection != null) {
//         // Handle navigation on selection
//       }
//     });
//   }
// }







// // File: components/navigation_bar.dart
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NavBar extends StatefulWidget {
//   const NavBar({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _NavBarState createState() => _NavBarState();
// }

// class _NavBarState extends State<NavBar> {
//   // Track hover state for each section (specific to each nav item)
//   final Map<String, bool> _hoverStates = {};
//   bool _isHoveredOnTitle = false; // Track hover state for title text

//   // Sections for Navbar
//   final List<String> _sections = [
//     'Intro',
//     'Skills',
//     'Projects',
//     'Internships',
//     'About me',
//     'Contact'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       title: Row(
//         children: [
//           // Title with Hover Effect
//           MouseRegion(
//             onEnter: (_) {
//               setState(() {
//                 _isHoveredOnTitle = true; // When mouse enters the title
//               });
//             },
//             onExit: (_) {
//               setState(() {
//                 _isHoveredOnTitle = false; // When mouse exits the title
//               });
//             },
//             child: Text(
//               'Fenrir Flameborn',
//               style: GoogleFonts.shantellSans(
//                 textStyle: const TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//           // Image shown on hover over the title text
//           AnimatedOpacity(
//             opacity: _isHoveredOnTitle ? 1.0 : 0.0, // Show when hovered
//             duration: const Duration(milliseconds: 300),
//             child: _isHoveredOnTitle
//                 ? Padding(
//                     padding: const EdgeInsets.only(left: 16.0),
//                     child: Image.asset(
//                       'assets/fenrir.jpg', // Make sure the image exists in assets
//                       width: 30,
//                       height: 30,
//                     ),
//                   )
//                 : Container(),
//           ),
//         ],
//       ),
//       actions: _sections
//           .map(
//             (section) => _buildNavItem(section), // Generate for each item
//           )
//           .toList(),
//     );
//   }

//   // Builds each nav item with hover effect
//   Widget _buildNavItem(String section) {
//     return MouseRegion(
//       onEnter: (_) {
//         setState(() {
//           _hoverStates[section] = true; // Mark section as hovered
//         });
//       },
//       onExit: (_) {
//         setState(() {
//           _hoverStates[section] = false; // Reset when mouse exits
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//         child: Column(
//           children: [
//             Transform.translate(
//               offset: _hoverStates[section] == true
//                   ? const Offset(0, -5) // Move the hovered item up
//                   : const Offset(0, 0),
//               child: TextButton(
//                 onPressed: () {},
//                 child: Text(
//                   section,
//                   style: GoogleFonts.merienda(
//                     textStyle: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             // Only show the purple line under the hovered item
//             if (_hoverStates[section] == true)
//               AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 height: 2,
//                 color: Colors.purple,
//                 width: _calculateWidthForSection(section),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Dynamically calculate the width of the line based on the text length
//   double _calculateWidthForSection(String section) {
//     TextPainter textPainter = TextPainter(
//       text: TextSpan(
//         text: section,
//         style: GoogleFonts.merienda(textStyle: TextStyle(color: Colors.white)),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout();
//     return textPainter.width;
//   }
// }
