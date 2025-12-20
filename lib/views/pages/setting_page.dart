import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting page'),
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: Center(child: Text('Setting page')),
    );
  }
}
