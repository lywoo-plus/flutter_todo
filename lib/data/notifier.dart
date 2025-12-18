import 'package:flutter/widgets.dart';

ValueNotifier<int> selectedPageNotifier = ValueNotifier(0);

enum EnumTheme { light, dark }

ValueNotifier<EnumTheme> themeNotifier = ValueNotifier(EnumTheme.light);
