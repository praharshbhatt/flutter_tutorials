import 'package:flutter/material.dart';
import 'package:flutterquoteapp/screens/splashscreen.dart';
import 'package:flutterquoteapp/utils/theme.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  ThemeData theme = getApplicationTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: SplashScreen(),
    );
  }
}
