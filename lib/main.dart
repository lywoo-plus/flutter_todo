import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

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
            FloatingActionButton(
              onPressed: () => {
                setState(() {
                  counter++;
                }),
              },
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => {
                setState(() {
                  counter--;
                }),
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
        body: Center(child: Text('Counter: ' + counter.toString(), style: TextStyle(fontSize: 24))),
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          onDestinationSelected: (index) {
            print(index);
          },
        ),
      ),
    );
  }
}
