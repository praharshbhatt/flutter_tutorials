import 'package:flutter/material.dart';
import 'package:flutterquoteapp/models/quote_model.dart';
import 'package:flutterquoteapp/services/api_client.dart';

Future<Tags> loadTags() async {
  FetchQuotes fetchQuotes = new FetchQuotes();
  Tags tags = await fetchQuotes.getTags();

  return tags;
}

getQuotesList(BuildContext context, ThemeData theme, List lstQuotes) {
  return Column(
    children: <Widget>[
      //Tags
      FutureBuilder(
        future: loadTags(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
          if (snapshot.connectionState == ConnectionState.none) Center(child: Text("No connection, Please connect to a network and try again"));

          Tags tags = snapshot.data;
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.lstTags.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChoiceChip(
                    selected: false,
                    label: Text(tags.lstTags[index].name),
                  ),
                );
              },
            ),
          );
        },
      ),

      //Quotes
      Container(
        height: MediaQuery.of(context).size.height * 0.75,
        child: ListView.builder(
          itemCount: lstQuotes.length,
          itemBuilder: (BuildContext context, int index) {
            //Get the individual Map
            Map mapQuote = lstQuotes[index];

            //Return the Quote
            return Container(
              padding: EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //Tags
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      mapQuote["tags"].toString().substring(1, mapQuote["tags"].toString().length - 1),
                      style: theme.textTheme.caption.copyWith(fontSize: 16, color: Colors.grey),
                    ),
                  ),

                  //Quote
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      mapQuote["content"],
                      style: theme.textTheme.headline6.copyWith(fontSize: 18, color: Colors.black54),
                    ),
                  ),

                  //Author
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      mapQuote["author"],
                      style: theme.textTheme.caption.copyWith(fontSize: 16, color: Colors.grey),
                    ),
                  ),

                  Divider()
                ],
              ),
            );
          },
        ),
      ),
    ],
  );
}
