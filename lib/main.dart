import 'package:flutter/material.dart';
import 'package:flutter_todo/data/notifier.dart';
import 'package:flutter_todo/views/pages/welcome_page.dart';
import 'package:flutter_todo/widgets/nav_bar.dart';

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
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: .fromSeed(seedColor: Colors.pink, brightness: themeNotifier.value),
          ),
          home: true
              ? WelcomePage()
              : Scaffold(
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
                  bottomNavigationBar: NavBar(),
                ),
        );
      },
    );
  }
}
