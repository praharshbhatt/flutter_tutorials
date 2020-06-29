import 'package:flutter/material.dart';
import 'package:flutterquoteapp/models/quote_model.dart';
import 'package:flutterquoteapp/services/api_client.dart';

loadRandomQuote() async {
  RandomQuote randomQuote = await FetchQuotes().getRandomQuote();
  return randomQuote;
}

class GetRandomQuote extends StatefulWidget {
  @override
  _GetRandomQuoteState createState() => _GetRandomQuoteState();
}

class _GetRandomQuoteState extends State<GetRandomQuote> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return FutureBuilder(
      future: loadRandomQuote(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return Center(child: CircularProgressIndicator());

        RandomQuote randomQuote = snapshot.data;
        return Container(
          child: ListView(
            children: <Widget>[

              Icon(
                Icons.format_quote,
                size: 32,
              ),

              //Quote
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text(
                  randomQuote.content,
                  style: theme.textTheme.headline4,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      "- " + randomQuote.author,
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                ],
              ),



              FlatButton(
                child: Text("Reload"),
                onPressed: () async {
                  await loadRandomQuote();
                  setState(() {

                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
