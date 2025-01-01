import 'dart:ui';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/a.jpg'), fit: BoxFit.cover)),
        child: const Center(child: GlassBox()),
      ),
    );
  }
}

class GlassBox extends StatefulWidget {
  const GlassBox({super.key});

  @override
  State<GlassBox> createState() => _GlassBoxState();
}

class _GlassBoxState extends State<GlassBox> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Stack(
          children: [
            //blureffect
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.1)
                      ])),
            ),
            const Center(
                child: Text(
              'Hello',
              style: TextStyle(color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
