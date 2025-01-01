import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TypewriterDemo(),
    );
  }
}

class TypewriterDemo extends StatelessWidget {
  const TypewriterDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typewriter Effect Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "1. Slow Typing Effect:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    "Static Text: ",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'This is slow typing...',
                        textStyle: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.blue,
                        ),
                        speed: const Duration(milliseconds: 200),
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "2. Fast Typing Effect:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    "Static Text: ",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'This is fast typing...',
                        textStyle: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.green,
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "3. Typewriter with Pause Between Words:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    "Static Text: ",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Typing... with pause...',
                        textStyle: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.red,
                        ),
                        speed: const Duration(milliseconds: 100),
                        cursor: '|',
                      ),
                    ],
                    pause: const Duration(milliseconds: 500),
                    isRepeatingAnimation: true,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "4. Infinite Typewriter Effect:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Text(
                    "Static Text: ",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'This will keep typing forever!',
                        textStyle: const TextStyle(
                          fontSize: 24.0,
                          color: Colors.purple,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
