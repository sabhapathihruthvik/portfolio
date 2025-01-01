import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IconEffects(),
        ),
      ),
    );
  }
}

class IconEffects extends StatefulWidget {
  const IconEffects({super.key});

  @override
  _IconEffectsState createState() => _IconEffectsState();
}

class _IconEffectsState extends State<IconEffects> {
  double _elevation = 2.0;
  double _scale = 1.0;
  double _rotation = 0.0;
  double _size = 50.0; // Size for blob effect
  Color _glowColor = Colors.transparent;

  void _onHover(bool isHovering) {
    setState(() {
      if (isHovering) {
        _elevation = 12.0; // Elevate icon
        _scale = 1.2; // Grow icon for float and blob effect
        _rotation = 0.1; // Rotation for flip animation
        _glowColor = Colors.blue.withOpacity(0.5); // Glow effect
        _size = 55.0; // Increase size for blob effect
      } else {
        _elevation = 2.0; // Reset elevation
        _scale = 1.0; // Reset size
        _rotation = 0.0; // Reset rotation
        _glowColor = Colors.transparent; // No glow when not hovering
        _size = 50.0; // Reset size
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _glowColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: _elevation,
              offset: Offset(0, _elevation),
            ),
          ],
        ),
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(_rotation),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              Icons.star,
              color: Colors.yellow,
              size:
                  _size * _scale, // Adjust size based on scale and blob effect
            ),
          ),
        ),
      ),
    );
  }
}
