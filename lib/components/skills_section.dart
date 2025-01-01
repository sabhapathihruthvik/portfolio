// File: components/skills_section.dart
import 'package:flutter/material.dart';
import 'package:pft2/components/tech_list.dart';
import 'tech_list_item.dart'; // Import the tech list item component

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0), // Add space between sections
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center align the children
        children: [
          // Section Title - Centered
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Text(
              'Skills / Tech Stack',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'PatrickHand', // Unique quirky font
              ),
            ),
          ),

          // Gap between the title and the icons
          const SizedBox(height: 20),

          // Center the Tech Icons with a flexible number of icons per row (4 to 8 icons max)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate the max number of icons based on screen size (4 to 8 icons)
                double maxWidth = constraints.maxWidth;
                int maxIconsPerRow =
                    maxWidth > 600 ? 8 : 4; // Allow 8 icons for wider screens
                double iconSize = maxWidth / maxIconsPerRow;

                return Wrap(
                  spacing: 5.0, // Space between icons horizontally
                  runSpacing: 5.0, // Space between icons vertically
                  alignment: WrapAlignment.center, // Center icons in each row
                  children: techList
                      .map<Widget>((tech) => SizedBox(
                            width: iconSize,
                            child: TechListItem(tech: tech),
                          ))
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
