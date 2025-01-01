// File: components/tech_list_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For rendering SVG images

class TechListItem extends StatelessWidget {
  final Map<String, String> tech;

  const TechListItem({super.key, required this.tech});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        // Optionally, implement hover enter logic
      },
      onExit: (_) {
        // Optionally, implement hover exit logic
      },
      child: Column(
        children: [
          // Tech Icon
          SizedBox(
            width: 80, // Set fixed size for icon
            height: 80, // Set fixed size for icon
            child: SvgPicture.asset(
              tech['image']!,
              width: 40, // Icon size
              height: 40, // Icon size
            ),
          ),
          const SizedBox(height: 10), // Space between icon and name
          Text(
            tech['name']!,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          // Hover effect - show description card on hover
          // Using a simple method to show a tooltip or a card if required
          MouseRegion(
            onEnter: (_) {
              showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    backgroundColor: Colors.black87,
                    title: Text(
                      tech['name']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Text(
                      tech['description']!,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  );
                },
              );
            },
            onExit: (_) {
              Navigator.of(context).pop(); // Close the dialog when mouse exits
            },
            child: const SizedBox(
                height: 60), // Invisible area just to act on hover
          ),
        ],
      ),
    );
  }
}
