import 'package:flutter/material.dart';
import 'package:flutter_todo/data/notifier.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, value, child) {
        return NavigationBar(
          selectedIndex: value,
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          onDestinationSelected: (index) {
            selectedPageNotifier.value = index;
          },
        );
      },
    );
  }
}
