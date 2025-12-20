import 'package:flutter/material.dart';
import 'package:flutter_todo/data/notifier.dart';
import 'package:flutter_todo/views/pages/home_page.dart';
import 'package:flutter_todo/views/pages/profile_page.dart';
import 'package:flutter_todo/views/pages/setting_page.dart';
import 'package:flutter_todo/widgets/nav_bar.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Todo'),
        actions: [
          IconButton(
            onPressed: () {
              themeNotifier.value = themeNotifier.value == Brightness.light ? Brightness.dark : Brightness.light;
            },
            icon: ValueListenableBuilder(
              valueListenable: themeNotifier,
              builder: (context, value, child) {
                return Icon(value == Brightness.light ? Icons.dark_mode : Icons.light_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingPage(title: 'Page')));
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return pages.elementAt(value);
        },
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
