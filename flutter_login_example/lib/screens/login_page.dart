import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_example/screens/logged_in_screen.dart';
import 'package:flutter_login_example/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  AuthService authService;

  LoginPage(this.authService);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(size: 150),
            SizedBox(height: 150),
            _signInButton(widget.authService, context, scaffoldKey),
          ],
        ),
      ),
    );
  }
}

_signInButton(AuthService authService, BuildContext context, GlobalKey scaffoldKey) {
  return OutlineButton(
      splashColor: Colors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      borderSide: BorderSide(color: Colors.grey),
      highlightElevation: 0,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Google Image
            Image.asset("assets/google_logo.png", height: 35),

            //Text
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Sign In with Google",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      onPressed: () async {
        //Login here
        FirebaseUser user = await authService.signInWithGoogle();

        if (user != null) {
          //Navigate to logged in page
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoggedInScreen(user, authService)));
        } else {
          //Sign in process failed
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Yay! A SnackBar!')));
        }
      });
}
