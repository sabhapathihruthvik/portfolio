// File: components/background_rive.dart
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BackgroundRive extends StatelessWidget {
  const BackgroundRive({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(
      child: RiveAnimation.asset(
        'assets/space_coffee.riv',
        fit: BoxFit.cover,
      ),
    );
  }
}
