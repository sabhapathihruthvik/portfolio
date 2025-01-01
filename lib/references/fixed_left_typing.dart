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
      home: FixedLeftTypingEffect(),
    );
  }
}

class FixedLeftTypingEffect extends StatefulWidget {
  const FixedLeftTypingEffect({super.key});

  @override
  _FixedLeftTypingEffectState createState() => _FixedLeftTypingEffectState();
}

class _FixedLeftTypingEffectState extends State<FixedLeftTypingEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _typingAnimation;
  final String prefixText = "Static Text: ";
  final String animatedText = "Typing and erasing from the right!";

  String displayText = "";

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );

    // Define the typing animation range
    _typingAnimation = IntTween(
      begin: 0,
      end: 2 * animatedText.length,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Add a listener to update the state as the animation progresses
    _controller.addListener(() {
      setState(() {
        int currentIndex = _typingAnimation.value;

        if (currentIndex <= animatedText.length) {
          // Typing phase
          displayText = animatedText.substring(0, currentIndex);
        } else {
          // Erasing phase
          int eraseIndex = 2 * animatedText.length - currentIndex;
          displayText = animatedText.substring(0, eraseIndex);
        }
      });
    });

    // Repeat animation infinitely
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fixed Left Typing Effect'),
      ),
      body: Center(
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 24.0, color: Colors.black),
            children: [
              TextSpan(
                text: prefixText,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: displayText,
                style: const TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
