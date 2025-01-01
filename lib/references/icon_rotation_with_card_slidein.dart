import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HoverCardDemo(),
    );
  }
}

class HoverCardDemo extends StatefulWidget {
  const HoverCardDemo({super.key});

  @override
  _HoverCardDemoState createState() => _HoverCardDemoState();
}

class _HoverCardDemoState extends State<HoverCardDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hover Animation Demo')),
      body: Center(
        child: MouseRegion(
          onEnter: (_) {
            _controller.forward();
            setState(() => _isHovered = true);
          },
          onExit: (_) {
            _controller.reverse();
            setState(() => _isHovered = false);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _rotationAnimation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value * 2 * 3.141592,
                    child: Icon(
                      Icons.star,
                      size: 50,
                      color: _isHovered ? Colors.blue : Colors.grey,
                    ),
                  );
                },
              ),
              const SizedBox(width: 20),
              AnimatedOpacity(
                opacity: _isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.blue.shade100,
                  child: const Text(
                    'This is an animated text card!',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
