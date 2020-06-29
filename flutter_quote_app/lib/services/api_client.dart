import 'package:flutterquoteapp/models/quote_model.dart';
import 'package:http/http.dart' as http;

class FetchQuotes {
  //Gets the list of quotes
  Future<Quotes> getQuotes() async {
    http.Response response;

    response = await http.get("https://api.quotable.io/quotes");

    //Quotes model
    Quotes quotes;

    if (response.statusCode == 200) {
      //successfully loaded

      quotes = Quotes.fromJson(response.body);

      return quotes;
    } else {
      //Error
      return null;
    }
  }

  //Gets the list of all the tags that this API provides
  Future<Tags> getTags() async {
    http.Response response = await http.get("https://api.quotable.io/tags");

    if (response.statusCode == 200) {
      Tags tags = new Tags.fromJson(response.body);
      return tags;
    } else {
      return null;
    }
  }

  Future<RandomQuote> getRandomQuote() async {
    http.Response response = await http.get("https://api.quotable.io/random");

    if (response.statusCode == 200) {
      return RandomQuote.fromJson(response.body);
    } else {
      return null;
    }
  }
}
