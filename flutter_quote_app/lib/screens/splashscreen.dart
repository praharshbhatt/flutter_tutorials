import 'package:flutter/material.dart';
import 'package:flutterquoteapp/models/quote_model.dart';
import 'package:flutterquoteapp/services/api_client.dart';

import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //For the loading indicator
  bool success = false;

  //API Client
  FetchQuotes fetchQuotes = new FetchQuotes();

  //Model
  Quotes quotes;

  @override
  void initState() {
    loadQuotesList();

    super.initState();
  }

  loadQuotesList() async {
    quotes = await fetchQuotes.getQuotes();

    setState(() {
      success = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Quote app.",
          style: TextStyle(fontSize: 16),
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 140,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                //Decoration
                Positioned(right: 0, child: Image.asset("assets/images/decoration-1.png")),
                Positioned(left: 0, top: 0, child: Image.asset("assets/images/decoration-2.png")),
                Positioned(left: 0, bottom: 150, child: Image.asset("assets/images/decoration-3.png")),
                Positioned(top: MediaQuery.of(context).size.height * 0.55, right: 0, child: Image.asset("assets/images/decoration-4.png")),
                Positioned(top: MediaQuery.of(context).size.height * 0.3, right: 0, child: Image.asset("assets/images/decoration-5.png")),

                //Text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        "Never\nmiss\na word",
                        style: theme.textTheme.headline2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text(
                        "manage your reading process",
                        style: theme.textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          //Button
          success == false
              ? CircularProgressIndicator()
              : FlatButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 135, vertical: 18),
                  color: Color.fromARGB(255, 49, 49, 49),
                  child: Text(
                    "GET STARTED",
                    style: theme.textTheme.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(quotes.lstResults)));
                  },
                ),
        ],
      ),
    );
  }
}
