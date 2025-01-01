import 'package:flutter/material.dart';

class ColorShiftAnimation extends StatefulWidget {
  const ColorShiftAnimation({super.key});

  @override
  State<ColorShiftAnimation> createState() => _ColorShiftAnimationState();
}

class _ColorShiftAnimationState extends State<ColorShiftAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _color = ColorTween(
      begin: Colors.red,
      end: Colors.blue,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Shift Animation')),
      body: Center(
        child: AnimatedBuilder(
          animation: _color,
          builder: (context, child) {
            return Icon(
              Icons.color_lens,
              size: 100,
              color: _color.value,
            );
          },
        ),
      ),
    );
  }
}
