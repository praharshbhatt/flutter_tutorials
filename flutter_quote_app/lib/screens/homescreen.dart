import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterquoteapp/models/quote_model.dart';
import 'package:flutterquoteapp/services/api_client.dart';

class HomeScreen extends StatefulWidget {
  List lstQuotes;

  HomeScreen(this.lstQuotes);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Tags> loadTags() async {
    FetchQuotes fetchQuotes = new FetchQuotes();
    Tags tags = await fetchQuotes.getTags();

    return tags;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Flutter Quotes app",
            style: theme.textTheme.bodyText1,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: theme.backgroundColor,
        elevation: 0,
      ),

      //
      body: Column(
        children: <Widget>[
          //Tags
          FutureBuilder(
            future: loadTags(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) return CircularProgressIndicator();
              if (snapshot.connectionState == ConnectionState.none) Center(child: Text("No Data"));

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
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              itemCount: widget.lstQuotes.length,
              itemBuilder: (BuildContext context, int index) {
                //Get the individual Map
                Map mapQuote = widget.lstQuotes[index];

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
      ),
    );
  }
}
