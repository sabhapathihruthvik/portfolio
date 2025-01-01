import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TechListItem extends StatefulWidget {
  final Map<String, String> tech;

  const TechListItem({super.key, required this.tech});

  @override
  _TechListItemState createState() => _TechListItemState();
}

class _TechListItemState extends State<TechListItem> {
  bool isHovered = false;
  final GlobalKey _key = GlobalKey();
  double iconPositionX = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allow overlap without clipping
      children: [
        MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true;
            });
            _updateIconPosition();
          },
          onExit: (_) {
            setState(() {
              isHovered = false;
            });
          },
          child: Column(
            children: [
              AnimatedContainer(
                key: _key,
                duration: Duration(milliseconds: 300),
                width: 80,
                height: 80,
                transform: Matrix4.rotationZ(isHovered ? 0.1 : 0),
                decoration: BoxDecoration(
                  boxShadow: isHovered
                      ? [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 8),
                            blurRadius: 15,
                          ),
                        ]
                      : [],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset(
                  widget.tech['image']!,
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(height: 10), // Space between icon and name
              Text(
                widget.tech['name']!,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),

        // Show the description card when hovering over the icon
        if (isHovered)
          Positioned(
            // Calculate horizontal position to avoid out-of-screen overflow
            top: -110, // Adjust this for desired card's vertical position
            left: iconPositionX < MediaQuery.of(context).size.width / 2
                ? 0 // Align left if on the left side
                : null, // Align right if on the right side
            right: iconPositionX >= MediaQuery.of(context).size.width / 2
                ? 0 // Align right for right side
                : null, // Align left if on the left side
            child: AnimatedOpacity(
              opacity: isHovered ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Material(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.tech['name']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.tech['description']!,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  void _updateIconPosition() {
    final RenderBox renderBox =
        _key.currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    setState(() {
      iconPositionX = position.dx; // Get the X position of the icon
    });
  }
}


// // File: components/tech_list_item.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart'; // For rendering SVG images

// class TechListItem extends StatelessWidget {
//   final Map<String, String> tech;

//   const TechListItem({super.key, required this.tech});

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) {
//         // Optionally, implement hover enter logic
//       },
//       onExit: (_) {
//         // Optionally, implement hover exit logic
//       },
//       child: Column(
//         children: [
//           // Tech Icon
//           SizedBox(
//             width: 80, // Set fixed size for icon
//             height: 80, // Set fixed size for icon
//             child: SvgPicture.asset(
//               tech['image']!,
//               width: 40, // Icon size
//               height: 40, // Icon size
//             ),
//           ),
//           const SizedBox(height: 10), // Space between icon and name
//           Text(
//             tech['name']!,
//             style: const TextStyle(color: Colors.white, fontSize: 16),
//           ),
//           // Hover effect - show description card on hover
//           // Using a simple method to show a tooltip or a card if required
//           MouseRegion(
//             onEnter: (_) {
//               showDialog(
//                 context: context,
//                 builder: (_) {
//                   return AlertDialog(
//                     backgroundColor: Colors.black87,
//                     title: Text(
//                       tech['name']!,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     content: Text(
//                       tech['description']!,
//                       style: const TextStyle(
//                         color: Colors.white70,
//                         fontSize: 14,
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//             onExit: (_) {
//               Navigator.of(context).pop(); // Close the dialog when mouse exits
//             },
//             child: const SizedBox(
//                 height: 60), // Invisible area just to act on hover
//           ),
//         ],
//       ),
//     );
//   }
// }
