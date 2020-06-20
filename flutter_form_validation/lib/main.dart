import 'package:flutter/material.dart';

import 'form_validation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Form Validation"),
        ),
        body: FormValidation(),
      ),
    );
  }
}
