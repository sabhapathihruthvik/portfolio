import 'package:flutter/material.dart';

class SlideInAnimation extends StatefulWidget {
  const SlideInAnimation({super.key});

  @override
  State<SlideInAnimation> createState() => _SlideInAnimationState();
}

class _SlideInAnimationState extends State<SlideInAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _slide = Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slide-In Animation')),
      body: Center(
        child: SlideTransition(
          position: _slide,
          child: const Icon(Icons.slideshow, size: 100, color: Colors.teal),
        ),
      ),
    );
  }
}
