import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        children: [
          CircleAvatar(radius: 60, backgroundImage: AssetImage('assets/images/nuxt.png')),
          LayoutBuilder(
            builder: (context, constraints) {
              return FractionallySizedBox(
                widthFactor: constraints.maxWidth > 100 ? 1 : 0.5,
                child: Container(
                  margin: .all(8),
                  padding: .all(4),
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text('Lywoo'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
