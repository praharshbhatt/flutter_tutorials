import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_example/screens/logged_in_screen.dart';
import 'package:flutter_login_example/screens/login_page.dart';
import 'package:flutter_login_example/services/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthService authService = new AuthService();
  FirebaseUser user;
  bool isLoaded = false;

  initState() {
    isSignedIn();

    super.initState();
  }

  isSignedIn() async {
    user = await authService.isSignedIn();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: isLoaded ? user != null ? LoggedInScreen(user, authService) : LoginPage(authService) : splashScreen(),
    );
  }

  splashScreen() {
    return Container(
      color: Colors.white,
      child: Center(
        child: FlutterLogo(
          size: 150,
        ),
      ),
    );
  }
}
