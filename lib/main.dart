import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink, brightness: Brightness.dark),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Todo')),
        drawer: Drawer(
          child: SafeArea(child: ListTile(title: Text('Settings'))),
        ),
        floatingActionButton: Column(
          spacing: 16,
          mainAxisSize: .min,
          children: [
            FloatingActionButton(onPressed: () => {print('click')}, child: Icon(Icons.add)),
            FloatingActionButton(onPressed: () => {print('click')}, child: Icon(Icons.add)),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          onDestinationSelected: (v) {
            print(v);
          },
        ),
      ),
    );
  }
}
