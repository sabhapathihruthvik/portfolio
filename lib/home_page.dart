import 'package:flutter/material.dart';
import 'package:pft2/components/skills_section.dart';
import 'components/intro_section.dart';
import 'components/background_rive.dart';
import 'components/drawer_menu.dart';
import 'components/navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MediaQuery.of(context).size.width > 800
          ? const PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: NavBar(),
            )
          : null,
      drawer: MediaQuery.of(context).size.width <= 800 ? DrawerMenu() : null,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Set minimum width of the layout to the width of a mobile device
          const minWidth =
              320.0; // Set the minimum width here (can be adjusted)
          return ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth < minWidth
                  ? minWidth // Keep mobile width or greater as the min width
                  : constraints.maxWidth,
            ),
            child: const Stack(
              children: [
                BackgroundRive(),
                Padding(
                  padding: EdgeInsets.only(top: 70), // Ensure it’s below NavBar
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        IntroSection(),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                        ),
                        SkillsSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


// // File: home_page.dart
// import 'package:flutter/material.dart';
// import 'package:pft2/components/skills_section.dart';
// import 'components/intro_section.dart';
// import 'components/background_rive.dart';
// import 'components/drawer_menu.dart';
// import 'components/navigation_bar.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: MediaQuery.of(context).size.width > 800
//           ? const PreferredSize(
//               preferredSize: Size.fromHeight(70),
//               child: NavBar(),
//             )
//           : null,
//       drawer: MediaQuery.of(context).size.width <= 800 ? DrawerMenu() : null,
//       body: const Stack(
//         children: [
//           BackgroundRive(),
//           Padding(
//             padding: EdgeInsets.only(top: 70), // Ensure it’s below NavBar
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   IntroSection(),
//                   SizedBox(
//                     height: 50,
//                     width: double.infinity,
//                   ),
//                   SkillsSection(),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
