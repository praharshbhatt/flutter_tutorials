import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterquoteapp/models/quote_model.dart';
import 'package:flutterquoteapp/screens/quotes_list.dart';
import 'package:flutterquoteapp/screens/random_quote.dart';
import 'package:flutterquoteapp/services/api_client.dart';

class HomeScreen extends StatefulWidget {
  List lstQuotes;

  HomeScreen(this.lstQuotes);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  String strTitle = "Quotes List";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            strTitle,
            style: theme.textTheme.bodyText1,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: theme.backgroundColor,
        elevation: 0,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            strTitle = currentIndex == 0 ? "Quotes List" : "Random Quote";
          });
        },
        items: <BottomNavigationBarItem>[
          //List of quotes
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("Quotes List")),

          //Random Quote
          BottomNavigationBarItem(icon: Icon(Icons.format_quote), title: Text("Random Quote")),
        ],
      ),

      //
      body: currentIndex == 0 ? getQuotesList(context, theme, widget.lstQuotes) : GetRandomQuote(),
    );
  }
}
