import 'package:flutter/material.dart';
import 'package:flutter_todo/views/widget_tree.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: .center,
        spacing: 8,
        children: [
          Text('Welcome page', style: Theme.of(context).textTheme.headlineMedium),
          Padding(
            padding: .all(16.0),
            child: ClipRRect(borderRadius: .circular(16), child: Image.asset('assets/images/nuxt.png')),
          ),
          FilledButton.icon(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WidgetTree()));
            },
            label: Text('Login'),
            icon: Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
