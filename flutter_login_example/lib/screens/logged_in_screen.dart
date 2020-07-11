import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_example/services/auth_service.dart';

import 'login_page.dart';

class LoggedInScreen extends StatefulWidget {
  FirebaseUser user;
  AuthService authService;

  LoggedInScreen(this.user, this.authService);

  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //Profile picture
          Image.network(
            widget.user.photoUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
          ),

          //Name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.user.displayName,
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
          ),

          //Email
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.user.email,
              style: TextStyle(fontSize: 22, color: Colors.grey),
            ),
          ),

          SizedBox(height: 50),

          //Sign out button
          _signOutButton(widget.authService, context),
        ],
      ),
    );
  }
}

_signOutButton(AuthService authService, BuildContext context) {
  return OutlineButton(
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      borderSide: BorderSide(color: Colors.grey),
      highlightElevation: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Sign Out",
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ),
      ),
      onPressed: () async {
        //Login here
        await authService.signOutWithGoogle();

        //Pop this screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginPage(authService)));
      });
}
