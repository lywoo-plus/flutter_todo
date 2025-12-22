import 'package:flutter/material.dart';
import 'package:flutter_todo/util.dart';
import 'package:flutter_todo/views/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: .all(16),
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .stretch,
            spacing: 8,
            children: [
              Stack(
                clipBehavior: .none,
                alignment: .center,
                children: [
                  Hero(tag: 'logo', child: Lottie.asset('assets/lotties/city_building.json')),

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
                ],
              ),

              FilledButton.icon(
                onPressed: () {
                  pushPage(
                    context: context,
                    page: LoginPage(title: 'Login'),
                  );
                },
                label: Text('Login'),
                icon: Icon(Icons.login),
                style: FilledButton.styleFrom(padding: .all(8), minimumSize: Size(.infinity, 0)),
              ),

              FilledButton.icon(
                onPressed: () {
                  pushPage(
                    context: context,
                    page: LoginPage(title: 'Register'),
                  );
                },
                label: Text('Register'),
                icon: Icon(Icons.person_add),
                style: FilledButton.styleFrom(padding: .all(8), minimumSize: Size(.infinity, 0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
