// File: components/drawer_menu.dart
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final List<String> _sections = [
    'Intro',
    'Skills',
    'Projects',
    'Internships',
    'About me',
    'Contact'
  ];

  DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: _sections
            .map(
              (section) => ListTile(
                title: Text(section),
                onTap: () {},
              ),
            )
            .toList(),
      ),
    );
  }
}
