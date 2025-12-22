import 'package:flutter/material.dart';
import 'package:flutter_todo/util.dart';
import 'package:flutter_todo/views/widget_tree.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({super.key, required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: 'admin');
  TextEditingController passwordController = TextEditingController(text: 'admin');

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title.toUpperCase())),
      body: Center(
        child: SingleChildScrollView(
          padding: .all(16),
          child: Column(
            spacing: 16,
            mainAxisAlignment: .center,
            crossAxisAlignment: .stretch,
            children: [
              Lottie.asset('assets/lotties/city_building.json'),
              Text('Text: ${emailController.text}'),
              TextField(
                autofocus: true,
                controller: emailController,
                decoration: InputDecoration(hintText: 'Email', border: OutlineInputBorder()),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'Password', border: OutlineInputBorder()),
              ),
              FilledButton(
                onPressed: () {
                  if (emailController.text == 'admin' && passwordController.text == 'admin') {
                    pushAndRemoveUntil(context: context, page: WidgetTree());
                  }
                },
                child: Text(widget.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
