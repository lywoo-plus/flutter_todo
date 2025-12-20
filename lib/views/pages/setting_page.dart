import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  final String title;

  const SettingPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting ' + title),
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Center(child: Text('Setting page')),
    );
  }
}
