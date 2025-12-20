import 'package:flutter/material.dart';

void pushReplacement({required BuildContext context, required Widget page}) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}
