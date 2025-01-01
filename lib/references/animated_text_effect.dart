import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedTextDemo(),
    );
  }
}

class AnimatedTextDemo extends StatelessWidget {
  const AnimatedTextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Text Kit Demo'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('1. Fade Animated Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            AnimatedTextKit(
              animatedTexts: [
                FadeAnimatedText('Fade In Text 1'),
                FadeAnimatedText('Fade In Text 2'),
                FadeAnimatedText('Fade In Text 3'),
              ],
              repeatForever: true,
            ),
            const SizedBox(height: 20),
            const Text('2. Typer Animated Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Typing Effect 1'),
                TyperAnimatedText('Typing Effect 2'),
                TyperAnimatedText('Typing Effect 3'),
              ],
              repeatForever: true,
            ),
            const SizedBox(height: 20),
            const Text('3. Typewriter Animated Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Typewriter Text 1'),
                TypewriterAnimatedText('Typewriter Text 2'),
                TypewriterAnimatedText('Typewriter Text 3'),
              ],
              repeatForever: true,
            ),
            const SizedBox(height: 20),
            const Text('4. Scale Animated Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            AnimatedTextKit(
              animatedTexts: [
                ScaleAnimatedText('Scaling Text 1'),
                ScaleAnimatedText('Scaling Text 2'),
                ScaleAnimatedText('Scaling Text 3'),
              ],
              repeatForever: true,
            ),
            const SizedBox(height: 20),
            const Text('5. Rotate Animated Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            AnimatedTextKit(
              animatedTexts: [
                RotateAnimatedText('Rotating Text 1'),
                RotateAnimatedText('Rotating Text 2'),
                RotateAnimatedText('Rotating Text 3'),
              ],
              repeatForever: true,
            ),
            const SizedBox(height: 20),
            const Text('6. Wavy Animated Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Wavy Text 1'),
                WavyAnimatedText('Wavy Text 2'),
                WavyAnimatedText('Wavy Text 3'),
              ],
              repeatForever: true,
            ),
            const SizedBox(height: 20),
            const Text('7. Flicker Animated Text',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            AnimatedTextKit(
              animatedTexts: [
                FlickerAnimatedText('Flicker Text 1'),
                FlickerAnimatedText('Flicker Text 2'),
                FlickerAnimatedText('Flicker Text 3'),
              ],
              repeatForever: true,
            ),
          ],
        ),
      ),
    );
  }
}
