import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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

class _IconEffectsState extends State<IconEffects>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipAnimation;
  Color _glowColor = Colors.transparent;
  double _size = 50.0; // Default icon size

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _flipAnimation = Tween<double>(begin: 0, end: 3.14)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }

  void _onHover(bool isHovering) {
    setState(() {
      if (isHovering) {
        _controller.forward();
        _glowColor = Colors.blue.withOpacity(0.5); // Glow effect
        _size = 55.0; // Increase size slightly
      } else {
        _controller.reverse();
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
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(_flipAnimation.value), // Flip effect
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: _size, // Adjust size for slight expansion on hover
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
