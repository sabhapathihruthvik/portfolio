import 'dart:ui';
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
    {"name": "Flutter", "image": "assets/tech_icons/flutterio.svg"},
    {"name": "Django", "image": "assets/tech_icons/django.svg"},
    {"name": "Flask", "image": "assets/tech_icons/flask.svg"},
    {"name": "Dart", "image": "assets/tech_icons/dartlang.svg"},
    {"name": "Docker", "image": "assets/tech_icons/docker.svg"},
    {"name": "Figma", "image": "assets/tech_icons/figma.svg"},
    {"name": "Firebase", "image": "assets/tech_icons/firebase.svg"},
    {"name": "Bootstrap", "image": "assets/tech_icons/getbootstrap.svg"},
    {"name": "Git", "image": "assets/tech_icons/git.svg"},
    {"name": "HTML5", "image": "assets/tech_icons/html5.svg"},
    {"name": "Java", "image": "assets/tech_icons/java.svg"},
    {"name": "JavaScript", "image": "assets/tech_icons/javascript.svg"},
    {"name": "Jenkins", "image": "assets/tech_icons/jenkins.svg"},
    {"name": "Kubernetes", "image": "assets/tech_icons/kubernetes.svg"},
    {"name": "Linux", "image": "assets/tech_icons/linux.svg"},
    {"name": "MongoDB", "image": "assets/tech_icons/mongodb.svg"},
    {"name": "MySQL", "image": "assets/tech_icons/mysql.svg"},
    {"name": "OpenCV", "image": "assets/tech_icons/opencv.svg"},
    {"name": "Python", "image": "assets/tech_icons/python.svg"},
    {"name": "SQLite", "image": "assets/tech_icons/sqlite.svg"},
    {"name": "Supabase", "image": "assets/tech_icons/supabase.svg"},
    {"name": "TensorFlow", "image": "assets/tech_icons/tensorflow.svg"}
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
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          padding: const EdgeInsets.symmetric(),
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
        ),
      ],
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  width: 180,
                  height: 100,
                  color: Colors.transparent,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.white.withOpacity(0.1),
                    ],
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 75,
                        width: 75,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            widget.imageUrl,
                            fit: BoxFit.cover,
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
                            color: _isHovered
                                ? Colors.blue.shade300
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
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



// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// void main() {
//   runApp(const MarqueeApp());
// }

// class MarqueeApp extends StatelessWidget {
//   const MarqueeApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark(),
//       home: const Scaffold(
//         backgroundColor: Colors.black87,
//         body: MarqueeEffect(),
//       ),
//     );
//   }
// }

// class MarqueeEffect extends StatefulWidget {
//   const MarqueeEffect({super.key});

//   @override
//   _MarqueeEffectState createState() => _MarqueeEffectState();
// }

// class _MarqueeEffectState extends State<MarqueeEffect>
//     with SingleTickerProviderStateMixin {
//   final List<Map<String, String>> techList = [
//     {"name": "Flutter", "image": "assets/tech_icons/flutter.svg"},
//     {"name": "Django", "image": "assets/tech_icons/django.svg"},
//     {"name": "Flask", "image": "assets/tech_icons/flask.svg"},
//   ];

//   final ScrollController _scrollController = ScrollController();
//   double _scrollPosition = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _startScrolling();
//     });
//   }

//   void _startScrolling() {
//     Future.delayed(Duration.zero, () async {
//       while (true) {
//         await Future.delayed(const Duration(milliseconds: 50));
//         if (_scrollController.hasClients) {
//           setState(() {
//             _scrollPosition += 2;
//           });

//           if (_scrollPosition >= _scrollController.position.maxScrollExtent) {
//             _scrollPosition = _scrollController.position.minScrollExtent;
//           }

//           _scrollController.jumpTo(_scrollPosition);
//         }
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       height: 120, // Set a fixed height for the marquee area
//       child: ListView.builder(
//         controller: _scrollController,
//         scrollDirection: Axis.horizontal,
//         itemCount: techList.length * 10, // To repeat icons
//         itemBuilder: (context, index) {
//           final actualIndex = index % techList.length;
//           final tech = techList[actualIndex];
//           return AnimatedTile(
//             name: tech['name']!,
//             imageUrl: tech['image']!,
//           );
//         },
//       ),
//     );
//   }
// }

// class AnimatedTile extends StatefulWidget {
//   final String name;
//   final String imageUrl;

//   const AnimatedTile({super.key, required this.name, required this.imageUrl});

//   @override
//   _AnimatedTileState createState() => _AnimatedTileState();
// }

// class _AnimatedTileState extends State<AnimatedTile> {
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeInOut,
//         transform: Matrix4.translationValues(0, _isHovered ? -10 : 0, 0),
//         margin: const EdgeInsets.symmetric(horizontal: 12.0),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Stack(
//             children: [
//               BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                 child: Container(
//                   width: 180,
//                   height: 100,
//                   color: Colors.transparent,
//                 ),
//               ),
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.white.withOpacity(0.5)),
//                   borderRadius: BorderRadius.circular(15),
//                   gradient: LinearGradient(
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                     colors: [
//                       Colors.white.withOpacity(0.3),
//                       Colors.white.withOpacity(0.1),
//                     ],
//                   ),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         height: 75,
//                         width: 75,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: SvgPicture.asset(
//                             widget.imageUrl,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Text(
//                           widget.name,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: _isHovered
//                                 ? Colors.blue.shade300
//                                 : Colors.white,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
