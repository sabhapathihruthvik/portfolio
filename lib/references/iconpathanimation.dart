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
          child: IconPathAnimation(),
        ),
      ),
    );
  }
}

class IconPathAnimation extends StatefulWidget {
  const IconPathAnimation({super.key});

  @override
  _IconPathAnimationState createState() => _IconPathAnimationState();
}

class _IconPathAnimationState extends State<IconPathAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _positionAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    // Creating position animation using a tween sequence for a smooth curved path
    _positionAnimation = TweenSequence<RelativeRect>([
      TweenSequenceItem(
        tween: Tween<RelativeRect>(
          begin: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
          end: const RelativeRect.fromLTRB(200.0, 200.0, 0.0, 0.0),
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween<RelativeRect>(
          begin: const RelativeRect.fromLTRB(200.0, 200.0, 0.0, 0.0),
          end: const RelativeRect.fromLTRB(0.0, 400.0, 0.0, 0.0),
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: Tween<RelativeRect>(
          begin: const RelativeRect.fromLTRB(0.0, 400.0, 0.0, 0.0),
          end: const RelativeRect.fromLTRB(200.0, 600.0, 0.0, 0.0),
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1.0,
      ),
    ]).animate(_controller);

    // Rotational animation to make the icon rotate while following the path
    _rotationAnimation = Tween<double>(begin: 0.0, end: 2 * 3.1415).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _controller.repeat(); // Repeat the animation indefinitely
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PositionedTransition(
          rect: _positionAnimation,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationAnimation.value, // Apply the rotation
                child: const Icon(
                  Icons.star,
                  size: 50.0,
                  color: Colors.amber,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
