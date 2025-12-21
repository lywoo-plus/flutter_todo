import 'package:flutter/material.dart';
import 'package:flutter_todo/util.dart';
import 'package:flutter_todo/views/widget_tree.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: .none,
          alignment: .center,
          children: [
            Hero(
              tag: 'logo',
              child: Padding(padding: .all(16.0), child: Lottie.asset('assets/lotties/city_building.json')),
            ),

            FittedBox(
              child: Text(
                'Welcome'.toUpperCase(),
                textAlign: .center,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  letterSpacing: 50,
                  fontWeight: .w900,
                  foreground: Paint()
                    ..style = .stroke
                    ..strokeWidth = 4
                    ..color = Colors.black,
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: .all(8.0),
                child: FilledButton.icon(
                  onPressed: () {
                    pushReplacement(context: context, page: WidgetTree());
                  },
                  label: Text('Login'),
                  icon: Icon(Icons.login),
                  style: FilledButton.styleFrom(padding: .all(16), minimumSize: Size(.infinity, 0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
