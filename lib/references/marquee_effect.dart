import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MarqueeApp());
}

class MarqueeApp extends StatelessWidget {
  const MarqueeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scaffold(
        backgroundColor: Colors.black87,
        body: MarqueeEffect(),
      ),
    );
  }
}

class MarqueeEffect extends StatefulWidget {
  const MarqueeEffect({super.key});

  @override
  _MarqueeEffectState createState() => _MarqueeEffectState();
}

class _MarqueeEffectState extends State<MarqueeEffect>
    with SingleTickerProviderStateMixin {
  final List<Map<String, String>> techList = [
    {"name": "Flutter", "image": "assets/tech_icons/flutter.svg"},
    {"name": "Django", "image": "assets/tech_icons/django.svg"},
    {"name": "Flask", "image": "assets/tech_icons/flask.svg"},
  ];

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    Future.delayed(Duration.zero, () async {
      while (true) {
        await Future.delayed(const Duration(milliseconds: 50));
        if (_scrollController.hasClients) {
          setState(() {
            _scrollPosition += 2;
          });

          if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
            _scrollPosition = _scrollController.position.minScrollExtent;
          }

          _scrollController.jumpTo(_scrollPosition);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      height: 120, // Set a fixed height for the marquee area
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: techList.length * 10, // To repeat icons
        itemBuilder: (context, index) {
          final actualIndex = index % techList.length;
          final tech = techList[actualIndex];
          return AnimatedTile(
            name: tech['name']!,
            imageUrl: tech['image']!,
          );
        },
      ),
    );
  }
}

class AnimatedTile extends StatefulWidget {
  final String name;
  final String imageUrl;

  const AnimatedTile({super.key, required this.name, required this.imageUrl});

  @override
  _AnimatedTileState createState() => _AnimatedTileState();
}

class _AnimatedTileState extends State<AnimatedTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(0, _isHovered ? -10 : 0, 0),
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Card(
          elevation: _isHovered ? 8 : 3,
          shadowColor: _isHovered
              ? const Color.fromARGB(255, 70, 70, 70)
              : Colors.black45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: const Color.fromARGB(255, 20, 20, 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                SizedBox(
                  height: 75,
                  width: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      widget.imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: _isHovered ? Colors.blue.shade300 : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
