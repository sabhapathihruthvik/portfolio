import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomBackgroundExample(),
    );
  }
}

class CustomBackgroundExample extends StatelessWidget {
  const CustomBackgroundExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left 2/3 section: Black
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black,
            ),
          ),
          // Right 1/3 section: Green
          Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromARGB(218, 22, 166, 27),
            ),
          ),
        ],
      ),
    );
  }
}
