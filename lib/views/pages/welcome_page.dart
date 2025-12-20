import 'package:flutter/material.dart';
import 'package:flutter_todo/util.dart';
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
          Text('Welcome', style: Theme.of(context).textTheme.headlineMedium),
          Hero(
            tag: 'logo',
            child: Padding(
              padding: .all(16.0),
              child: ClipRRect(borderRadius: .circular(16), child: Image.asset('assets/images/nuxt.png')),
            ),
          ),
          FilledButton.icon(
            onPressed: () {
              pushReplacement(context: context, page: WidgetTree());
            },
            label: Text('Login'),
            icon: Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
