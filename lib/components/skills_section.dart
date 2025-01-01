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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
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
          // Grid of Tech Icons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Wrap(
              spacing: 20.0, // Space between icons
              runSpacing: 20.0, // Space between rows
              children: techList
                  .map<Widget>((tech) => TechListItem(tech: tech))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
