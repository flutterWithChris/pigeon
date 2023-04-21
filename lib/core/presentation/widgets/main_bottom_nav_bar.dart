import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  static int index = 0;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: index,
      margin: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 10),
      onTap: (i) {
        switch (i) {
          case 0:
            context.go('/');
            setState(() {
              index = 0;
            });
            break;
          case 1:
            // context.push('/compose-email');
            setState(() {
              index = 1;
            });
            break;
          case 2:
            context.go('/settings');

            setState(() {
              index = 2;
            });
            break;
        }
      },
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: SizedBox.square(
            dimension: 24,
            child: Image.asset(
              'assets/icons/main/inbox_icon.png',
              fit: BoxFit.contain,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : const Color(0xff435369),
            ),
          ),
          title: Text(
            'Inbox',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : null,
            ),
          ),
          selectedColor: Colors.purple,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: Icon(
            Icons.analytics_outlined,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : null,
          ),
          title: Text(
            'Stats',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : null,
            ),
          ),
          selectedColor: Colors.pink,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: Icon(
            Icons.settings_outlined,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : null,
          ),
          title: Text(
            'Settings',
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : null,
            ),
          ),
          selectedColor: Colors.orange,
        ),
      ],
    );
  }
}
